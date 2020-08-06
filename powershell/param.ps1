param ( [parameter(mandatory=$true,
				   valuefrompipeline=$true)]$object) ($object.GetType()) |
				   format-list fullname, name