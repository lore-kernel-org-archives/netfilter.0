From: Dimitri GOURDON <dgourdon@itool.com>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 15:23:06 +0200
Message-ID: <48848DBA.40805@itool.com>
References: <48847F16.8040604@itool.com> <488487E3.2020906@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488487E3.2020906@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bernhard Bock <mailinglists@bock.nu>, netfilter@vger.kernel.org

I will try but don't believe it :

I've reproduce the same behavior in my lab with only 1 client... so... =
I=20
try  ;)

Dimitri

Bernhard Bock a =E9crit :
> Hi Dimitri,
>
> Dimitri GOURDON wrote:
>> A lot of TCP packets with FIN or RST flags (all I think) from client=
s=20
>> are dropped by Iptables as state INVALID. The consequence is that I=20
>> have a lot of connection in FIN_WAIT state (shown by netstat) on the=
=20
>> 2 web servers...
> [...]
>> Is someone can help me ???
>
> Sounds a bit like the problem I've asked about a few days ago. Try to=
=20
> increase the hashsize of nf_conntrack. My INVALID packets vanished=20
> after this (at least as long as I wasn't using conntrackd for statefu=
l=20
> failover).
>
> best regards
> Bernhard

