From: Jason Opperisano <opie@817west.com>
Subject: Re: attempting to transparently proxy with this script to no avail
Date: Wed, 02 Mar 2005 00:33:39 -0500
Message-ID: <1109741619.4627.14.camel@hubcap.ljm.dom>
References: <BAY17-F386CBFC183CD40C68DFE19DC590@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <BAY17-F386CBFC183CD40C68DFE19DC590@phx.gbl>
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

On Tue, 2005-03-01 at 17:03, joe z wrote:
> this script runs everything fine just the redirect doesn't. the proxy works 
> fine when browser pointed at it.
> 
> /sbin/depmod -a
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_REDIRECT
> 
> iptables -F
> iptables -t mangle -F
> iptables -t nat -F
> iptables -X
> 
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t mangle -P PREROUTING ACCEPT
> iptables -t nat -P PREROUTING ACCEPT
> iptables -t nat -A PREROUTING -m tcp -p tcp --dport 80 -j REDIRECT --to-port 
> 8080

first--when you look at the output of:

  iptables -t nat -vnxL

do you see the packet count incrementing on that rule--if so, good.

second--the proxy *is* running on port 8080, right?  k--moving on...

third--the proxy *is* configured for transparent operation, right?  for
example, if the proxy in question is squid:

  http://www.faqs.org/docs/Linux-mini/TransparentProxy.html#s4

as an aside--it would be better form to specify only packets arriving on
the inside interface in your REDIRECT rule; i.e, "-i $INSIDE_IF"

> ifdown eth1
> ifdown eth0
> ifup eth0
> ifup eth1
> ifconfig eth1 192.168.11.8 netmask 255.255.255.0
> ifconfig eth0 192.168.11.10 netmask 255.255.255.0

um...  err...  never mind...  wait--i'll bite...this machine *is*
forcibly in the path between all web browsers and the Internet, right?

<--snip-->

-j

--
"Ooh, they used nylon rope this time. It feels smooth against my skin,
 almost sensuous."
	--The Simpsons


