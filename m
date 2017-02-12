From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Configure conntrack and understand timestamp
Date: Sun, 12 Feb 2017 13:15:19 +0100
Message-ID: <f19d7a7e-d2b0-4bc4-7e26-d63c782a93db@plouf.fr.eu.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAFK7h3ZgWDNHt5MtE3gECVIBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAFK7h3ZgWDNHt5MtE3gECVIBAAAAAA==@manfbraun.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: webman@manfbraun.de
Cc: netfilter@vger.kernel.org

Le 12/02/2017 =E0 12:12, webman@manfbraun.de a =E9crit :
>
> My current work is around conntrack.
> The first I've found is, that some
> required configuration variables
> are not set by default:
>
> net.netfilter.nf_conntrack_acct =3D 1
> net.netfilter.nf_conntrack_timestamp =3D 1
>
> I added these to "/etc/sysctl.conf", but after
> a reboot, these are NOT set. I am looking
> for a workaround to set these variables.
> I am on Debian Jessie 8.6 (3.16.0-4-amd64)
> with conntrack 1.4.

Did you make sure that the nf_conntrack module is loaded before=20
/etc/sysctl.conf is used, e.g. by adding it to /etc/modules ? Otherwise=20
the sysctls do not exist yet.

Also, you can set these variables with module parameters 'tstamp' and=20
'acct' when loading the module, e.g. in /etc/modules :

nf_conntrack acct=3D1 tstamp=3D1

or in a /etc/modprobe.d/*.conf file with an 'options' statement :

options nf_conntrack acct=3D1 tstamp=3D1
