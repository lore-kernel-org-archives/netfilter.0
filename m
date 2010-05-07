From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 07 May 2010 20:51:27 +0200
Message-ID: <4BE4612F.4090604@plouf.fr.eu.org>
References: <201005061651.40203.rfeng@wurldtech.com> <4BE3E41F.7030601@plouf.fr.eu.org> <201005070922.00629.rfeng@wurldtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201005070922.00629.rfeng@wurldtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Feng <rfeng@wurldtech.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Richard Feng a =E9crit :
> On May 7, 2010 02:57:51 am Pascal Hambourg wrote:
>>
>> The conntrack tool only deals with netfilter connection tracking, no=
t
>> with the actual connection (e.g. it won't send RST's in order to tea=
r it
>> down). How it may affect the actual connection depends on the iptabl=
es
>> ruleset.
>>
> It says it can block traffic in the=20
> document "http://conntrack-tools.netfilter.org/manual.html#conntrack"=
=2E

Do you mean this : "this can be used to block traffic" ?
It can be used to block traffic, but does not block traffic by itself.
Subsequent packets of a deleted TCP connection will just be in the
INVALID state, it is up to the iptables ruleset to drop such packets if
this is what you want.

> What should I do if I want to break current connection? Using 'cutter=
'?

What do you want to achieve exactly ? Drop/reject subsequent packets ?
Then see above, you need iptables. Or actively close the connection ?
Then you need a tool such as cutter.
