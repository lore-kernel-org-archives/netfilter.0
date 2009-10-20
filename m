From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FIN packets not getting NAT-ed
Date: Tue, 20 Oct 2009 13:38:56 +0200
Message-ID: <4ADDA150.1010405@plouf.fr.eu.org>
References: <200910200942.n9K9gTUS030470@dsmstclfw01.stcl.com.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200910200942.n9K9gTUS030470@dsmstclfw01.stcl.com.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Dhyanesh Ramaiya a =E9crit :
>=20
> I have setup a Linux firewall on the edge of the network and doing SN=
AT for
> internal IPs. When I sniff on external interface for internal source =
IPs,I
> am seeing FIN packets from internal IPs going out without being NAT-e=
d.

These packets are probably classified in the INVALID state by the
connection tracking. Such packets are ignored by the NAT. A reason may
be that they belong to old connections the connection tracking has
forgotten about or considers already closed.

Does your rulest DROP outgoing packets in the INVALID state ?
