From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: same prob again...cannot ping 202.184.41.41
Date: Wed, 21 Jun 2006 11:25:42 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127A9@knowledge.wizdom.nu>
References: <BAY19-F233ECF40C109704F4C0AAC9E840@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Diana Asnani <sakal_woman@hotmail.com>, netfilter@lists.netfilter.org

Diana,
=20
Like I said before, the best thing you can do is start reading up on =
TCP/IP and routing.
This would be some good places to start:
http://pclt.cis.yale.edu/pclt/COMM/TCPIP.HTM
http://damyen.technion.ac.il/~dani/tcpip-haifux-lecture.ppt
http://pptpclient.sourceforge.net/routing.phtml
http://en.tldp.org/HOWTO/HOWTO-INDEX/networking.html
http://yolinux.com/TUTORIALS/LinuxTutorialNetworking.html
http://en.tldp.org/HOWTO/Networking-Overview-HOWTO.html
=20
What you are trying to do is the very basics of setting up a couple of =
routed subnets/vlans. And unless you educate yourself, you will never =
fix your problem, as you haven't got the slightest clue of what you are =
doing.
=20
Also for routing, you do not need iptables. Trying to NAT what you can =
actually just route only makes things more complicated and not easier. =
First get your routing set up correctly, then start with firewalling.=20
=20
regards,
Sietse
=20
________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Diana Asnani
Sent: Wed 21-Jun-06 9:03
To: netfilter@lists.netfilter.org
Subject: same prob again...cannot ping 202.184.41.41



Hi,

this time is about iptables...previously, i posted about routing issues =
and
i got quite a lot of response on that...

ok, i still could not ping 202.184.41.41 from my IP, 192.168.202.1...i =
could
not add this "route add -net 202.184.41.0/24 gw 192.168.202.1" in my =
routing
table because my default gateway is set as 192.168.202.14 in the vlan
configuration....and yes ipv4 forwarding is enabled in =
/etc/sysctl.conf...I
could always ping 192.168.206.1 because we are in the same vlan...but =
with
my gateway as 192.168.202.14 because its connected to the
vlan...192.168.206.1 is in the same PC with 202.184.41.41...

the PC router 202.184.41.41/192.168.206.1 ( the PC router ) did NAT and
added this in the iptables:
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 202.184.41.41

is there anything  else that i should do to make the PC 192.168.202.1 to
ping 202.184.41.41?? I'm really devastated with this problem...hope you =
guys
could help....


Diana

_________________________________________________________________
Get your mobile ringtones, operator logos and picture messages from MSN
Mobile http://msn.smsfactory.no/





