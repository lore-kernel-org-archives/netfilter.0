From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: GRE protocol .
Date: Fri, 7 May 2010 00:05:30 +0530
Message-ID: <AANLkTim4Wew3a0-EecOW542_7XQwAp8roczTJC22DwpC@mail.gmail.com>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
	 <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>
	 <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>
	 <4BE2DAD7.1050802@plouf.fr.eu.org>
	 <AANLkTilUsdhWBzhfGtwplySk6klKdR0VVectHILwx9f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=paASKICiVWurF84kG99vuVk6CHuUl6Q2QonKm5AhG/Q=;
        b=ONu1R5Y6rj7HafaWkJjuE509lssQab9sfah3TVjkoOzr/A3gjZ+b0QMaBbEClc3uH5
         PE0iJAYkOXQ26ALB97aAVy9g4ZWY4chdCQ+fkOKm0MmD+HquZmmG8wGdmLUn29F/hXWM
         dLO9GeRU0qNHjxs6qMvNXOortIYsDplKu094k=
In-Reply-To: <AANLkTilUsdhWBzhfGtwplySk6klKdR0VVectHILwx9f2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> On Thu, May 6, 2010 at 8:35 PM, Pascal Hambourg
> <pascal.mail@plouf.fr.eu.org> wrote:
>so you must know
>that a GRE packet is RELATED to an existing PPTP connection.

In my case , if first  GRE packet comes from PPTP server and get
routed to my client machine , indicate that pptp_connection_tracking
module is loaded ? { get ACCEPTed by    iptables  -A FORWARD -m state
--state RELATED -j ACCEPT } .
[ pptp helper  will install expectation tuple ? ]

Thanks,
Ratheesh




On Thu, May 6, 2010 at 10:27 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> On Thu, May 6, 2010 at 8:35 PM, Pascal Hambourg
> <pascal.mail@plouf.fr.eu.org> wrote:
>> Hello,
>>
>> ratheesh k a =E9crit :
>>>>> iptable rules configured in my gateway machine (which act as a ro=
uter)
>>>>> has no rule to allow GRE packet coming from wan side to pass thru=
=2E
>>>>> There is no ALGs loaded. Still i am able to establish a pptp
>>>>> connection. I can see GRE packet reached client machine using a
>>>>> wireshark .
>>
>> This is probably because the GRE connection is created from inside b=
y
>> the client machine. In PPTP, GRE encapsulation is used to transport =
PPP
>> packets ; PPP is a peer-to-peer protocol, not a client-server protoc=
ol,
>> so both ends may send packets at the same time. If the first GRE pac=
ket
>> is sent by the PPTP client it is allowed in by your ruleset and crea=
tes
>> the connection, so the subsequent GRE packets from the server are in=
 the
>> ESTABLISHED state and accepted. If the first GRE packet is sent by t=
he
>> PPTP server, it is dropped by your ruleset but it does not matter,
>> because the connection will be created anyway when the client sends =
its
>> first GRE packet (see above case), and the server will eventuellaly
>> retransmit the dropped packets.
>>
>> Note that if your router does masquerading, this works for only one =
PPTP
>> connection to the same server. For simultaneous connections from sev=
eral
>> internal clients to the same server, you must use the PPTP helper, s=
o
>> the router knows which client the return GRE packets are to be forwa=
rded to.
>>
>>> pptp pass thru works because gre connection tracking =A0module was =
built
>>> as part of kernel in my linux machine. I thought pptp_connection
>>> tracking module is the ALG for pptp connection.
>>
>> Yes it is (actually the module is named nf_conntrack_pptp, which use=
s
>> nf_conntrack_proto_gre).
>>
>>> But without
>>> pptp_connection tracking also , pptp pass thru works fine .
>>
>> Not in all situations, as I wrote above.
>>
>>> Then, why we need pptp_connection_tracking =A0module ?
>>
>> For instance you need it when several clients behind the same
>> masquerading router connect simulaneously to the same server, or whe=
n
>> the iptables ruleset does not allow any NEW packet out, so you must =
know
>> that a GRE packet is RELATED to an existing PPTP connection.
>>
>
>
> Thanks a lot . This cleared all my doubts . Thanks again .
>
> -Ratheesh
>
