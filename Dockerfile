FROM tekintian/alpine-java:1.8.0_291
LABEL maintainer="TekinTian <tekintian@gmail.com>"

COPY ./target/rsa-crypt-0.0.1-demo.jar /opt/app.jar

# 定义默认参数
ENV RSA_PRIVATE_KEY="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMpegMkZbc3nBe5s8XUzkT8LbPinS+5cX/odK9xZhNxlCORCWSVEvEeHxNC/EJEtarZtwz4PJ7kMFy1YDKHAmKfSttKHrwNlKg7PRhxzM1G+B7Rhninzg8KmiLH27XSxP11PGNA3wU34gcIeqsmjAPBQSZXR2nowTnjbrIxIbvxAgMBAAECgYEAksVznD9YO7UXsAQZvhMv2VOp71njCsw1HpOshXEL6l2FokXmQX2XVDxp9GtxGUlhMo8vihJ6TKih8mb5ZKaCVGWBZ1Z0jl9vzHe6mjBXV4qkGXlcCxj7JyJjORROkEQYRRHFI38SDlqOa3eZlSw/lQMYT18TZYtYjDeEgb2zfH0CQQD1MGBQXu6Q3Q1TzkBldQeqi9qhlVLcq/Jdkt0DwMILjgiv357VTZksJbgFU9GENNTrMfDyS8P8xDNvcCLpnCW3AkEAy8RpCTe8DlEAgfTEqLfHmGJAaKc/z3lkfHuYr8MQz0HrgnzYLWW7iFz7V0pKWfpju/Z2LEEtik7qygZwD9xrlwJAcrmNB240AHJ+Tu1d8lsdGC7SQPMGz5xhDmmuopfp89Akvm5K+pGRjzei8FM04MB7tAUtMaJD9Ry02HrGyzo15wJAL+DjqUXOSzLfQqnnt5kPLhAQAEckKDTm1pUYCFx2S6y6kLuS8//Oc7kdWaJcHA5IdvbvR3C9KZ1nb7bZh/CL2wJBAIkDsrysdrz3F6ATIyqoBWTILThAhRl1V/JAw4T+X7vio7kiy2ORdNk5H92dTEWh91CU+qFTnyW3t9LdUydKtBo=" \
    RSA_PUBLIC_KEY="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDKXoDJGW3N5wXubPF1M5E/C2z4p0vuXF/6HSvcWYTcZQjkQlklRLxHh8TQvxCRLWq2bcM+Dye5DBctWAyhwJin0rbSh68DZSoOz0YcczNRvge0YZ4p84PCpoix9u10sT9dTxjQN8FN+IHCHqrJowDwUEmV0dp6ME5426yMSG78QIDAQAB"

WORKDIR /opt
EXPOSE 8080
#-D 是新增参数，参数的名字叫 java.security.egd ，参数的值叫 file:/dev/./urandom，是为了解决随机数生成的问题
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/app.jar"]
