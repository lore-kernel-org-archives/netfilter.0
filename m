From: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to
	connet	a	pptpVPN server.
Date: Wed, 20 Jun 2007 11:10:23 +0530
Message-ID: <001801c7b2fd$801617b0$1664a8c0@ssplscu22>
References: <000e01c7b01a$0c8305a0$dededede@neilhp>	<4673FDE6.9040605@granero.com.br><042501c7b277$d1a1e950$1664a8c0@ssplscu22>
	<467862C3.4020201@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@lists.netfilter.org


----- Original Message -----=20
From: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, June 20, 2007 4:42 AM
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a=20
pptpVPN server.


rajeev.sekhar a =E9crit :
>
> I configured VPN befind the firewall, with the rules given by Pascal=20
> Hambourg.
>
> But when i connect more than one client, the old client connection get=20
> terminated.

Did you test from clients with different public IP addresses (not
masqueraded behind the same NAT device) ?
AFAIK the generic connection tracking and NAT should handle properly
multiple GRE tunnels between a masqueraded server and multiple clients,
provided that the server sees a unique IP address for each client so
each tunnel creates a unique conntrack/NAT tuple.

Ohh yes you are right,
I tried to connect multiple client from the same IP address, I will try fro=
m=20
different IPs & let you know.

Thanks
Rajeev sekhar=20

----------------------------------------------
Confidentiality Note: This e-mail message and any attachments to it are
intended only for the named recipients and may contain legally privileged
and/or confidential information. If you are not one of the intended
recipients, please notify the sender and do not duplicate or forward this
e-mail message and immediately delete it from your computer.
----------------------------------------------

