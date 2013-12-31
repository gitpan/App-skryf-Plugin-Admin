package App::skryf::Plugin::Admin::Controller;

our $VERSION = '0.001_01'; # VERSION

use Mojo::Base 'Mojolicious::Controller';
use Method::Signatures;

method admin_dashboard {
    $self->render('admin/dashboard');
}

method admin_dashboard_settings {
    my $req       = $self->req->method;
    my $model     = $self->store('Admin::Model::SiteConf');
    my $usermodel = $self->store('Admin::Model::User');
    my $site      = $model->get;
    my $user      = $usermodel->get($self->session->{username});
    if ($req eq "POST") {
        $site->{site}          = $self->param('site'),
          $site->{title}       = $self->param('title'),
          $site->{author}      = $self->param('author'),
          $user->{email}       = $self->param('email'),
          $user->{password}    = $self->param('password'),
          $site->{description} = $self->param('description'),
          $site->{tz}          = $self->param('tz'),
          $site->{secret}      = $self->param('secret'),
          $model->save($site);
        $usermodel->save($user);
        $self->flash(message => 'Site Settings saved.');
        $self->redirect_to('admin_dashboard_settings');
    }
    $self->stash(siteconf => $site);
    $self->stash(userconf => $user);
    $self->render('admin/dashboard_settings');
}


1;
__END__

=head1 NAME

App::skryf::Plugin::Admin::Controller - Admin plugin controller

=head1 DESCRIPTION

Admin plugin for handling dashboard views and other core system
specific tasks.

=head1 CONTROLLERS

=head2 B<admin_dashboard>

Index controller for admin dashboard

=cut
