From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Tue, 2 Jan 2018 18:36:45 -0500
Message-ID: <20180102183645.77a59ecc@playground>
References: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
        <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU w02NapMX017306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1514936211; i=@wpi.edu;
        bh=CRoKVlDQXOkkxhd1Zpf44KlhqTgO/bg572890jCgfh8=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=xj5G+3dA0ho8rqCG9B9IGC2dFZNcF7Nsz65injZ4vh5GAStdhgSXEu4vcXDel9+oH
         n9CedaCoGbR+e3PLErvVv2/Xs6jEbc5MgazGUig75aeRjhHHsQpx/jOrntXe+bON2r
         pPsYHpQHkFCEBKEO87tVzKpL6cbqMJkB2XCp4cSs=
In-Reply-To: <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 2 Jan 2018 21:56:07 +0000
Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)         <Andre.Paulsberg-Csibi@=
evry.com> wrote:

> As far as I can tell - ESTABLISHED - is only for session based protocols =
like TCP .
> You will not see that for UDP or ICMP , as far as CONNTRACK is concerned =
. =20

With netfilter, there are five connection states: NEW, RELATED, ESTABLISHED=
, INVALID and RAW.
  - A NEW packet is the first packet of a new peer-to-peer communication co=
nnection
    (a conn), be it TCP, SCTP, UDP, GRE, or any other protocol.
  - A RELATED packet is the first packet of a new conn that netfilter deter=
mined is
    related to an existing conn (the data conn of an FTP conn, for example).
  - When two-way communication is established with a reply packet, the conn=
's state
    changes to ESTABLISHED.
  - INVALID packets are those that netfilter has received but has no idea w=
hat to do
    with them; they are packets that can only belong to an ESTABLISHED conn=
 but it can
    find no such conn in its database.
  - I think RAW packets are those that netfilter has been told not to proce=
ss; but I'm
    not sure of this as I've never had reason to use RAW packets.

In netfilter, 'connection' is not related to connection-oriented protocols.=
 It has to do with the relationship--the logical connection--between two en=
dpoints on a LAN or on some internetwork of them. It is much like two peopl=
e talking on a walkie-talkie, two people exchanging TXT MSGs, or two people=
 talking on a phone that has a circuit-switched connection set up between t=
hem.
