From: Willi Dyck <wdyck@gmx.net>
Subject: Re: Port Forwarding Problem
Date: Tue, 25 Feb 2003 21:14:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225201418.GA1099@tekilla.homeip.net>
References: <3E5BB0BF.2070401@openadventures.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E5BB0BF.2070401@openadventures.org>
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

On Tue, Feb 25, 2003 at 11:06:55AM -0700, Tom Smith wrote:
> Having problem forwarding 216.161.174.4 port 8241 to 192.168.20.246 port 22.
> 
> I added the following rule to run DNAT:
> $IPTABLES -t nat -A PREROUTING -p tcp -d 216.161.174.4 --dport 8241 -j 
> DNAT --to-destination 192.168.20.246:22

Good.

> What I saw when trying to connect to the port from a remote host was:
> uccinet kernel: IN=eth1 OUT=eth0 SRC=64.158.129.226 DST=192.168.20.246 
> LEN=60 TOS=0x10 PREC=0x00 TTL=45 ID=63685 DF PROTO=TCP SPT=2030 DPT=22 
> WINDOW=5840 RES=0x00 SYN URGP=0
> 
> I later learned that I also needed some FORWARD rules to make it work. 
> The default script had most of them. I added:
> $IPTABLES -A FORWARD -d 192.168.20.246 -p tcp --dport 22 -j ACCEPT

Better. Much better would be a second rule which allows the way back
from 192.168.20.246.

$IPTABLES -A FORWARD -s 192.168.20.246 -p tcp --sport 22 -j ACCEPT

What I see in your 'iptables -nL' output is that you allow everything
in the FORWARD chain which has a state ESTABLISHED and/or RELATED, thus
the second rule above isn't necessery. Does 192.168.20.246 have routing
entry back to the inet? Also, what is the output of 'iptables -nvL
FORWARD'?

> Chain FORWARD (policy DROP)
> target     prot opt source               destination         
> ACCEPT     tcp  --  0.0.0.0/0            192.168.20.246     tcp dpt:22 
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
> drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          

Regards -- Willi

-- 
-----BEGIN GEEK CODE BLOCK-----
Version: 3.1
GPA/CS dx s-:- a-- C++$ UL/S+++>++++ P++>+++ L+++(++++)$ !E W+ N- o?
K? !w 0? !M V- PS++(---) !PE Y+ PGP++ t-- !5 X+ R- !tv b+(++) DI++
D+++ G e+ h-- r y?
------END GEEK CODE BLOCK------

