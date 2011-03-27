From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd segfault on kill TERM
Date: Sun, 27 Mar 2011 21:48:41 +0200
Message-ID: <4D8F9499.9060606@netfilter.org>
References: <4D8B6F20.4010205@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D8B6F20.4010205@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Cc: netfilter@vger.kernel.org

On 24/03/11 17:19, Salih G=F6n=FCll=FC wrote:
> Hi,
>=20
> ulogd is segfaulting on kill TERM when logfile is set to 'syslog' in =
the
> configuration. Please find a patch below.

I have applied the following patch.

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dulogd2.git;a=3Dcommit;h=
=3Dc8fb552eeabd1a7cd9440d55c96918c0aa1ae3a9

> Another point: Should stdout
> stay open on daemonize when logging to syslog ??

this does make too much sense indeed.

Please, include a short description in your patches and add the
Signed-off-by tag. This makes easier to apply it with git-am.

Thanks Salih!
