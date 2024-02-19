Describe -Name 'ConvertFrom-HTMLTag' {
    It -Name 'Given a valid URL - Should return the content of the tag' {
        $Content = ConvertFrom-HTMLTag -Tag 'em' -Url "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em"
        $Content[0] | Should -Be '<em>'
        $Content[1] | Should -Be 'do'
        $Content[2] | Should -Be 'had'
        $Content[3] | Should -Be 'Queen Mary'
        $Content[4] | Should -Be 'Queen Mary'
        $Content[5] | Should -Be 'the'
        $Content.Count | Should -Be 6
    }
}