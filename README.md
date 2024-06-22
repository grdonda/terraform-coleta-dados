# Coleta de dados via Kinesis

objetivo é coletar dados via Kinesis e armazenar no S3

## infraestrutura

- Kinesis data stream
- Kinesis data firehose
- S3
- Glue
- Athena

## PutRecord

Envio de objeto base64 encoded

## PutRecords

Envio de uma lista de objetos

## Collections

```
curl --location 'https://kinesis.us-east-1.amazonaws.com' \
--header 'Content-Type: application/x-amz-json-1.1' \
--header 'X-Amz-Target: Kinesis_20131202.PutRecord' \
--header 'X-Amz-Content-Sha256: beaead3198f7da1e70d03ab969765e0821b24fc913697e929e726aeaebf0eba3' \
--header 'X-Amz-Date: 20240513T204326Z' \
--header 'Authorization: AWS4-HMAC-SHA256 Credential=AKIA4GVF5H76SMYVQMFX/20240513/us-east-1/kinesis/aws4_request, SignedHeaders=content-length;content-type;host;x-amz-content-sha256;x-amz-date, Signature=f1a13dca5fb418896553e308ebb305c2ed2df2b5ee1cfdd7c10a22c00267f39f' \
--data '{
   "Data": "ewogICAgInVzZXJuYW1lIjoiZGV1IGNlcnRvIGFzc2ltIGFzZGFzZCAiLAogICAgInBhc3N3b3JkIjoib3V0cmEgY29pc2Egc2RmIHNkZiBzZGYgc2RmICIKfQ==",
   "PartitionKey": "123456",
   "StreamName": "kinesis_firehose"
}'
```

```
curl --location 'https://kinesis.us-east-1.amazonaws.com/' \
--header 'X-Amz-Target: Kinesis_20131202.PutRecords' \
--header 'Content-Type: application/x-amz-json-1.1' \
--header 'X-Amz-Content-Sha256: beaead3198f7da1e70d03ab969765e0821b24fc913697e929e726aeaebf0eba3' \
--header 'X-Amz-Date: 20240513T204448Z' \
--header 'Authorization: AWS4-HMAC-SHA256 Credential=AKIA4GVF5H76SMYVQMFX/20240513/us-east-1/kinesis/aws4_request, SignedHeaders=content-length;content-type;host;x-amz-content-sha256;x-amz-date, Signature=468e5fe8f41ac8cbec76f0ceeeabb76914d8b426f9115291c51c9d6ce2f9f438' \
--data '{
    "Records": [
        {
            "Data": "ewogICAgInVzZXJuYW1lIjoibGlzdGEgMiAiLAogICAgInBhc3N3b3JkIjoib3V0cmEiCn0=",
            "PartitionKey": "123456"
        },
        {
            "Data": "ewogICAgInVzZXJuYW1lIjoiZGV1IGJvbSBsaXN0YSAyICIsCiAgICAicGFzc3dvcmQiOiJvdXRyYSBjb2lzYSBzZGYgc2RmIHNkZiBzZGYgIgp9",
            "PartitionKey": "999999"
        }
    ],
    "StreamName": "kinesis_firehose"
}'
```

## planejamento

```
    kinesis data stream -> kinesis data firehose -> s3 -> glue -> athena
```

