From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: Newb here,
	I need help opening port 1723 and setting a public IP address to
	aprivate IP
Date: Thu, 29 Sep 2005 09:21:54 +1000
Message-ID: <13261.3970003606$1127995584@news.gmane.org>
References: <fd2d54f80509281502596ad06b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fd2d54f80509281502596ad06b@mail.gmail.com>
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
To: 'Ron Powell' <rpowelljr@gmail.com>, netfilter@lists.netfilter.org

Hey Ron:

The commands as I see them should be this:

iptables -t nat -I PREROUTING -p 47 -s $SOURCE-IP -d =
$PUBLIC-IP-OF-GATEWAY -j DNAT --to $INTERNAL-VPN-SERVER
iptables -I FORWARD -p 47 -d $INTERNAL-VPN-SERVER -j ACCEPT
iptables -t nat -I POSTROUTING -p 47 -d $INTERNAL-VPN-SERVER -j =
MASQUERADE

What those three rules do is do a port forward for protocol 47. Note =
that you do not need the -s $SOURCE-IP section, it can be deleted.=20

iptables -t nat -I PREROUTING -p tcp -d $PUBLIC-IP-OF-GATEWAY --dport =
1723 -j DNAT --to $INTERNAL-VPN-SERVER:1723
iptables -I FORWARD -p tcp -d $INTERNAL-VPN-SERVER --dport 1723 -j =
ACCEPT
iptables -t nat -I POSTROUTING -p tcp -d $INTERNAL-VPN-SERVER --dport =
1723 -j MASQUERADE

Those rules port forward port 1723 to the local machine.

iptables -I FORWARD -p 47 -j ACCEPT
iptables -t nat -I POSTROUTING -p 47 -j MASQUERADE
iptables -I FORWARD -p tcp -s $INTERNAL-VPN-SERVER -j ACCEPT
iptables -t nat -I POSTROUTING -p tcp -s $INTERNAL-VPN-SERVER -j =
MASQUERADE

These rules I believe allow outgoing connections. I'm a little bit =
rusty, some of the gurus can confirm this :D


Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Ron Powell
Sent: Thursday, 29 September 2005 08:03=20
To: netfilter@lists.netfilter.org
Subject: Newb here,I need help opening port 1723 and setting a public IP =
address to aprivate IP

Ok I very little firewall knowledge and really know nothing about =
Linux\Unix
so go easy on me.
 What I need to know is this, I have setup a VPN connection on our =
Windows
2003 server. I need to configure our iptables firewall to allow this
connection, also if anything is different on a 2000 server I will need =
to
know what to change in case we decide to use it in the future. I need =
the
vpn's Public IP to point to the private IP of our VPN server and open =
any
ports to that IP that need to be opened for the vpn connection to work, =
Im
guessing just 1723. I think that some rules have already been created =
that
point the Public IP to the Private address but not port 1723.
 Thanks in advance for any advice you can give.


