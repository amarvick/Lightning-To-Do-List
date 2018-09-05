public with sharing class MultiselectController {
    // SelectOption lists for public consumption
    public SelectOption[] leftOptions { get; set; }
    public SelectOption[] rightOptions { get; set; }
    
    
    // Parse &-separated values and labels from value and 
    // put them in option
    private void setOptions(SelectOption[] options, String value) {
        options.clear();
        System.debug('options: ' + options);
        String[] parts = value.split('&');
        System.debug('parts: ' + parts);
        for (Integer i=0; i<parts.size()/2; i++) {
            System.debug('beginning iteration: ' + i);
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i*2], 'UTF-8'),
            EncodingUtil.urlDecode(parts[(i*2)+1], 'UTF-8')));
            System.debug('option after Encoding Add: ' + options);
        }
    }
    
    // Backing for hidden text field containing the options from the
    // left list
    public String leftOptionsHidden { get; set {
           leftOptionsHidden = value;
           setOptions(leftOptions, value);
        }
    }
    
    // Backing for hidden text field containing the options from the
    // right list
    public String rightOptionsHidden { get; set {
           rightOptionsHidden = value;
           setOptions(rightOptions, value);
        }
    }
}