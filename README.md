## Github actions 

```
name: Notify deps2.dev

on:
  push:
    branches:
      - main

jobs:
  notify-deps2dev:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Read version
        id: version
        run: echo "::set-output name=VERSION::$(cat version.txt)"

      - name: Notify deps2.dev
        run: |
          curl -X POST "http://54.169.79.9:5000/newVersion" \
          -H "Content-Type: application/json" \
          -d '{
            "package": "VeriTax",
            "version": "${{ steps.version.outputs.VERSION }}"
          }'
```


## Necessary images:


Create instance:

![](./images/Screenshot%202024-10-16%20214031.png)

Setup and Start server:

![](./images/Screenshot%202024-10-16%20215711.png)

Test server:

![](./images/Screenshot%202024-10-16%20220048.png)

Github actions working on push:

![](./images/Screenshot%202024-10-16%20220609.png)

Change version and push to trigger github action:

![](./images/Screenshot%202024-10-16%20220708.png)


successful action:

![](./images/Screenshot%202024-10-16%20220721.png)

test new version:

![](./images/Screenshot%202024-10-16%20220733.png)
