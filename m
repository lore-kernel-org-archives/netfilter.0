From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Mon, 19 Apr 2004 13:42:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040419114219.GC10272@home.manuelm.org>
References: <4083A3B2.7020808@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4083A3B2.7020808@linuxmail.org>
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

Hello,

* Feizhou <feizhou@linuxmail.org> 19. Apr 04:
> I have a whole bunch of ips/cidrs that I want to apply the rule to.

First match the general part of the rule and jump into a user defined
chain to match the specific IPs.  Eg.:

# iptables -N http_hosts
# iptables -A FORWARD -j http_hosts -p tcp --sport 1024:65535 --dport 80
# iptables -A http_hosts -j ACCEPT -s $ip1
# iptables -A http_hosts -j ACCEPT -s $ip2
# # [some more here]
# iptables -A http_hosts -j LOG --log-prefix='forbidden http: '
# iptables -A http_hosts -j REJECT

> Is there any way to insert one rule where the -s would be able to look 
> up a table (btree/hash/cdb whatever) that contains those ips/cidrs 
> instead of insert gazillion rules?

AFAIK, not as built in, unfortunately.  You can simulate something like
a btree (well, it's not balanced) with user defined chains, too.  Eg.
you have to match IPs in 192.168.0.0/24 you could 

# iptables -F http_hosts
# iptables -N http_hosts_l
# iptables -N http_hosts_h
# iptables -A http_hosts         -s 192.168.0.0/25   -j http_hosts_l
# iptables -A http_hosts         -s 192.168.0.128/25 -j http_hosts_h
# iptables -A http_hosts -j REJECT
# iptables -N http_hosts_ll
# iptables -N http_hosts_lh
# iptables -A http_hosts_l       -s 192.168.0.0/26   -j http_hosts_ll
# iptables -A http_hosts_l       -s 192.168.0.64/26  -j http_hosts_lh
# iptables -N http_hosts_hl
# iptables -N http_hosts_hh
# iptables -A http_hosts_h       -s 192.168.0.128/26 -j http_hosts_hl
# iptables -A http_hosts_h       -s 192.168.0.192/26 -j http_hosts_hh
# # [and so on]

Somewhen you will reach a rule like

# iptables -A http_hosts_lhlhhlh -s 192.168.0.90/32  -j ACCEPT
# iptables -A http_hosts_lhlhhlh -s 192.168.0.91/32  -j REJECT

(Of course the /32 is quite superfluous.) AFAICS you will surely hit a
ACCEPT or REJECT after (at most) 16 (?) tests for all (256) IPs in the
subnet.  For /16-subnets (65536 IPs) the same scheme would hit after 48
tests.  Of course you can leave out chains like

# iptables -A http_hosts_lhlhhlh -s 192.168.0.90/32  -j REJECT
# iptables -A http_hosts_lhlhhlh -s 192.168.0.91/32  -j REJECT

and reduce them to 

# iptables -A http_hosts_lhlhhl  -s 192.168.0.90/31  -j REJECT

Maybe you (or I) can write a script generating these rules.  Uh, this
looks funny.  Any comments on this?

 Regards, Frank.
-- 
Sigmentation fault

