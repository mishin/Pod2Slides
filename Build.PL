use strict;
use warnings;
use Module::Build;
use File::HomeDir;
use File::Spec::Functions qw(catdir catfile);

my $builder = Module::Build->new(
    module_name       => 'Pod2Slides',
    license           => 'perl',
    dist_author       => 'Thomas Klausner <domm@cpan.org>',
    dist_version_from => 'lib/Pod2Slides.pm',
    requires          => {
        'Test::More'      => 0,
        'Pod::Simple'     => 3.00,
        'Getopt::Long'    => 2.34,
        'Template'        => 2.10,
        'Class::Accessor' => 0.22,
    },
    tt_files => {
        catfile( 'templates', 'boilerplate.tt' ) =>
          catfile( 'tt', 'boilerplate.tt' ),
        catfile( 'templates', 'default.tt' ) => catfile( 'tt', 'default.tt' ),
        catfile( 'templates', 'fullscreen.tt' ) =>
          catfile( 'tt', 'fullscreen.tt' ),
        catfile( 'templates', 'totalfullscreen.tt' ) =>
          catfile( 'tt', 'totalfullscreen.tt' ),
    },
    script_files => [ catfile( 'bin', 'pod2slides.pl' ) ],
    install_path => { tt => catdir( File::HomeDir->my_home, 'pod2slides' ) },
    add_to_cleanup   => ['Pod2Slides-*'],
    fix_shebang_line => [ catfile( 'bin', 'pod2slides.pl' ) ],
);

$builder->add_build_element('tt');

$builder->create_build_script();
