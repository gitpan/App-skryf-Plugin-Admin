package App::skryf::Plugin::Admin::Model::SiteConf;

our $VERSION = '0.001_01'; # VERSION

use Mojo::Base 'App::skryf::Model::Base';
use Method::Signatures;

method site {
    $self->mgo->db->collection('siteconf');
}

method get {
    $self->site->find_one;
}

method create ($attrs) {
    $self->site->insert($attrs);
}

method save ($attrs) {
    $self->site->save($attrs);
}

package App::skryf::Plugin::Admin::Model::User;

use Mojo::Base 'App::skryf::Model::Base';
use Method::Signatures;
use Mango::BSON ':bson';

method users {
    $self->mgo->db->collection('users');
}

method create ($email, $password, $attrs = {}) {
    my $user = $self->users->find_one({email => $email});
    my $bson = {
      now => bson_time,
      email => $email,
      password => $password,
      attrs => $attrs,
    };
    if (!$user) {
        $self->users->insert($bson);
    }
    return 1;
}

method get ($email) {
    $self->users->find_one({email => $email});
}

method remove ($email) {
    $self->users->remove({email => $email});
}

method check ($email, $password) {
    my $user = $self->users->find_one({email => $email});
    return 1 if $user->{password} eq $password;
    return undef;
}

method save ($user) {
  $self->users->save($user);
}

1;
