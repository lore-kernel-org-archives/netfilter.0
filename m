From: Eric Leblond <eric@regit.org>
Subject: Re: [ULOGD2] Timestamp without year in logemu
Date: Tue, 03 Jan 2017 21:58:44 +0100
Message-ID: <1483477124.14368.7.camel@regit.org>
References: <8f188faf-3890-c157-74ed-22808f915b05@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8f188faf-3890-c157-74ed-22808f915b05@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Petteri Matilainen <pmatil@gmail.com>, netfilter@vger.kernel.org

Hello,

On Tue, 2017-01-03 at 21:28 +0200, Petteri Matilainen wrote:
> Hello list,
>=20
> I'm using iptables firewall and I'm logging blocked packets with
> NFLOG=A0
> target and ULOGD2. I have the following configuration in ulogd.conf:
>=20
> # this is a stack for logging packets to firewall.log after a
> collect=A0
> via NFLOG
> stack=3Dfirewall6:NFLOG,base6:BASE,ifi6:IFINDEX,ip2str6:IP2STR,print6:P
> RINTPKT,logemu6:LOGEMU
>=20
> [logemu6]
> file=3D"/var/log/firewall.log"
> sync=3D1
>=20
> The logging itself works just fine, but I noticed the timestamps are=A0
> missing the year, like so:
>=20
> Apr 23 10:38:04 Router In_New_TCP IN=3Deth0 OUT=3D...
>=20
> Any ideas why? This causes problems with the system I'm using to
> graph=A0
> the logs and make statistics. My system is Debian with kernel
> 3.16.7.=A0
> Ulogd version is 2.0.4. I found an online manual for ulogd2 which=A0
> mentioned a LOCAL filter but my ulogd does not recognize it.

I've just checked the code and it is using (since 2006) ctime which
does not return the year.

It may not work for you but if you use the JSON output, you will get
something nicely formated and will get the year.

BR,
--=20
Eric Leblond <eric@regit.org>
