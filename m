From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: Re: drop at FWD chain, why ?
Date: Wed, 4 Dec 2002 13:41:48 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021204184148.88103.qmail@web14508.mail.yahoo.com>
References: <200212041146.24723.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212041146.24723.netfilter@newkirk.us>
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

 --- Joel Newkirk <netfilter@newkirk.us> wrote: > On Wednesday 04 December 2002 04:34 am,
james.Q.L wrote:
> > i can't figure out why the following rules make the reply traffic drop. can
> > anyone help?
> >
> > it's internal server on 192.168.0.3:80 being forwarded from my external ip
> > at port 8888.
> 
> Both IP's are 192.168.x.x.  IN=OUT=eth0.  You NAT if _addressed_ to external 
> IP, but if it is coming from the LAN then it is IN interface INTIF.  Your 
> FORWARD rules don't address this.
> 
> > FWD dropIN=eth0 OUT=eth0 SRC=192.168.0.3 DST=192.168.0.12 LEN=64 TOS=0x00
> > PREC=0x00 TTL=127 ID=22473 DF PROTO=TCP SPT=80 DPT=1026 WINDOW=17520
> > RES=0x00 ACK SYN URGP=0
> >
> > #grep 192.168.0.12 /proc/net/ip_conntrack # this ip is the internal machine
> > make the request. tcp      6 59 SYN_RECV src=192.168.0.12 dst=myExternIP
> > sport=1109 dport=8888 src=192.168.0.3 dst=192.168.0.1 sport=80 dport=1109
> > use=1
> >
> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
> > ESTABLISHED,RELATED \ -j ACCEPT
> > $IPTABLES -A FORWARD -d 192.168.0.3 --dport 80 -j ACCEPT
> > $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> > $IPTABLES -A FORWARD -j LOG --log-prefix "FWD drop"
> 
> I see a forward rule to allow destination 192.168.0.3 port 80, allow in intif 
> out extif, and allow EST/REL in extif out intif.  The Dropped packet above, 
> however, was in intif out intif, which is NOT covered by a forward rule.  You 
> need either a rule for in INTIF out INTIF, or a rule that ignores -o, 
> (actually just remove the -o $ETXIF from the third rule above) or allows 
> -s192.168.0.3 dport 80.  

argh..thanks !

i was thinking since i can do http://192.168.0.3 from any internal machine. it's eth0 in and eth0
out as well. so that fwd rule is no problem at all.  but apparently it's being sent directly
without going thr the netfilter machine. feel stupid.

> > iptables -t nat -A PREROUTING -p tcp  -d externalIP --dport 8888 \
> > 	-j DNAT --to-destination 192.168.0.3:80
> > $IPTABLES -t nat -A POSTROUTING -p tcp -s 192.168.0.0/24 -d 192.168.0.3
> > --dport 80 -j SNAT --to-source 192.168.0.1
> 
> j
>  

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

