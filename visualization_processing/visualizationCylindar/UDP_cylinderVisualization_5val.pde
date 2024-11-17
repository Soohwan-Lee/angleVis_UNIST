import hypermedia.net.*;

UDP udp;
int port = 9600;

float currPitch = 0;
float currRoll = 0;
float pitchAngularSpeed = 0;
float rollAngularSpeed = 0;
float yawAngularSpeed = 0;

int numSides = 40;
float radius = 100;
float cylinderHeight = 200;
float twistFactor = 0;
float twistSensitivity = 0.01;

void setup() {
  size(800, 600, P3D);
  udp = new UDP(this, port);
  udp.listen(true);
  println("UDP Client initialized at port " + port);
}

void draw() {
  background(255);
  lights();
  translate(width / 2, height * 3 / 4, 0);

  // Roll, Pitch, Yaw 값을 쿼터니언으로 변환하여 독립적인 회전 적용
  applyQuaternionRotation(currPitch, currRoll, 0);

  twistFactor += radians(yawAngularSpeed) * twistSensitivity;
  twistFactor = constrain(twistFactor, -PI, PI);

  fill(150, 150, 150);
  drawTwistedCylinder();

  // Twist 시각화를 위한 선 그리기
  stroke(255, 0, 0);
  strokeWeight(3);
  line(radius, -cylinderHeight, 0, radius * cos(twistFactor), 0, radius * sin(twistFactor));
}

// Pitch와 Roll을 독립적으로 적용하기 위해 쿼터니언 회전 사용
void applyQuaternionRotation(float pitch, float roll, float yaw) {
  // 각 축의 회전을 라디안으로 변환
  float pitchRad = radians(pitch);
  float rollRad = radians(roll);
  float yawRad = radians(yaw);

  // Roll, Pitch, Yaw에 따른 개별적인 회전 행렬 적용
  rotateZ(rollRad);
  rotateX(-pitchRad);
  rotateY(yawRad);
}

void drawTwistedCylinder() {
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= numSides; i++) {
    float angle = TWO_PI / numSides * i;
    float x1 = cos(angle) * radius;
    float z1 = sin(angle) * radius;
    float y1 = -cylinderHeight;
    float x2 = cos(angle + twistFactor) * radius;
    float z2 = sin(angle + twistFactor) * radius;
    float y2 = 0;
    
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
  }
  endShape();

  // 원기둥 상단과 하단 닫기
  beginShape(TRIANGLE_FAN);
  vertex(0, -cylinderHeight, 0);
  for (int i = 0; i <= numSides; i++) {
    float angle = TWO_PI / numSides * i;
    float x = cos(angle) * radius;
    float z = sin(angle) * radius;
    vertex(x, -cylinderHeight, z);
  }
  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(0, 0, 0);
  for (int i = 0; i <= numSides; i++) {
    float angle = TWO_PI / numSides * i;
    float x = cos(angle + twistFactor) * radius;
    float z = sin(angle + twistFactor) * radius;
    vertex(x, 0, z);
  }
  endShape();
}

void receive(byte[] data, String ip, int port) {
  String inputData = new String(data);
  if (inputData != null) {
    inputData = trim(inputData);
    println("Received Data: " + inputData);
    float[] parsedData = parseStringData(inputData);
    if (parsedData != null) {
      currPitch = parsedData[0];
      currRoll = parsedData[1];
      pitchAngularSpeed = parsedData[2];
      rollAngularSpeed = parsedData[3];
      yawAngularSpeed = parsedData[4];
    }
  }
}

float[] parseStringData(String data) {
  if (data.length() > 0 && data.charAt(0) == '<' && data.charAt(data.length() - 1) == '>') {
    data = data.substring(1, data.length() - 1);
    String[] parts = data.split(",");
    if (parts.length == 5) {
      float[] floats = new float[5];
      try {
        for (int i = 0; i < parts.length; i++) {
          floats[i] = float(parts[i]);
        }
        return floats;
      } catch (NumberFormatException e) {
        println("Error: One of the values is not a valid float.");
        return null;
      }
    } else {
      println("Error: The data does not contain exactly five float values.");
      return null;
    }
  } else if (data.length() > 0 && data.charAt(0) == '[' && data.charAt(data.length() - 1) == ']') {
    String message = data.substring(1, data.length() - 1);
    if (message.equals("calib")) {
      twistFactor = 0;
      return null;
    } else {
      return null;
    }
  } else {
    println("Invalid data format");
    return null;
  }
}
