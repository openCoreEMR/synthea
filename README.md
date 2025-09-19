# Synthea Docker

This repository contains a Dockerfile for running [Synthea](https://synthea.mitre.org/), a synthetic patient generator that models the medical history of synthetic patients.

## What is Synthea?

Synthea is an open-source synthetic patient generator developed by MITRE. It creates realistic but not real patient data and associated health records covering every aspect of healthcare. The synthetic data is designed to capture the statistical and epidemiological properties of real populations while containing no actual patient information.

## Usage

### Building the Docker Image

```bash
docker build -t synthea .
```

### Running Synthea

Generate synthetic patients:

```bash
docker run --rm -v $(pwd)/output:/app/output synthea
```

Generate 300 synthetic patients, CCDA only:

```bash
docker run --rm -ti -w "$PWD" -v "$PWD:$PWD" synthea \
       --exporter.fhir.export false \
       --exporter.ccda.export true \
       --generate.only_alive_patients true \
       -p 300
```


### Custom Configuration

To use custom configuration files:

```bash
docker run --rm -v $(pwd)/output:/app/output -v $(pwd)/config:/app/config synthea
```

## Output

Generated patient data will be saved to the `output` directory in various formats including:
- FHIR R4 JSON
- CSV files
- Clinical notes

## Documentation

For more information about Synthea, visit the [official documentation](https://github.com/synthetichealth/synthea).
