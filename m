From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: broadcasting netbios into a dmz
Date: Wed, 4 Jun 2003 08:23:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DA2@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: chad@isolv.net, netfilter@lists.netfilter.org

You can't forward broadcasts...argh, funny how questions get repeated in =
blocks ey.. ;) he he

try using Samba on the firewall and block all sharing on it but allow it =
to broadcast/relay to the other network using "remote announce" on the =
firewall..

Just another thought, this usually means that the firewall MUST be the =
master browser of the domain/workgroup.. forget this if you have a PDC =
as it always wants to win the election and this method will not then =
work... but you could try it..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: chad@isolv.net [mailto:chad@isolv.net]
Sent: Tuesday, June 03, 2003 12:23 AM
To: netfilter@lists.netfilter.org
Subject: broadcasting netbios into a dmz


I have an interesting problem.  We are trying to forward NetBIOS packets =
from a=20
single host to our dmz, with out much success.  We have our protected =
network=20
on eth1 and the DMZ is attached to eth0.  We have one host that we would =
like=20
to broadcast via both apple talk and NetBIOS, but we don't want to let =
all=20
netbios/appple talk traffic out to the DMZ. =20

I came up with the following statements:

$IPT  -A FORWARD -i $localnet -o eth0+ -p udp --sport 137:139 -d =
128.59.47.127 -
-dport 137:139 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPT -t nat -A PREROUTING -p udp -s 10.0.0.137 --sport 137:139 -j DNAT =
--to=20
128.59.47.127:137:139

but it doesn't work.  Any ideas?

C =20





