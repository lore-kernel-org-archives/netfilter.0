From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: can someone check this simple firewall?
Date: Fri, 15 Aug 2003 23:25:24 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030815175524.GB2393@linux.local>
References: <7C9884991ADAE0479C14F10C858BCDF5122E21@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E21@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

Thanks a lot for the detailed explanation.
Comments inline.

On Wed, Aug 13, 2003 at 03:39:39PM -0700, Daniel Chemko wrote:
> ->> You probably want at least:
> ->> modprobe ipt_conntrack_ftp
> ->> modprobe ipt_nat_ftp

ok.

> $IPTABLES -F
> $IPTABLES -F -t nat
> 
> ->> Set this AFTER you have setup all your rules, otherwise you have a
> hole for hackers to reach through while applying rules

?????? But this will erase all the rules which we have set if you do it
at last.
 
> ->> Should instead be a related rule:
> ->> $IPTABLES -A INPUT -i lo -j ACCEPT # All Outbounds are ok
> ->> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT #

Got it. Great.

> ->>Only TCP connections, not UDP and -s 0/0 is redundant
> $IPTABLES -A INPUT -p tcp -s 0/0  --dport 21 -j ACCEPT
[...]

Ok. A bit OT here, but why not UDP? /etc/services lists udp also for the
same.

> $IPTABLES -A INPUT -p udp -s 0/0  --dport 80 -j ACCEPT
> ->> This will not work for responses. Use this as well:
> ->> $IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT if you want
> internet pings from the firewall to work
> $IPTABLES -A INPUT -p icmp -s $LAN_IP_RANGE -j ACCEPT

What is wrong with my rules?

> ->> This section is not needed. Set:
> ->> iptables -P OUTPUT ACCEPT

Ok. Then why not the same for FORWARD chain too? Since we are forwarding
everything from LAN outside as well?

If we want people to just do ftp and nothing else, will this be ok,

iptables -P FORWARD DROP
iptables -A FORWARD -p tcp -s 192.168.10.0/24 -d 0/0 --dport 21 -j ACCEPT


Thanks a lot for the wonderful explanation.
With warm regards,
-Payal


-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

