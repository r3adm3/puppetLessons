define web_user::user (
  $content = "<h1>Welcome to ${title}'s home page!</h1>",
  $password = undef,
){
    $home_dir = "/home/${title}"
    $public_html = "${home_dir}/public_html"
    user { $title:
        ensure   => present,
        password => $password,
      }
    file { [$home_dir, $public_html]:
        ensure           => directory,
        owner        => $title,
        group    => $title,
        mode => '0775',
      }
    file {"${public_html}/index.html":
      ensure  => file,
      owner   => $title,
      group   => $title,
      replace => true, 
      content => $content,
      mode    => '0664',  
    }
}
