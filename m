From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: bind 9 and iptables
Date: Sat, 28 Aug 2004 01:44:36 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040828004436.GB22322@metastasis.org.uk>
References: <web-420408468@mail01.infosat.net> <412F9B73.9010603@pbl.ca>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <412F9B73.9010603@pbl.ca>
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

On Fri, Aug 27, 2004 at 03:37:07PM -0500, Aleksandar Milivojevic wrote:

<snip>

> By the above rules, you are not allowing your clients to connect to your 
> DNS server (you are only allowing DNS server to send queris outside). 
> What you need is:
> 
> iptables -A INPUT -m state --state ESTABLISHED
> iptables -A INPUT -p icmp -m state --state RELATED
> 
> iptables -A INPUT -i int_if -p udp --sport 1024: --dport 53 \
>    -m state --state NEW -j ACCEPT
> iptables -A INPUT -i int_if -p tcp --sport 1024: --dport 53 \
>    -m state --state NEW -j ACCEPT

Out of interest, why only permit packets with a source port of 1024 and
above?  This rule might not pass DNS requests if they come from a local
DNS server being used internally, if it's set up with a "query-source"
of port 53.  Also the use of source ports is OS dependant, so if you're
going to watch this why not pick the range the OS uses?  The range of
your Linux system can be found via

cat /proc/sys/net/ipv4/ip_local_port_range

or

sysctl net.ipv4.ip_local_port_range

Apologies if I'm being pedantic, just wondering if I've missed
something...

-- 
mors omnia vincit

