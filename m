From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Please help...
Date: Mon, 28 Jun 2004 23:13:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406282313.38971.Antony@Soft-Solutions.co.uk>
References: <FC8C43AB-C94D-11D8-9C38-000A95AD0230@mac.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FC8C43AB-C94D-11D8-9C38-000A95AD0230@mac.com>
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
To: netfilter@lists.netfilter.org

On Monday 28 June 2004 10:56 pm, Sam Loy wrote:

> I have 2 NICs in a Linux 9 installation.

Linux 9!?   Wow - I've only just upgraded to version 2.6 :)

> One card connects to my lan with a static ip of 192.168.1.1. The other
> connects to my DSL provider which dynamically allocates the ip.

Sounds pretty standard so far....

> I did this:
>
> modprobe iptable_nat
>
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
>
> It does not work.

How are you testing it?

>  When I do a iptables -t nat  -n -L It displays:
>
> MASQUERADE all -- 0.0.0.0/0 		0.0.0.0/0

A more useful command in this case would be "iptables -L -t nat -nvx", because 
the -v option shows you the interfaces applying to the rules as well.

> Don't get it - Do I need to manually add a route?

Probably not, but what does your routing table show anyway?

Here are some things to test - in order:

1. Can you access anything out on the Internet from the firewall machine 
itself?   (Ping, traceroute would be good tests - by IP address if you don't 
have DNS resolving hostnames yet)

2. Do you have any rules in the FORWARD chain (and what is the FORWARD default 
policy)?

3. If you try a traceroute from a machine inside your LAN to an address on the 
Internet, what is the result?

4. After whatever tests you are trying, what does "iptables -L -nvx; iptables 
-L -t nat -nvx" show for the packet/byte counters on the rules (and default 
policies)?

You can't be too far away from a working solution - it's a pretty standard 
setup.

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


