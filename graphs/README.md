# Graph databases lab
In this lab we'll have the opportunity to get hands on experience with a relational database. [AWS Neptune](https://aws.amazon.com/neptune/) using the Uber
example we've been discussing during classes.

## Infrastructure
As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template but this time we'll be using an impressive template provided by AWS that I think will give us a great experience.

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Now open [https://aws.amazon.com/blogs/database/analyze-amazon-neptune-graphs-using-amazon-sagemaker-jupyter-notebooks/](https://aws.amazon.com/blogs/database/analyze-amazon-neptune-graphs-using-amazon-sagemaker-jupyter-notebooks/). 
1. Scroll down to the `Launch the Neptune-SageMaker stack` section and click on the 'Launch Stack' button on your preferred Region (if no preference, N.Virginia is usually cheaper)
1. In the 'Quick create stack' shown window select the smallest possible DbInstanceType, mark the check boxes and click the 'Create Stack' orange button.
1. Creation process should successfully finish after ~20 minutes. This time there are nested stacks! This time we're creating a [Neptune Workbench](https://docs.aws.amazon.com/neptune/latest/userguide/notebooks-visualization.html) instance that will allow us to visualize the graphs we're working with.
1. Follow the next two steps ('Start your notebook instance' and 'Browse and run the content') of [the tutorial](https://aws.amazon.com/blogs/database/analyze-amazon-neptune-graphs-using-amazon-sagemaker-jupyter-notebooks/).
1. Now that you've interacted with a notebook and visualized a couple graphs let's create our Uber one.
    1. Go to the Jupyter explorer by clicking on the Jupyter icon on top of the screen.
    1. Open the 'Neptune' folder (you should see a couple folders: `Getting-Started` and `util`)   
    1. Now click the Upload button. Select the `uber.ipynb` file on this very same directory and upload it to your Jupyter workspace.
    1. Open it and run all the cells in order:
       1. First cell will reset the graph
       1. Second will populate the graph with some Uber relevant data
       1. Third cell will define the helper `formatter` method
       1. Run fourth cell. You should now see the full graph.
       1. Run the fifth one. You should now see just the `Driver` - `Car` relationships.
1. Activity (Remember to rerun all cells for changes to have effect): 
    1. Add a new Driver (Rafael Nadal) that drives the Renault Clio too
1. Challenge: Add a new friendship relationship among drivers
1. Remember to delete the Stacks to avoid getting out of AWS credits!