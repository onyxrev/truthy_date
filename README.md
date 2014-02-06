Truthy Date
========================

Provides super simple getter/setters for datetimes that should also act as booleans.

Usage:
-------
```ruby
class Coffee < ActiveRecord::Base
  extend TruthyDate
  truthy_date :ordered_at,  :as => :ordered
  truthy_date :consumed_at, :as => :empty
end
```

Which lets you do things like:

```ruby
> coffee.ordered = true
true

> coffee.ordered?
true

> coffee.consumed = true
true

> coffee.empty?
true

> coffee.consumed_at
Thu, 06 Feb 2014 17:39:48 UTC +00:00

> coffee.ordered_at
Thu, 06 Feb 2014 17:39:40 UTC +00:00

> coffee.consumed = false
false

> coffee.empty?
false

> coffee.consumed_at
nil
```

The non "?" getter method is also defined in order to play well with the form builders out there:

```ruby
> coffee.empty
false
```
