From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Gonzatti?= <fred99@libertysurf.fr>
Subject: Replace a private IP adresse of my WAN firewall interface by a public
 IP
Date: Sat, 24 Jul 2004 03:27:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4101BB17.7070404@libertysurf.fr>
Reply-To: fred99@libertysurf.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I've got a big problem with my firewall which have three ethernet cards.
eth0 : 172.16.2.1/255.255.255.0 ---->LAN
eth1: 192.168.2.1/255.255.255.0----->DMZ
eth2: 192.168.3.1/255.255.255.0-----> WAN

This firewall is connected to a router which have Wan IP 192.168.3.254 
and a public IP for WAN : 62.160.X.X/255.255.255.255
This configurations is working !!!

I have tried to replace the Wan IP of my firewall by a public IP : 
62.160.X.Y
# ifconfig eth2 62.160.X.Y netmask 255.255.255.248
# route add default gw 62.160.X.Z (which is new Ip of the router (WAN 
and LAN interfaces of the router are the same)

I can access to the internet from my firewall but unfortunately not from 
my LAN. My iptables script is the same as the one which is working with 
private IP.
Because I can't access to the ineternet from my LAN but only from the 
firewall I think it's perhaps a route problem, but I'm not sure.
So now I come back to my old configuration until I ask why it was not 
working.
Have you got any idea please ?

Thanks

Fred99


