From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP failed
Date: Sat, 6 Jul 2002 11:52:53 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207061052.g66Aqw803352@vulcan.rissington.net>
References: <200FAA488DE0D41194F10010B597610D2BA25C@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA25C@JUPITER>
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
To: netfilter@lists.samba.org

On Saturday 06 July 2002 11:40 am, George Vieira wrote:

> Because then you're not running a firewall, you're running a router..
>
> why bother doing that, just don't run any rules at all..

I think you're missing the point here - which was the benefits of using the ! 
negation operator in order to simplify the ruleset.

For example, suppose I have a firewall with six ethernet interfaces (which I 
regularly do, for connecting five customers to a single Internet link without 
each customer being able to access the others' networks).

Suppose that I want all the internal interfaces to be able to access the 
firewall by http (for some performance monitoring for example), but I do not 
want to allow such access from the Internet.

I can think of three rulesets to allow this (assuming there is a default DROP 
policy on the INPUT chain):

1: iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth2 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth3 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth4 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth5 -p tcp --dport 80 -j ACCEPT

2: iptables -A INPUT -i eth0 -p tcp --dport 80 -j DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

3: iptables -A INPUT -i ! eth0 -p tcp --dport 80 -j ACCEPT

I know which I find easiest to understand, and least prone to mistakes when 
maintaining the ruleset in six months' time....

 

Antony.

