# Rebuild of jmx-exporter Docker image for Dataworks

## A process for exposing JMX Beans via HTTP for Prometheus consumption.
JMX to Prometheus exporter: a collector that can configurably scrape and expose mBeans of a JMX target. This is a rebuild of
https://github.com/bitnami/bitnami-docker-jmx-exporter so it can be deployed to AWS.

The base code for this image can be found [here](https://github.com/prometheus/jmx_exporter)

## Usage
This image should be run as a sidecar of the container whose Jmx metrics you want to expose to Prometheus.
A configuration file needs to be provided via the following environment variables:

|Key|Description|
|:---|:---|
| JMX_EXPORTER_CONFIG_S3_BUCKET   | The ID of the config S3 bucket                           |
| JMX_EXPORTER_CONFIG_S3_PREFIX   | The directory path of the config files within the bucket |
| AWS_ACCESS_KEY_ID          | AWS access key                           |
| AWS_SECRET_ACCESS_KEY      | AWS secret access key |

Example configuration can be found [here](https://github.com/prometheus/jmx_exporter#configuration)