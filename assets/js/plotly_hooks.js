export default {
    PlotlyHooks: {
        mounted() {
            this.handleEvent("PlotlyHooks", map_data => {
                let data = map_data.data
                let categories = map_data.categories

                let complete_data = [
                    {
                        histfunc: "count",
                        data: data,
                        categories: categories,
                        type: "histogram",
                        name: "count"
                    },
                    {
                        histfunc: "sum",
                        data: data,
                        categories: categories,
                        type: "histogram",
                        name: "sum"
                    }
                ]
                Plotly.newPlot('PlotlyHooks', complete_data)
            })


        }
    }
}

