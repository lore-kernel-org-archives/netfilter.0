From: "Paul E R J" <perj8@hotmail.com>
Subject: Re: ipt_recent 0.2.3/0.2.7 --rttl doesn't work
Date: Wed, 05 Feb 2003 15:01:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F184XtTGjI0q2xR3Bz60000d354@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm using kernel 2.4.20.

Also my iptables is more complicated.  Notice that the name of the 
recentDropBox chain in iptables is the same name as --name recentDropBox for 
-m recent.  It goes like this (to be more exact):

Pkt Rule (recentDropBox chain, filter table)
3 iptables -j LOG --log-prefix recentDropBox -m limit
3 iptables -j DROP -m recent --set --name recentDropBox

Pkt Rule (dropBox chain, filter table)
3 iptables -j recentDropBox -p tcp -m multiport --dports ...,137,...

Pkt Rule (INPUT chain, filter table)
0 iptables -j ACCEPT -m state --state ESTABLISHED,RELATED
0 iptables -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
3 iptables -j dropBox -i ppp0
0 iptables -j recentDropBox -i ppp0

I simplified my iptables in my first post.

####################
IMPORTANT!  I found out --update --rttl in the setup above does NOT behave 
the same as the following setup...

Pkt Rule (INPUT chain)
0 iptables -j ACCEPT -m state --state ESTABLISHED,RELATED
2 iptables -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
1 iptables -j LOG -i ppp0 --log-prefix recentDropBox -m limit
1 iptables -j DROP -i ppp0 -m recent --set --name recentDropBox

--update --rttl works here, but doesn't work in the more complicated setup I 
have.  Why?
#####################

I tried --set and --rttl and it matches ALL packets that hit the rule even 
when it is not in the recentDropBox list.

# grep 24.238 /proc/net/ipt_recent/recentDropBox
src=24.238.110.135 ttl: 122 last_seen: 7623667 oldest_pkt: 3 last_pkts: 
7622677, 7622972, 7623667
src=24.238.110.103 ttl: 122 last_seen: 7685346 oldest_pkt: 3 last_pkts: 
7684441, 7684736, 7685346

Pkt Rule (recentDropBox chain, filter table)
0 iptables -j LOG --log-prefix recentDropBox -m limit
0 iptables -j DROP -m recent --set --name recentDropBox

Pkt Rule (dropBox chain, filter table)
0 iptables -j recentDropBox -p tcp -m multiport --dports ...,137,...

Pkt Rule (INPUT chain, filter table)
0 iptables -j ACCEPT -m state --state ESTABLISHED,RELATED
-->6 iptables -j DROP -i ppp0 -m recent --set --rttl --name recentDropBox
0 iptables -j dropBox -i ppp0
0 iptables -j recentDropBox -i ppp0


You mean use --set --rttl in the last rule?

I got DUPLICATE entries!!!
# grep 24.238 /proc/net/ipt_recent/recentDropBox
src=24.238.110.36 ttl: 122 last_seen: 7760513 oldest_pkt: 1 last_pkts: 
7760513
src=24.238.110.36 ttl: 122 last_seen: 7760804 oldest_pkt: 1 last_pkts: 
7760804
src=24.238.110.36 ttl: 122 last_seen: 7761405 oldest_pkt: 1 last_pkts: 
7761405

/var/log/messages
Feb  5 09:03:09 router kernel: recentDropBoxIN=ppp0 OUT= MAC= 
SRC=24.238.110.36
DST=24.239.135.221 LEN=48 TOS=0x00 PREC=0x00 TTL=122 ID=320 DF PROTO=TCP 
SPT=306
9 DPT=137 WINDOW=8760 RES=0x00 SYN URGP=0
Feb  5 09:03:12 router kernel: recentDropBoxIN=ppp0 OUT= MAC= 
SRC=24.238.110.36
DST=24.239.135.221 LEN=48 TOS=0x00 PREC=0x00 TTL=122 ID=321 DF PROTO=TCP 
SPT=306
9 DPT=137 WINDOW=8760 RES=0x00 SYN URGP=0
Feb  5 09:03:18 router kernel: recentDropBoxIN=ppp0 OUT= MAC= 
SRC=24.238.110.36
DST=24.239.135.221 LEN=48 TOS=0x00 PREC=0x00 TTL=122 ID=322 DF PROTO=TCP 
SPT=306
9 DPT=137 WINDOW=8760 RES=0x00 SYN URGP=0

Pkt Rule (recentDropBox chain, filter table)
3 iptables -j LOG --log-prefix recentDropBox -m limit
-->3 iptables -j DROP -m recent --set --rttl --name recentDropBox

Pkt Rule (dropBox chain, filter table)
3 iptables -j recentDropBox -p tcp -m multiport --dports ...,137,...

Pkt Rule (INPUT chain, filter table)
0 iptables -j ACCEPT -m state --state ESTABLISHED,RELATED
0 iptables -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
3 iptables -j dropBox -i ppp0
0 iptables -j recentDropBox -i ppp0


-----------------------------------------------------------------
> > I'm using vanilla kernel 2.0.43 with patches from patch-o-matic CVS
> > (Jan24,2003), openmosix, super-freeS/WAN, ipt_recent 0.2.7
> > (ipt_recent-0.2.6.tar.gz).  And netfilter stuff all built as modules.
>
>   You're using 2.0.43?  iptables was introduced in 2.4...
>
> > Here are the rules in my iptables 1.2.7a:
> > INPUT chain (default DROP):
> > -j ACCEPT -i ppp0 --state ESTABLISHED,RELATED
> > -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
> > -j LOG -i ppp0 --log-prefix recentDropBox -m limit
> > -j DROP -i ppp0 -m recent --set --name recentDropBox
>
>   First you might try adding --rttl to the --set line.  I'll also go
>   back and check my code in that area...  Using the latest ipt_recent,
>   can you paste what you see in /proc/net/ipt_recent/recentDropBox?
>
>   There could certainly be a problem in that area as the TTL match has
>   been tested less...
>
>   	Stephen


_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


