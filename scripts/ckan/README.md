# CKAN Management Scripts

## Setup

### API Key Configuration

Store your CKAN API key in your environment for security:

```bash
# Add to your ~/.bashrc or ~/.zshrc
export CKAN_API_KEY="your-api-key-here"
```

Then reload your shell configuration:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

## Usage Examples

### Organizations

1. Create organizations:

```bash
python organizations/create.py \
  --api-key $CKAN_API_KEY \
  --json-file examples/organizations.json
```

### Datasets

1. Create datasets:

```bash
python datasets/create.py \
  --api-key $CKAN_API_KEY \
  --json-file examples/dataset.json \
```

2. List all datasets:

```bash
python datasets/list.py \
  --api-key $CKAN_API_KEY \
  --output-file datasets.json
```
