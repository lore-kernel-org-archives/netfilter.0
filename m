From: Guillermo Chui Lau <memochui@equicomp.com.pe>
Subject: RE: transparent proxy
Date: Fri, 27 Feb 2004 14:19:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6B4345976F8D444ABCFEF8B628BAC1A0431565@APPSRV>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: tomekm@cea.pl

On Fri, 27 Feb 2004 09:48:39 +0100
"Tomasz Macioszek" <tomekm@cea.pl> wrote:

> Hello!
> I have a Linux server acting as a gateway between internal network and
> internet. The iptables rule set have been working  good for long time.
> I have configured squid on this server. When I have set internal network
> client to use directly proxy server it has worked properly. But when I
have
> set iptable to redirect all http traffic to squid  port (3128) it didn't
> work (transparent proxy).
> This is my iptable rule:
> iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
> I think that all options in my kernel are set properly.
> I don't know why it doesn't work
> I set tcpdump to listen on 3128 port and when client tried to connect to
web
> server on port 3128 showed only first IP  package of this connection and
> connections failed.
> Could you send me a solution for this problem?
> Best regards
> Tomek
> 
> 

YOU NEED TO IMPLEMENT THIS RULE

iptables  -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 \
-j REDIRECT --to-port 3128

LINUX SERVER HACKS Rob Flickenger

also make squid run in levels 3 ,4 and 5

chkconfig --level 345 squid on

if this doesnt work see if the iptables is doing  nat you should have a rule
like this one

iptables -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

also check if you are loading the modules

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state

you can check the modules using lsmod

Guillermo Chui Lau
Support Enginner

