Name:           ldap-git-backup
Summary:        Back up LDAP database in an Git repository
Version:        1.0.7
Release:        1
License:        GPLv3+
Url:            https://github.com/elmar/ldap-git-backup
BuildArch:      noarch
Source:         https://github.com/elmar/ldap-git-backup/archive/%{version}-%{release}.tar.gz
BuildRequires:  autoconf
BuildRequires:  automake
AutoReq:        yes

%description
ldap-git-backup (creates and) updates a Git repository which contains the
current LDIF dump of an LDAP directory.  Given that writes are rare in an LDAP
directory and confined to a few entries for each write Git will store the
entire history of an LDAP directory in a space efficient way.
By default the backups are done with slapcat from OpenLDAP but can be done
with any command that dumps the current contents of an LDAP directory in LDIF
format.

%prep
%setup -q -n %{name}-%{version}-%{release}

%build
autoreconf -i
./configure --prefix %{_prefix}

%install
make DESTDIR=$RPM_BUILD_ROOT PREFIX=%{_prefix} \
     BINDIR=%{_bindir} SYSCONFDIR=%{_sysconfdir} \
     MANDIR=%{_mandir} \
     install


%files
%doc README.mdown COPYING
%{_sbindir}/ldap-git-backup
%{_sbindir}/safe-ldif
%doc %{_mandir}/man1/*

%changelog
* Fri Dec 11 2015 Matthew Richardson <m.richardson@ed.ac.uk> - 1.0.7-1
- Initial specfile
