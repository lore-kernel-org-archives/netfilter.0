From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd2 segfault
Date: Thu, 06 Jan 2011 14:53:09 +0100
Message-ID: <4D25C945.7030502@netfilter.org>
References: <4D1E0374.3090008@open.ch> <4D221173.3060009@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D221173.3060009@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Cc: netfilter@vger.kernel.org

On 03/01/11 19:12, Salih G=F6n=FCll=FC wrote:
> Hi,
>=20
> my last ulogd.conf was not complete. And I think I found out the caus=
e:
>=20
> stack=3Dlog2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRIN=
TPKT,emu0:LOGEMU
>=20
> stack=3Dlog2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRIN=
TPKT,syslog1:SYSLOG
>=20
> having other stacks is not a problem as long as the log2:NFLOG is not
> present, could it be that stop_pluginstances() in this case is doing =
a
> double free() ?

Let me check this, if the problem is what you're pointing (which makes
sense at first look at the code) I guess that we need some refcounting
for plugins to avoid double freeing.
