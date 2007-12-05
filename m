From: Peter Van Eeckhoutte <peter.ve@telenet.be>
Subject: RE: route back over same interface - traffic blocked
Date: Wed, 5 Dec 2007 14:10:23 +0100
Message-ID: <C0641B79F7D6A44791BA8FA35BC143F914D61FB243@apollo.corelan.be>
References: <C0641B79F7D6A44791BA8FA35BC143F914D61FB242@apollo.corelan.be>
 <CHILKAT-MID-4594673e-f8a8-5a3e-e32b-a8e9dfddde7b@socrates.corelan.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CHILKAT-MID-4594673e-f8a8-5a3e-e32b-a8e9dfddde7b@socrates.corelan.be>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I think figured out what the problem was :

when a packet is sent from subnet2 to subnet1, it is delivered to the h=
ost in subnet1 directly (via the router between subnet1 and subnet2)
The returning packets (from subnet1 going back to subnet2) first go to =
the firewall (default gateway on the clients in subnet1).
The firewall did not find an open session, so it drops the packet.

I think there are 2 solutions for this : either set a static route to s=
ubnet2 on all hosts in subnet1 (too much work - not an option),
or create a rule in the firewall that allows traffic from subnet1 to su=
bnet2, without checking the state (stateless rule)

works fine now...

What is the risk of using the stateless rule from subnet1 to subnet2 ?

Imho, this is low risk... unless I'm missing something here

Tx

c



-----Original Message-----
=46rom: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ke=
rnel.org] On Behalf Of Pascal Hambourg
Sent: woensdag 5 december 2007 12:54
To: Peter Van Eeckhoutte
Subject: Re: route back over same interface - traffic blocked

Hello,

Peter Van Eeckhoutte a =E9crit :
>
> I have a rule in iptables, allowing all traffic from 192.168.0.0/24
> towards 192.168.3.0/24
>
> When clients from 192.168.0.0/24 try to connect to hosts in
> 192.168.3.0/24, the packet is sent to their default gateway (which is
> the firewall).
> I would have expected the firewall to forward the packet to the route=
r
> between 192.168.0.0 and 192.168.3.0
> But all I can see in the log is a   "DENY  in=3Deth0 out=3Deth0 "

Did you make sure that the rule is inserted before the log&drop rules ?
-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


This transmission is intended only for use by the intended recipient(s)=
=2E  If you are not an intended recipient you should not read, disclose=
, copy, circulate or in any other way use the information contained in =
this transmission.  The information contained in this transmission may =
be confidential and/or privileged.  If you have received this transmiss=
ion in error, please notify the sender immediately and delete this tran=
smission including any attachments.
