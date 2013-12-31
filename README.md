# NAME

App::skryf::Plugin::Admin - Mojolicious Plugin

# SYNOPSIS

    # Administration section
    my $admin = App::skryf::Plugin::Admin->new(app => $app);
    my $auth_r = $app->routes->under($admin->is_admin);
    if ($auth_r) {
        $auth_r->route($admin->path_prefix . '/blog')->via('GET')->to(
            cb => sub {
                my $self = shift;
                $self->stash(postlist => $self->model->all);
                $self->render('/blog/dashboard');
            }
        )->name('admin_blog_dashboard');
    }

# DESCRIPTION

[App::skryf::Plugin::Admin](https://metacpan.org/pod/App::skryf::Plugin::Admin) is a [Mojolicious](https://metacpan.org/pod/Mojolicious) plugin.

# OPTIONS

## path\_prefix

Administration top level path prefix, e.g. /admin

## app

Should be passed and Mojolicious application object.

# METHODS

[App::skryf::Plugin::Admin](https://metacpan.org/pod/App::skryf::Plugin::Admin) inherits all methods from
[Mojolicious::Plugin](https://metacpan.org/pod/Mojolicious::Plugin) and implements the following new ones.

## is\_admin

    $admin->is_admin;

Checks if current session for authenticated user is available.

Extends the authenticated route under admin\_prefix, e.g. /admin/blog/dashboard

# SEE ALSO

[Mojolicious](https://metacpan.org/pod/Mojolicious), [Mojolicious::Guides](https://metacpan.org/pod/Mojolicious::Guides), [http://mojolicio.us](http://mojolicio.us).

# COPYRIGHT AND LICENSE

This plugin is copyright (c) 2013 by Adam Stokes <adamjs@cpan.org>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
