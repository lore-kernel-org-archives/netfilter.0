From: Jason Opperisano <opie@817west.com>
Subject: RE: Iptables
Date: Tue, 28 Sep 2004 10:04:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096380240.2330.33.camel@wolfpack.ljm.dom>
References: <MAIL5urjNnTNG33J7pq00000024@mail.netscan.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MAIL5urjNnTNG33J7pq00000024@mail.netscan.ca>
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
To: netfilter@lists.netfilter.org.

On Tue, 2004-09-28 at 04:19, Contact wrote:
> This helps a bit, but still way out of my league - there is a lot of stuff
> to remember. In the many sites, including the one you list below, they talk
> of various configurations before ever getting to the rules - is this
> necessary?
> 
> i.e.
> 
> INET_IP="194.236.50.155"
> INET_IFACE="eth0"
> INET_BROADCAST="194.236.50.255"
> 
> LAN_IP="192.168.0.2"
> LAN_IP_RANGE="192.168.0.0/16"
> LAN_IFACE="eth1"

necessary, no.  but it is a standard scripting practice that makes your
life easier.  would you rather specify "eth0" 50 times in your script,
and then have to change it 50 times when something hardware-wise
changes?  or just change one thing that says "INET_IF=eth0"

> Then a bunch of modules are loaded....

almost all modules are loaded automatically as needed by the kernel. 
you should explicitly load "helper" modules that you expect to need;
i.e., 

        modprobe ip_conntrack_ftp
        modprobe ip_nat_ftp

> Are <if_lan>, <net_lan> and <if_inet> reserved commands or do I need to put
> something in here. I am assuming these are variables and tie in with the
> above - not sure though.

there are no such reserved words/commands with respect to iptables.  it
simply does what you tell it to.

> Note: All the other LAN clients have access to the internet via the Linksys
> router as does the Linux box. The router is my gateway....
> 
> One last thing. Is there a way to block an entire domain i.e. domain.com or
> an entire IP block i.e 24.168.1.0/24.

domain--no, not really.

IP block--yes:

        -s 24.168.1.0/24
        -d 24.168.1.0/24

> Thanks

no prob.  i know it's already been recommended once, but you ready
should hit this up and down:

  http://iptables-tutorial.frozentux.net/iptables-tutorial.html

-j

-- 
Jason Opperisano <opie@817west.com>


