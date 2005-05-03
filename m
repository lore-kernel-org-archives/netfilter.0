From: Jason Opperisano <opie@817west.com>
Subject: Re: Setting up a Squid proxy server behind a firewall
Date: Tue, 3 May 2005 08:35:39 -0400
Message-ID: <20050503123539.GA14940@bender.817west.com>
References: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 03, 2005 at 10:53:07AM +0530, lester@pccegoa.org wrote:
> Hi,
> I have setup a squid proxy server for our internal network. It works just
> fine without a firewall setup. When I tried to apply rules to block
> everything except the ports that squid requires, the proxy failed to get
> passed the firewall. I have setup squid to use port 3128.
> The rules applied are below:
> (eth0 : internal n/w interface
> eth2 : external n/w interface)
> 
> modprobe ip_conntrack_ftp
> 
> modprobe iptable_nat
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward

is this machine also a packet-filtering, NAT-ing gateway?  if not (your
rules lead me to believe it is not), you don't need the ftp_conntrack or
nat module, or IP forwarding enabled.

> iptables --flush
> iptables -t nat --flush
> iptables -t mangle --flush
> 
> iptables --policy INPUT DROP
> iptables --policy OUTPUT DROP
> iptables --policy FORWARD DROP

bare minimum rules:

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A INPUT -i eth0 -p tcp --syn --dport 3128 -j ACCEPT
  iptables -A INPUT -i lo -j ACCEPT

  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -p tcp --syn --dport 80 \
    -m owner --uid-owner squid -j ACCEPT
  iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
  iptables -A OUTPUT -p tcp --syn --dport 53 -j ACCEPT
  iptables -A OUTPUT -i lo -j ACCEPT

this assumes that squid only proxies HTTP traffic.

> What I would like to know is that, does squid use any other ports besides
> 3128 when contacting the external world?

of course--it uses the same ports that everything else uses for DNS,
HTTP, etc...

> Or are the rules that I have
> applied totally wrong? I am using modprobe iptable_nat, echo 1 >
> /proc/sys/net/ipv4/ip_forward for port forwarding to internal servers.
> (which works). I have not appended those rules.

i see...

-j

--
"Peter: Lois, if this is your idea of a joke, you must write for Leno.
 Stewie: Oh, oh you know, it is so fashionable to take a shot at Jay
 Leno. The fact is the man's out there every bloody night, with fresh
 material, and he's charming."
        --Family Guy

