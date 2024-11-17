# Angle Visualization with Bluetooth Data

[한국어 설명은 아래에 있습니다.](#블루투스-데이터를-이용한-각도-시각화)

## Description

This repository contains two main components:

- **Python Script (`bluetooth_finalModule_GUI.py`)**: A program that receives data via Bluetooth and outputs it.
- **Processing Sketches (`UDP_cylinderVisualization_5val.pde`, `UDP_dataMonitor_5val.pde`)**: Sketches that receive data from the Python program over UDP and visualize it.

**Note**: You don't need any coding knowledge to run these files.

## Table of Contents

- [Angle Visualization with Bluetooth Data](#angle-visualization-with-bluetooth-data)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [1. Install Anaconda](#1-install-anaconda)
    - [2. Set Up the Anaconda Virtual Environment](#2-set-up-the-anaconda-virtual-environment)
    - [3. Install Processing](#3-install-processing)
  - [Running the Programs](#running-the-programs)
    - [1. Run the Python Program](#1-run-the-python-program)
    - [2. Create an Executable with PyInstaller (Optional)](#2-create-an-executable-with-pyinstaller-optional)
    - [3. Run the Processing Sketches](#3-run-the-processing-sketches)
  - [Contact](#contact)
- [블루투스 데이터를 이용한 각도 시각화](#블루투스-데이터를-이용한-각도-시각화)
  - [설명](#설명)
  - [목차](#목차)
  - [사전 준비](#사전-준비)
  - [설치 방법](#설치-방법)
    - [1. Anaconda 설치](#1-anaconda-설치)
    - [2. Anaconda 가상 환경 설정](#2-anaconda-가상-환경-설정)
    - [3. Processing 설치](#3-processing-설치)
  - [프로그램 실행](#프로그램-실행)
    - [1. Python 프로그램 실행](#1-python-프로그램-실행)
    - [2. PyInstaller로 실행 파일 생성 (선택 사항)](#2-pyinstaller로-실행-파일-생성-선택-사항)
    - [3. Processing 스케치 실행](#3-processing-스케치-실행)
  - [문의](#문의)

## Prerequisites

- **Anaconda**: For managing the Python environment.
- **Processing**: For data visualization.
- **Anaconda Environment File**: `environment.yaml` included in this repository.

## Installation

### 1. Install Anaconda

Download and install Anaconda for Windows by following the [official installation guide](https://docs.anaconda.com/anaconda/install/windows/).

### 2. Set Up the Anaconda Virtual Environment

An `environment.yaml` file is provided in this repository, which includes all the necessary libraries. You can create the virtual environment and install all dependencies with a single command.

**Installation Steps:**

1. **Open Anaconda Prompt**

   - Click on the **Start Menu**, search for **Anaconda Prompt**, and open it.

2. **Navigate to the Project Folder**

   Assuming you have cloned or downloaded the `angleVis_UNIST` repository to your desktop:

   ```bash
   cd %USERPROFILE%\Desktop\angleVis_UNIST
   ```

   For Windows users, `%USERPROFILE%` automatically points to your user directory.

3. **Create the Virtual Environment**

   Run the following command:

   ```bash
   conda env create -f environment.yaml
   ```

   This command will:

   - Create a new virtual environment as specified in `environment.yaml`.
   - Install all the required packages.

4. **Activate the Environment**

   After creating the environment, activate it using:

   ```bash
   conda activate sensorModule
   ```

### 3. Install Processing

Download and install Processing from the [official website](https://processing.org/).

## Running the Programs

### 1. Run the Python Program

1. **Ensure the Environment is Activated**

   ```bash
   conda activate sensorModule
   ```

2. **Navigate to the Python Script Folder**

   ```bash
   cd %USERPROFILE%\Desktop\angleVis_UNIST\bluetoothReceiver_python
   ```

3. **Run the Python Script**

   ```bash
   python bluetooth_finalModule_GUI.py
   ```

   The GUI application should now launch and start receiving Bluetooth data.

### 2. Create an Executable with PyInstaller (Optional)

If you want to create an executable file for easier distribution, you can use PyInstaller.

1. **Install PyInstaller**

   If PyInstaller is not already installed, install it using:

   ```bash
   pip install pyinstaller
   ```

2. **Generate the Executable**

   Run the following command:

   ```bash
   pyinstaller --windowed --name "BLE_Receiver" bluetooth_finalModule_GUI.py
   ```

   This will create an executable named `BLE_Receiver.exe` in the `dist` folder.

### 3. Run the Processing Sketches

1. **Open Processing**

   Open the Processing application you installed earlier.

2. **Open the Processing Sketch**

   In Processing, go to **File > Open**, and navigate to:

   - For the cylinder visualization:

     ```
     Desktop/angleVis_UNIST/visualization_processing/visualizationCylinder/UDP_cylinderVisualization_5val/UDP_cylinderVisualization_5val.pde
     ```

   - For the data monitor:

     ```
     Desktop/angleVis_UNIST/visualization_processing/visualizationMonitor/UDP_dataMonitor_5val/UDP_dataMonitor_5val.pde
     ```

3. **Run the Processing Sketch**

   Once the sketch is open, simply press the **Run** button (the triangle icon at the top). Processing will guide you through any additional steps if necessary.

**Note**: The Processing sketches should be run **after** the Python program is running.

## Contact

For any questions or issues, please open an issue on the [GitHub repository](https://github.com/Soohwan-Lee/angleVis_UNIST).

------

# 블루투스 데이터를 이용한 각도 시각화

[For English instructions, click here.](#angle-visualization-with-bluetooth-data)

## 설명

이 저장소는 두 개의 주요 구성 요소로 이루어져 있습니다:

- **Python 스크립트 (`bluetooth_finalModule_GUI.py`)**: 블루투스를 통해 데이터를 수신하고 출력하는 프로그램입니다.
- **Processing 스케치 (`UDP_cylinderVisualization_5val.pde`, `UDP_dataMonitor_5val.pde`)**: Python 프로그램으로부터 UDP로 데이터를 수신하고 이를 시각화하는 스케치입니다.

**참고**: 이 파일들을 실행하는 데 코딩 지식이 필요하지 않습니다.

## 목차

- [사전 준비](#사전-준비)
- 설치 방법
  - [1. Anaconda 설치](#1-anaconda-설치)
  - [2. Anaconda 가상 환경 설정](#2-anaconda-가상-환경-설정)
  - [3. Processing 설치](#3-processing-설치)
- 프로그램 실행
  - [1. Python 프로그램 실행](#1-python-프로그램-실행)
  - [2. PyInstaller로 실행 파일 생성 (선택 사항)](#2-pyinstaller로-실행-파일-생성-선택-사항)
  - [3. Processing 스케치 실행](#3-processing-스케치-실행)
- [문의](#문의)

## 사전 준비

- **Anaconda**: Python 환경 관리를 위해 필요합니다.
- **Processing**: 데이터 시각화를 위해 필요합니다.
- **Anaconda 환경 파일**: 이 저장소에 포함된 `environment.yaml` 파일.

## 설치 방법

### 1. Anaconda 설치

[공식 설치 가이드](https://docs.anaconda.com/anaconda/install/windows/)를 따라 Windows용 Anaconda를 다운로드하고 설치하세요.

### 2. Anaconda 가상 환경 설정

`environment.yaml` 파일에는 필요한 모든 라이브러리가 포함되어 있습니다. 단일 명령으로 가상 환경을 생성하고 모든 종속성을 설치할 수 있습니다.

**설치 단계:**

1. **Anaconda Prompt 열기**

   - **시작 메뉴**에서 **Anaconda Prompt**를 검색하여 엽니다.

2. **프로젝트 폴더로 이동**

   `angleVis_UNIST` 저장소를 바탕화면에 복제하거나 다운로드했다고 가정합니다:

   ```bash
   cd %USERPROFILE%\Desktop\angleVis_UNIST
   ```

   Windows 사용자에게 `%USERPROFILE%`은 사용자 디렉토리를 자동으로 가리킵니다.

3. **가상 환경 생성**

   다음 명령을 실행하세요:

   ```bash
   conda env create -f environment.yaml
   ```

   이 명령은:

   - `environment.yaml`에 지정된 대로 새로운 가상 환경을 생성합니다.
   - 필요한 모든 패키지를 설치합니다.

4. **환경 활성화**

   환경을 생성한 후 다음 명령으로 활성화합니다:

   ```bash
   conda activate sensorModule
   ```

### 3. Processing 설치

[공식 웹사이트](https://processing.org/)에서 Processing을 다운로드하여 설치합니다.

## 프로그램 실행

### 1. Python 프로그램 실행

1. **환경이 활성화되어 있는지 확인**

   ```bash
   conda activate sensorModule
   ```

2. **Python 스크립트 폴더로 이동**

   ```bash
   cd %USERPROFILE%\Desktop\angleVis_UNIST\bluetoothReceiver_python
   ```

3. **Python 스크립트 실행**

   ```bash
   python bluetooth_finalModule_GUI.py
   ```

   GUI 애플리케이션이 실행되어 블루투스 데이터를 수신하기 시작합니다.

### 2. PyInstaller로 실행 파일 생성 (선택 사항)

배포를 쉽게 하기 위해 실행 파일을 생성할 수 있습니다.

1. **PyInstaller 설치**

   PyInstaller가 설치되어 있지 않다면 다음 명령으로 설치합니다:

   ```bash
   pip install pyinstaller
   ```

2. **실행 파일 생성**

   다음 명령을 실행하세요:

   ```bash
   pyinstaller --windowed --name "BLE_Receiver" bluetooth_finalModule_GUI.py
   ```

   이것은 `dist` 폴더에 `BLE_Receiver.exe` 실행 파일을 생성합니다.

### 3. Processing 스케치 실행

1. **Processing 열기**

   이전에 설치한 Processing 애플리케이션을 엽니다.

2. **Processing 스케치 열기**

   Processing에서 **File > Open**으로 이동하여 다음 경로로 이동합니다:

   - 실린더 시각화의 경우:

     ```
     Desktop/angleVis_UNIST/visualization_processing/visualizationCylinder/UDP_cylinderVisualization_5val/UDP_cylinderVisualization_5val.pde
     ```

   - 데이터 모니터의 경우:

     ```
     Desktop/angleVis_UNIST/visualization_processing/visualizationMonitor/UDP_dataMonitor_5val/UDP_dataMonitor_5val.pde
     ```

3. **Processing 스케치 실행**

   스케치를 열었으면, **Run** 버튼(상단의 삼각형 아이콘)을 클릭하세요. Processing은 필요한 추가 단계가 있으면 안내해 줄 것입니다.

**주의**: Processing 스케치는 Python 프로그램이 실행된 **후에** 실행해야 합니다.

## 문의

질문이나 문제가 있으시면 [GitHub 저장소](https://github.com/Soohwan-Lee/angleVis_UNIST)에 이슈를 등록해 주세요.