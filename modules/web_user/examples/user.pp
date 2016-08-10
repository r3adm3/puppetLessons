web_user::user {'shelob':}
web_user::user {'frodo':
    content  => 'Custom Content!',
    password => pw_hash ('sting', 'SHA-512', 'mysalt'),
}
