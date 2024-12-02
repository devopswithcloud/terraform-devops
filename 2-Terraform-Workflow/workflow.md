### **Terraform Workflow with  Example**

The Terraform workflow involves four main steps: **Write**, **Initialize**, **Plan**, and **Apply**. Below, we'll use  AWS EC2 instance example to go through the workflow.

---

#### **Step 1: Write**
Write the configuration for the provider and the EC2 instance. Here's your example:

```hcl
# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

# Create an EC2 machine
resource "aws_instance" "name" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
}
```

---

#### **Step 2: Initialize**
The `terraform init` command sets up your working directory by:
- Downloading the required provider plugins.
- Preparing the backend for storing the Terraform state.

Run this command in the directory containing your `main.tf` file:

```bash
terraform init
```

Expected Output:
- Provider plugin for AWS is downloaded.
- Confirmation message like `Terraform has been successfully initialized!`

---

#### **Step 3: Plan**
The `terraform plan` command previews the actions Terraform will take to create or modify your infrastructure.

Run:
```bash
terraform plan
```

Expected Output:
- Terraform will display a list of resources it plans to create.
- Example:
  ```
  Plan: 1 to add, 0 to change, 0 to destroy.
  ```

---

#### **Step 4: Apply**
The `terraform apply` command applies the planned changes to your infrastructure.

Run:
```bash
terraform apply
```

- Terraform will show the planned changes again and prompt for confirmation.
- Type `yes` to proceed.

Expected Output:
- Terraform creates the EC2 instance.
- Example output:
  ```
  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
  ```

---

#### **Step 5: Verify**
Once the `apply` command completes:
- Verify the EC2 instance in the AWS Management Console under the `us-east-1` region.

---

#### **Optional Step 6: Destroy**
To clean up and remove the resources created by Terraform, use the `terraform destroy` command:

```bash
terraform destroy
```

Expected Output:
- Terraform will show the list of resources to be destroyed and prompt for confirmation.
- Type `yes` to confirm.

---

### **Full Command Workflow**

1. **Initialize**:
   ```bash
   terraform init
   ```

2. **Plan**:
   ```bash
   terraform plan
   ```

3. **Apply**:
   ```bash
   terraform apply
   ```

4. **Destroy (if needed)**:
   ```bash
   terraform destroy
   ```

---
