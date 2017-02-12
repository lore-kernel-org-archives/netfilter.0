From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Restrictive FTP egress using conntrack helper
Date: Sun, 12 Feb 2017 10:14:08 +0100
Message-ID: <10a85123-67f2-c323-435c-3d006ba692aa@plouf.fr.eu.org>
References: <20170211171431.GD31183@weiser.dinsnail.net>
 <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Robert White <rwhite@pobox.com>, Michael Weiser <michael@weiser.dinsnail.net>
Cc: netfilter@vger.kernel.org

Le 11/02/2017 =E0 23:13, Robert White a =E9crit :
>
> I think I read somewhere that the as of Kernel 4.7 the connection
> tracker no longer _automatically_ loads the helper module.

AFAIK, the connection tracking never loaded any protocol helper module=20
automatically.

What has changed in recent kernels is that by default the helper is no=20
more automatically associated to the "master" connection. You must do so=20
explicitly with the 'CT' target, or change the default setting with some=20
sysctl or module parameter I forgot about.

I fail to retrieve the information page I had read about this change,=20
but this one contains useful information :
<https://home.regit.org/netfilter-en/secure-use-of-helpers/>
