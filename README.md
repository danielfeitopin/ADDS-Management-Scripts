# ADDS Management Scripts

This repository contains a collection of useful PowerShell scripts for managing Active Directory Domain Services (ADDS). These scripts are designed to simplify common administrative tasks and improve efficiency when working with ADDS.

<div align="center">

![PowerShell Badge](<https://img.shields.io/badge/PowerShell-grey?logo=powershell&logoColor=white&labelColor=grey&color=%235391FE>)
[![License: MIT](<https://img.shields.io/github/license/danielfeitopin/ADDS-Management-Scripts>)](LICENSE "License")
[![GitHub issues](https://img.shields.io/github/issues/danielfeitopin/ADDS-Management-Scripts)](<https://github.com/danielfeitopin/ADDS-Management-Scripts/issues> "Issues")
[![GitHub forks](https://img.shields.io/github/forks/danielfeitopin/ADDS-Management-Scripts)](<https://github.com/danielfeitopin/ADDS-Management-Scripts/fork> "Forks")
![GitHub stars](https://img.shields.io/github/stars/danielfeitopin/ADDS-Management-Scripts)

</div>

## Table of Contents

- [ADDS Management Scripts](#adds-management-scripts)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

Active Directory Domain Services (ADDS) is a powerful directory service used to manage users, groups, computers, and other objects within a Windows domain. This repository provides a set of PowerShell scripts to help administrators streamline various management tasks.

## Features

- `getdisconnectedcomputers.ps1`: Returns a list of computers that have not connected since a specified number of days and their last logon date.
- `getpwdneverexpiresusers.ps1`: Returns a list of users who have the "Password Never Expires" option checked.

## Prerequisites

Before using the scripts, ensure you have the following:

- Windows environment with PowerShell installed.
- Appropriate permissions to manage Active Directory objects.

## Usage

1. Clone this repository to your local machine.
2. Open PowerShell and navigate to the folder containing the scripts.
3. Run the desired script.

> ⚠️ Please use the scripts responsibly and carefully, as they may modify **critical** AD objects.

## Contributing

Contributions are welcome! If you have improvements, bug fixes, or new scripts to add, feel free to submit a pull request.

## License

The content of this repository is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the code, but please include appropriate attribution.
