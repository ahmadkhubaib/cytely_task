export default {
    PlotlyHooks: {
        mounted() {
            let trace = {
                x: [],
                y: [],
                type: "scatter"
            };

            let complete_data = [trace];
            let layout = {  title: 'Cytely Graph' };

            Plotly.newPlot('PlotlyHooks', complete_data, layout);

            this.handleEvent("PlotlyHooks", map_data => this.graphHandler(map_data))
        },
        graphHandler: function (map_data) {
            let data = map_data.data
            let categories = map_data.categories

            Plotly.addTraces('PlotlyHooks', {x: data, y: categories});
        }
    }
}