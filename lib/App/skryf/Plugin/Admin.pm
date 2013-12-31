package App::skryf::Plugin::Admin;

use Mojo::Base 'Mojolicious';
use DDP;

our $VERSION = '0.001_01'; # VERSION
has path_prefix => '/admin';
has app => '';

sub is_admin {
  my $self = shift;
  return 1 if $self->app->session('user');
  return undef;
}

# sub {
#     my $self = shift;
#     $self->app->log->debug('Checking authentication of admin route.');
#     return $self->app->session('user') || undef;
# }

#     $auth_r->route($self->path_prefix . "settings")->via(qw[GET POST])
#       ->to(
#         namespace => $self->namespace,
#         action    => 'admin_dashboard_settings',
#       )->name('admin_dashboard_settings');


1;
__END__

=head1 NAME

App::skryf::Plugin::Admin - Mojolicious Plugin

=head1 SYNOPSIS

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

=head1 DESCRIPTION

L<App::skryf::Plugin::Admin> is a L<Mojolicious> plugin.

=head1 OPTIONS

=head2 path_prefix

Administration top level path prefix, e.g. /admin

=head2 app

Should be passed an Mojolicious application object.

=head1 METHODS

L<App::skryf::Plugin::Admin> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 is_admin

  $admin->is_admin;

Checks if current session for authenticated user is available.

Extends the authenticated route under admin_prefix, e.g. /admin/blog/dashboard

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=head1 COPYRIGHT AND LICENSE

This plugin is copyright (c) 2013 by Adam Stokes <adamjs@cpan.org>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
