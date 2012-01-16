From: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Subject: Meaning of NFQUEUE's --queue-balance option
Date: Mon, 16 Jan 2012 12:01:43 +0100
Message-ID: <BLU162-W15434B55EC562304BCB753F6830@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


I would like to understand how load is distributed across different que=
ues using NFQUEUE's --queue-balance option.

The only information I could find on the subject is in the iptables man=
 page, where I read: "Packets belonging to the same connection are put =
into the same nfqueue"

I have two questions:
1- Would this be true also if NFQUEUE target is triggered within the "m=
angle" and not the "nat" table?
2- I would find useful for my application if all packets from/to the sa=
me IP address (not only "connection") would flow though the same queue =
always. Is this somehow ensured by queue-balance?=20
=A0
Thanks

Andres Velasco=20
M: +34 670 40 73 69=20
Skype:=A0newwwave.andres.velasco
 		 	   		  