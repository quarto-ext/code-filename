# code-filename

An extension that enables you to add a `filename` attribute to code blocks, which is useful if you are documenting the contents of a file and want to be especially clear about the name of the file the code is associated with. 

## Installation

To install this extension in your current directory (or into the Quarto project that you're currently working in),  use the following command:

```
quarto install extension quarto-ext/code-filename
```

## Usage

Add the `filename` attribute to any code block:

````markdown
```{.python filename="matplotlib.py"}
import matplotlib.pyplot as plt
plt.plot([1,23,2,4])
plt.show()
```
```

This results in the following HTML output:

![](https://user-images.githubusercontent.com/104391/178159800-e3b74510-97e7-469c-87cf-b49cac8602f9.png)

Non-HTML formats will still have the filename, but it will simply be shown in bold above the code block.

You can see the published version of this example at <https://quarto-ext.github.io/code-filename/>.

