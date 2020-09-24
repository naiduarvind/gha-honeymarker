# `gha-honeymarker` Action

![release](/assets/honeymarker.gif)

This GitHub Action adds a marker from your deploy workflows using [Honeycomb's marker tool][honeymarker]. It annotates the timeline with a marker and optional metadata from the workflow and will always send a marker for the deploy, even if the deploy failed.

`gha-honeymarker` should be added after a deploy indicating a successful change or otherwise. Every job will create a separate marker.

⚠️ Limitations:

- Only works on Linux hosts.
- If downloading honeymarker fails or if running honeymarker fails (i.e. a bug in honeymarker), the entire job will fail.

[honeymarker]: https://docs.honeycomb.io/working-with-your-data/customizing-your-query/markers/

## How to use it

Put the action in the beginning of your worflow:

```yaml
- uses: naiduarvind/gha-honeymarker@main
  with:
    # Required: Honeycomb API key - needed to send markers.
    apikey: ${{ secrets.BUILDEVENTS_APIKEY }}

    # Required: The Honeycomb dataset to use.
    dataset: gha-honeymarker

    # Optional: The identifier for the marker.
    type: ${{ github.workflow }}

    # Optional: The message describing the marker.
    message: ${{ github.run-id}}-${{ job.status }} 


  # 'honeymarker add' should be placed after a deploy to indicate a change is successful or otherwise.
```

### Inputs

Name         | Required | Description                                                       | Type   | Default
-------------|----------|-------------------------------------------------------------------|--------|--------
`apikey`     | yes      | API key used to communicate with the Honeycomb API.               | string | 
`dataset`    | yes      | Honeycomb dataset to use.                                         | string |
`type`       | no       | Identifier for the marker (default = "workflow name").            | string | ${{ github.workflow }}
`message`    | no       | The message describing the marker (default = "job id-job status").| string | ${{ github.run-id}}-${{ job.status }} 

### Outputs

No outputs are set as of now.

## Example

This repository has its own workflow which will run every 15 minutes. See [.github/workflows/integration.yaml](./.github/workflows/integration.yaml).

This workflow will create the following marker in Honeycomb:

![Marker created in Honeycomb](/assets/marker.png)

## License

This Action is distributed under the terms of the MIT license, see [LICENSE](./LICENSE) for details.
