From: <webman@manfbraun.de>
Subject: RE: Configure conntrack and understand timestamp
Date: Sun, 12 Feb 2017 22:51:15 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAE1DcWUJ7P1AhRMlbZV5UewBAAAAAA==@manfbraun.de>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAFK7h3ZgWDNHt5MtE3gECVIBAAAAAA==@manfbraun.de> <f19d7a7e-d2b0-4bc4-7e26-d63c782a93db@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f19d7a7e-d2b0-4bc4-7e26-d63c782a93db@plouf.fr.eu.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Pascal Hambourg' <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi !

Thanks for your reply.
Made me thinking.
Came never to the idea, the module is not loaded,
because there were no error message for the kernel
configuration and also, if I issue:
$ echo 1 > /net/netfilter/nf_conntrack_acct
as this is a file in the filessystem ....

Ok, tried your recommendation, and started creating
$ /etc/modprobe.d/netfilter.conf
conatining the mdule. But these dont
work. Then I came to the idea, that I even have
probably to rebuild $ update-initramfs -u
but this dont build and issues a lot of error
messages about this line:
"options nf_conntrack acct=3D1 tstamp=3D1"
with or without options. I found a bug about
this and gave up.

But I was able to add it to modules, but while booting, I get:
>
systemd[1]: Starting Load Kernel Modules...
systemd-modules-load[5938]: Failed to find module 'nf_conntrack acct=3D1
tstamp=3D1'
systemd[1]: systemd-modules-load.service: main process exited, code=3Dexite=
d,
status=3D1/FAILURE
systemd[1]: Failed to start Load Kernel Modules.
<
Nevertheless, modprobe and modinfo are woking .....
So, today, I added my sixt script to "rc.local" for the
things, not working out of the box :-(

BTW, this brought me to the idea, to solve an old problem
with iptables on my current firewall with the xt_condition
module: You are not able to write to:
$ echo 0 > /proc/net/nf_condition/sshok
before you made an iptables rule for it. This leads to
a very ugly organization of code. And yes, this module
loads, but creating a "door" (above: sshok) outside the
iptables script does not work :-(

I had contact to iptables environment more then 10 years
ago [Debian Lenny], but until today: It is horror to me.
This try today including all search cost me the whole day.
I need days to find out, what I need and in which order
and then, xt_??, nf_?? and so on ...

Very frustrated.
But anyway, thanks for your help!
Manfred


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Pascal Hambourg
> Sent: Sunday, February 12, 2017 1:15 PM
> To: webman@manfbraun.de
> Cc: netfilter@vger.kernel.org
> Subject: Re: Configure conntrack and understand timestamp
>=20
> Le 12/02/2017 =E0 12:12, webman@manfbraun.de a =E9crit :
> >
> > My current work is around conntrack.
> > The first I've found is, that some
> > required configuration variables
> > are not set by default:
> >
> > net.netfilter.nf_conntrack_acct =3D 1
> > net.netfilter.nf_conntrack_timestamp =3D 1
> >
> > I added these to "/etc/sysctl.conf", but after
> > a reboot, these are NOT set. I am looking
> > for a workaround to set these variables.
> > I am on Debian Jessie 8.6 (3.16.0-4-amd64)
> > with conntrack 1.4.
>=20
> Did you make sure that the nf_conntrack module is loaded before
> /etc/sysctl.conf is used, e.g. by adding it to /etc/modules ? Otherwise
> the sysctls do not exist yet.
>=20
> Also, you can set these variables with module parameters 'tstamp' and
> 'acct' when loading the module, e.g. in /etc/modules :
>=20
> nf_conntrack acct=3D1 tstamp=3D1
>=20
> or in a /etc/modprobe.d/*.conf file with an 'options' statement :
>=20
> options nf_conntrack acct=3D1 tstamp=3D1
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


