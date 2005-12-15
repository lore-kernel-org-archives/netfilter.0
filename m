From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: ebtables iptables DNAT something missing
Date: Thu, 15 Dec 2005 11:10:21 -0500
Message-ID: <s3a14f47.099@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org, harmuth@mnemon.de

Thank you for your assistance.
The recipes I have do not describe a SNAT rule? Some describe adding an =
ebtables dnat for the MAC address, others say not required.=20
To my embarassment I did copy the wrong line from my screen, please =
substitute -A for the -D, but the problem persists. Here is another recipe =
that has the same problem:
iptables -t nat -A PREROUTING -p tcp -m physdev --physdev-in eth1 -m mark =
--mark 4 --dport 80 -j REDIRECT.
The problem is that the packets are redirected, and the bridge/web service =
responds, but the client silently ignores the redirected server.
The tcpdump and ethereal traces show:
client.highport -> origtarget.80
bridge.80 -> client.highport         ack =20
this repeats several times and the client complains with a timeout.
<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu
>>> J=F6rg Harmuth <harmuth@mnemon.de> 12/14/05 11:21 AM >>>
Randy Grimshaw schrieb:
> I thought I followed the recipe for DNAT on a transparent firewall =
correctly with the statement below, and sniffing shows that the traffic is =
redirected. But although the client receives the return responses from the =
server at the dnat destination - the client basically ignores it. =
(possibly as unexpected noise). What am I missing?
>=20
> iptables -t nat -D PREROUTING -p tcp --dport 80 -m physdev --physdev-in =
eth1 -m mark --mark 9 -j DNAT --to-destination 192.168.12.12:80

Are you sure ? -D means delete. Given that this is a typo, maybe you are
missing a SNAT rule ? Also maybe, that a tcpdump helps.




