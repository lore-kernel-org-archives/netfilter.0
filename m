From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: GRE protocol .
Date: Thu, 6 May 2010 22:27:15 +0530
Message-ID: <AANLkTilUsdhWBzhfGtwplySk6klKdR0VVectHILwx9f2@mail.gmail.com>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
	 <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>
	 <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>
	 <4BE2DAD7.1050802@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zrik1DhmocSWw9R67Tp8THp284t/6NOfFr8bIhd10As=;
        b=R5q4orruqVXsNsB3PIxBKFaj+aHAph7/1918zsOLhwA7qbkFQMxwvynJ5uaUVBWqc3
         u/LQ4mX7UGogWCE+gVDmk19UIyVigc3RC5u50Im5KcekkaV+TfB8eKW//sVFr6K9kazt
         x7pR2vcZNzmObrI52uSpqZxUxFlJaCWsTHFr8=
In-Reply-To: <4BE2DAD7.1050802@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Thu, May 6, 2010 at 8:35 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> ratheesh k a =E9crit :
>>>> iptable rules configured in my gateway machine (which act as a rou=
ter)
>>>> has no rule to allow GRE packet coming from wan side to pass thru.
>>>> There is no ALGs loaded. Still i am able to establish a pptp
>>>> connection. I can see GRE packet reached client machine using a
>>>> wireshark .
>
> This is probably because the GRE connection is created from inside by
> the client machine. In PPTP, GRE encapsulation is used to transport P=
PP
> packets ; PPP is a peer-to-peer protocol, not a client-server protoco=
l,
> so both ends may send packets at the same time. If the first GRE pack=
et
> is sent by the PPTP client it is allowed in by your ruleset and creat=
es
> the connection, so the subsequent GRE packets from the server are in =
the
> ESTABLISHED state and accepted. If the first GRE packet is sent by th=
e
> PPTP server, it is dropped by your ruleset but it does not matter,
> because the connection will be created anyway when the client sends i=
ts
> first GRE packet (see above case), and the server will eventuellaly
> retransmit the dropped packets.
>
> Note that if your router does masquerading, this works for only one P=
PTP
> connection to the same server. For simultaneous connections from seve=
ral
> internal clients to the same server, you must use the PPTP helper, so
> the router knows which client the return GRE packets are to be forwar=
ded to.
>
>> pptp pass thru works because gre connection tracking =A0module was b=
uilt
>> as part of kernel in my linux machine. I thought pptp_connection
>> tracking module is the ALG for pptp connection.
>
> Yes it is (actually the module is named nf_conntrack_pptp, which uses
> nf_conntrack_proto_gre).
>
>> But without
>> pptp_connection tracking also , pptp pass thru works fine .
>
> Not in all situations, as I wrote above.
>
>> Then, why we need pptp_connection_tracking =A0module ?
>
> For instance you need it when several clients behind the same
> masquerading router connect simulaneously to the same server, or when
> the iptables ruleset does not allow any NEW packet out, so you must k=
now
> that a GRE packet is RELATED to an existing PPTP connection.
>


Thanks a lot . This cleared all my doubts . Thanks again .

-Ratheesh
