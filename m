From: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Subject: Port forwarding.
Date: Mon, 28 Jun 2004 11:16:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c45cf0$9f7cf710$6600a8c0@simba>
Reply-To: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all.
I'm trying to setup a firewall/port forwarder but can't get things going.
Some facts:
LAN is my internal network and WAN is external.
I have a static ip# on WAN and LAN.
Access to SSH on firewall works.
IP Forwarding and NAT from LAN to WAN works :-)

The problem:
On my LAN i have another machine with web, mail, ftp-server(192.168.0.100)
witch have to be accessible from the WAN.
But I just cant get it working.

Question:
At http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET
(Oskar Andreasson) says
Quote
"This last rule will seriously harm your logging, so it is really advisable
not to use this method, but the whole example is still a valid one for all
of those who can't afford to set up a specific DMZ or alike. What will
happen is this, packet comes from the Internet, gets SNAT'ed and DNAT'ed,
and finally hits the HTTP server (for example). The HTTP server now only
sees the request as if it was coming from the firewall, and hence logs all
requests from the internet as if they came from the firewall."
End quote.
Is there some way to do this so the logging sees the "right" IP# ???


Regards Gunnar Fr=F6din (Sweden)

One more thing: I'm trying all this out with WMware(www.vmware.com/),
Virtual Machine Software, but I havent read anything about some limitations
with that.


# DNAT/SNAT Port Forwarding
# this is the prerouting dnat
iptables -A PREROUTING -t nat -p tcp -d 217.215.x.x --dport 25 -j
DNAT --to-destination 192.168.0.100:25
# This allows packets from external->internal
iptables -A FORWARD -p tcp -i eth0 -o eth1 -d 192.168.0.100 --dport 25 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
# This allows packets from internal->external
iptables -A FORWARD -p tcp -i eth1 -o eth0 -s 192.168.0.100 --sport 25 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
# This enables access to the 'public' server from the internal network
iptables -A POSTROUTING -t nat -p tcp -d 192.168.0.100 -s
192.168.0.0/24 --dport 25 -j SNAT --to-source 192.168.0.100:25



