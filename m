From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: Want to do NAT for internal machines
Date: Sat, 1 Jun 2002 10:04:25 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <ENEBKGGOKDOEALIKAJMBMEDDCHAA.neil@JAMMConsulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

Hello:

Here is my setup:

  Internet -- Linux Server -- Switch -- Internal Machines

I have several static IPs that I can bind to the
Internet-facing interface (eth0) of the Linux server.
Let say that they are 11.22.33.44 to 11.22.33.99.
When I installed Linux, I set-up eth0 to bind to 11.22.33.44,
which I want to use to access the Linux box.
The Linux box is running RedHat Linux 7.3 and iptables.

The internal interface (eth1) of the linux server is
set-up as 192.168.1.1.

Each of the internal machines is set-up with a fixed
IP in the rance 192.168.1.2 to 192.168.1.254.

What I want to do is set up routing so that the outside
world can connect to one of my public IPs and that
connection is routed to a given internal machine.
I also want the internal machine to be able to connect
to the outside world and go out as the public
IP taht is matched to it.

For example, when a connection comes in on 11.22.33.55,
it should connect to 192.168.1.55 and when the 192.168.1.55
machine wants to connect to Internet, it should be seen
as 11.22.33.55 to the outside world.

Reading thru the netfilter docs, I think that NAT is
what I should be using for this.

I think I can use these rules to accomplish what I am trying
to do, but I want to confirm with someone that knows more
than I do.

Here is what I came up with:

# Bind the IP to eth0
/sbin/ifconfig eth0:1 11.22.33.55 netmask 255.255.255.0 broadcast
11.22.33.255
# Route incoming connections to the internal machine
/sbin/iptables -t nat -A PREROUTING -d 11.22.33.55 -j DNAT --to 192.168.1.55
# Route outgoing connections from the internal machine
/sbin/iptables -t nat -A POSTROUTING -s 192.168.1.55 -j SNAT --to
11.22.33.55

Is this close?

Thanks,
	Neil.


--
Neil Aggarwal
JAMM Consulting, Inc.    (972) 612-6056, http://www.JAMMConsulting.com
Custom Internet Development    Websites, Ecommerce, Java, databases


