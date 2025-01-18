# Login Project

A secure and scalable Login Project built using **Flask**, **Docker**, and **Terraform**, deployed on **AWS EC2**. This project demonstrates a simple login system with robust DevOps practices, ensuring ease of deployment and scalability.

## Features

- User authentication using Flask
- Containerized application with Docker
- Infrastructure as Code (IaC) using Terraform
- Deployment on AWS EC2
- Secure handling of credentials and environment variables

## Prerequisites

Before getting started, ensure you have the following tools installed:

- [Python](https://www.python.org/) (v3.8+)
- [Docker](https://www.docker.com/)
- [Terraform](https://www.terraform.io/)
- AWS account with EC2 setup
- [Git](https://git-scm.com/)

## Project Structure

```
Login-Project/
├── app/
│   ├── templates/       # HTML templates
│   ├── static/          # CSS, JS, and assets
│   ├── app.py           # Main Flask application
│   ├── config.py        # Configuration settings
│   └── requirements.txt # Python dependencies
├── Dockerfile           # Docker container setup
├── terraform/
│   ├── main.tf          # Terraform configuration
│   ├── variables.tf     # Variable definitions
│   ├── outputs.tf       # Outputs configuration
│   └── provider.tf      # AWS provider settings
├── README.md            # Project documentation
└── .env.example         # Example environment variables
```

## Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Sainirajan/Login-Project.git
cd Login-Project
```

### 2. Create a Virtual Environment and Install Dependencies

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r app/requirements.txt
```

### 3. Configure Environment Variables

Copy the `.env.example` file to `.env` and update the values as required:

```bash
cp .env.example .env
```

### 4. Build and Run the Docker Container

Build the Docker image:

```bash
docker build -t login-project .
```

Run the container:

```bash
docker run -p 5000:5000 --env-file .env login-project
```

Access the application at `http://localhost:5000`.

### 5. Deploy on AWS EC2 Using Terraform

1. Navigate to the `terraform` directory:

   ```bash
   cd terraform
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Preview the infrastructure changes:

   ```bash
   terraform plan
   ```

4. Apply the configuration to deploy:

   ```bash
   terraform apply
   ```

5. Access the application using the public IP of the deployed EC2 instance.

## Usage

- **Register:** Create a new account by providing an email and password.
- **Login:** Authenticate with your registered credentials.
- **Logout:** Securely log out of the session.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Submit a pull request with a detailed explanation.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions or support, feel free to reach out:

- **Author:** Sai Niranjan
- **GitHub:** [Sainirajan](https://github.com/Sainirajan)
- **Email:** sainiranjan@example.com

---

Let me know if you'd like any adjustments or additional sections added!
