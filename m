From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: xtables-addons-1.41, ipset build error with hardened-sources-3.2.2
Date: Sun, 29 Jan 2012 23:22:10 +0100
Message-ID: <4F25C692.2090004@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=RXryBEn5W7E0OPALsNl7qOm74tm00YYETivohnWhem8=;
	b=bC1nZlBq2TDFxbSu2aMLacXmdqw1lJsoMKRc4+jRYVtntw9VLe61STpx8j9VdZeTN0vuTt2TKPMDAPiL+K3UktxaR3MNFJZQT3wz7aeAgJcFWSoE7ezCJQsZ95gaaM3p;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
i've got problem with build xtables-addons-1.41 with kernel=20
hardened-sources-3.2.2. here is log:
   CC [M]=20
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.o
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:148:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:148:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:148:1:=20
warning: parameter names (without types) in function declaration
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:291:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:291:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:291:1:=20
warning: parameter names (without types) in function declaration
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:312:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:312:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/pfxlen.c:312:1:=20
warning: parameter names (without types) in function declaration
   CC [M]=20
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_bitmap_ip.o
   CC [M]=20
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_bitmap_ipmac.o
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:110:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:110:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:110:1:=20
warning: parameter names (without types) in function declaration
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:=20
In function =E2=80=98ip_set_get_ip6_port=E2=80=99:
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:125:48:=20
error: too many arguments to function =E2=80=98ipv6_skip_exthdr=E2=80=99
include/net/ipv6.h:556:12: note: declared here
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:=20
At top level:
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:132:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:132:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:132:1:=20
warning: parameter names (without types) in function declaration
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:161:1:=20
warning: data definition has no type or storage class
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:161:1:=20
warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=
=98EXPORT_SYMBOL_GPL=E2=80=99
/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-1=
=2E41/extensions/ipset-6/ip_set_getport.c:161:1:=20
warning: parameter names (without types) in function declaration
make[3]: ***=20
[/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-=
1.41/extensions/ipset-6/ip_set_getport.o]=20
Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: ***=20
[/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons-=
1.41/extensions/ipset-6]=20
Error 2
make[1]: ***=20
[_module_/var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables=
-addons-1.41/extensions]=20
Error 2
make[1]: Leaving directory `/usr/src/linux-3.2.2-hardened-r1'
make: *** [modules] Error 2

Thank you for help.
Marcin
