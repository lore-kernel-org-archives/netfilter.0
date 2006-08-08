From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: 1:1 NAT Help
Date: Tue, 8 Aug 2006 09:51:18 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127FB@knowledge.wizdom.nu>
References: <44D78CC7.5020607@usrsbin.com>
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
To: netfilter@lists.netfilter.org

Are you sure, you also allow the connection in the FORWARD chain of the =
filter table?
=20
iptables -i eth2 -d 10.2.253.21 -j ACCEPT
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
Sent: Mon 07-Aug-06 20:56
To: netfilter@lists.netfilter.org
Subject: 1:1 NAT Help



Dear List,

I have search Google, and the list archives back to 2003 and have found
little information about this particular problem.

First I present to you two very simplified rules.

iptables -A PREROUTING -i eth2 -d 204.184.20.221 -j DNAT --to =
10.2.253.21

and

iptables -A POSTROUTING -o eth2 -s 10.2.253.21 -j SNAT --to =
204.184.20.221

Having never really delt with 1:1 NAT before, I thought this would "just
work".  However, it does not work.  The SNAT rule works fine.  The DNAT
rule does not work at all.  I don't even see packets hitting it.

A few other pieces of information:

1.  Proxy arp does not seem to be a problem.  When I SSH to the external
IP, I can see the ethernet frames coming into the ethernet interface.

2.  I have tried doing: ip addr add 204.184.20.221 dev eth2 and it still
won't work.

We have an old POS box running Debian with Shorewall and kernel 2.4 that
works perfectly with the 1:1 NAT rules.  However, the friend I am
helping does not want to use Shorewall, as she wishes to learn iptables
the old fashioned way.  The only difference between the old Debian
firewall and the new one is the the new one is running CentOS and the
2.6 kernel.
The old firewall that works has proxy arp turned off and rp_filter
turned on.  The new firewall has proxy arp turned off and rp_filter
turned on.

I'm really lost and I used to think I was decent at iptables.  So if
anybody can help it would be appreciated.

Thank you!

Dan




