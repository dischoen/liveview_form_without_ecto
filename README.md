# liveview_form_without_ecto
Template for a dynamic form (all form elements are defined on the fly)

I need to create dynamic forms, i.e, the form is defined by a data structure
which contains names (labels), types and initial values for the form elements.

And I do not need a database connection for this.

Schemaless changesets to the rescue!


## Input data

Comes in a map, with keys as the form elements names/labels
and the values are contained in another map, which has the initial value and
the type.

So far, :float, :integer, :boolean and :string are implemented.

```
   form_data = %{"current1"    => %{:value => 0.0,     :type => :float},
                  "iterations" => %{:value => 100,     :type => :integer},
                  "is_good"    => %{:value => :false,  :type => :boolean},
                  "weather"    => %{:value => "windy", :type => :string}}
 ```
 
 The result (with edits by the user) can look like this:
 
 ```
 %{
  "formname" => %{
    "current1"   => "20.0",
    "is_good"    => "false",
    "iterations" => "1004",
    "weather"    => "windy"
  }
}
```

## The files of interest are

| File  | Content |
| ------------- | ------------- |
| lib/dbless_form_web/router.ex  | Routes for the form and the containing view  |
| lib/dbless_form_web/live/tseq_live/index.ex | The parent view |
| lib/dbless_form_web/live/tseq_live/index.html.heex | Template with invocation of the LiveComponent |
| lib/dbless_form_web/live/tseq_live/form_component.ex | The dynamic form |
| lib/dbless_form/executions/tseq.ex  | TBD: dynamic validations (ranges, etc.)  |
