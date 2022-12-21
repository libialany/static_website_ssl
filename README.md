# AWS static website with ssl

I tried with pulumi:
[avoid the prefix](https://www.pulumi.com/docs/intro/concepts/resources/names/#autonaming)

deploy s3 static with terraform:
- terraform

```
cd terraform/static-site/
terraform init
terraform apply
```

`WARGING` manually upload index.html fiel and error.html 

create a public certificate:
- request_certificate

```
bash request_certificate/public_cert.sh
```

create a cloudfront distribution:
- cloudfront_distribution


`EASY WAY BY CONSOLE`

dns configuration(go daddy)
![image](https://user-images.githubusercontent.com/82403984/208913291-300718f5-8ba7-4ebe-b820-e8748c85d300.png)

-----

references:
[cloudfront distribution](https://medium.com/open-devops-academy/create-a-cloudfront-alert-with-terraform-aws-34c7ce294975)

[some error with cloudfront](https://aws.amazon.com/premiumsupport/knowledge-center/resolve-cnamealreadyexists-error/)
