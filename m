From: Jason Opperisano <opie@817west.com>
Subject: Re: static IP to dynamic IP
Date: Fri, 15 Oct 2004 14:22:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015182253.GA7592@bender.817west.com>
References: <20041015174456.20376.qmail@web21523.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015174456.20376.qmail@web21523.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 10:44:56AM -0700, kate wrote:
> Hi, I am trying to modify a fw script that would work
> for my small lan, except I need to change references
> of static IP and SNAT. to eth0 and MASQUERADE, - but
> when I run the script it gives me Bad argument `eth0'

in general--you can find the line where any bash script blows up by
running:  bash -x script.sh

> The script is below, with my notes on changes I've
> made so far. Any help greatly appreciated.
> 
> #(1) Policies (default) - modified with notation
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> # (2) User defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
> 
> # (3) INPUT chain rules
> 
> # Rules for incoming packets from LAN
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/16 -j
> ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.1.1 -j
> ACCEPT
> iptables -A INPUT -p ALL -i lo -s -i eth0 -j ACCEPT

but i can tell you that the above line is the one blowing up.  you have
specified "-s" with no IP address following it...you've also specified
"-i" twice--which doesn't make any sense--a packet only has one inbound
interface.

> ## WAS -> ... 123.45.67.89 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j
> ACCEPT
> 
> # Rules for incoming packets from Internet
> # Packets for established connections
> iptables -A INPUT -p ALL -d -i eth0 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> ## WAS - > ... -d 123.45.67.89 -m...

k--i guess i see your pattern here...you need to figure out what
your IP address actually is earlier in the script and just use the IP
address--there's no magic "substitute the IP of the interface" variable
with iptables (except for MASQ which we get to later).  one of the 8
million (i've counted) ways to do this would be:

ETH0_IP=`ip -4 -o addr sh eth0 | awk '{print $4}' | cut -d"/" -f1`

and then reference $ETH0_IP wherever you need the IP address of eth0.

[ snip ]

> # (6) POSTROUTING chain rules
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> ## was -> ... -j SNAT --to-source 123.45.67.89

yes--MASQ is the proper way to SNAT with a dynamic IP.

-j

-- 
Jason Opperisano <opie@817west.com>

