From: Jason Opperisano <opie@817west.com>
Subject: Re: Question; what is this netfilter logfile entry ?
Date: Sun, 14 Nov 2004 12:02:02 -0500
Message-ID: <41978F8A.4070000@817west.com>
References: <1100392955.4894.25.camel@localhost.localdomain>
	<000c01c4c9f0$4807a0d0$de0aa8c0@comp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c4c9f0$4807a0d0$de0aa8c0@comp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Bo Jacobsen wrote:
> Nov 14 02:24:48 WF1-HOME kernel: DENY-OUT:.IN= OUT=eth0 SRC=192.168.1.2 DST=198.41.0.4 LEN=560 TOS=0x00 PREC=0xC0 TTL=64 ID=3123 PROTO=ICMP TYPE=3 CODE=3 [SRC=198.41.0.4 DST=192.168.1.2 LEN=532 TOS=0x00 PREC=0x00 TTL=49 ID=41159 PROTO=UDP SPT=53 DPT=51981 LEN=512 ]
> 
> It looks like ICMP with an embedded DNS call  ?.
> What is it exactly, and how would a rule to allow this look like ?

ICMP Type 3 Code 3:  Destination Unreachable, Port Unreachable

your gateway is telling 198.41.0.4 that it's packet with a src port of 
53 destined for 192.168.1.2:51981 was unreachable (i.e. host not 
listening on that port).

refer to:  http://www.iana.org/assignments/icmp-parameters

for the official list.

most of the time, these packets will fall under "-m state --state 
RELATED" however, from a "good Internet citizen" point of view, it's not 
a bad idea to allow ICMP errors codes to/from your gateway (PMTU 
discovery comes to mind).

   # unreachables
   iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
   iptables -A OUTPUT -p icmp --icmp-type 3 -j ACCEPT

   # time exceeded
   iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT
   iptables -A OUTPUT -p icmp --icmp-type 11 -j ACCEPT

   # parameter problem
   iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT
   iptables -A OUTPUT -p icmp --icmp-type 12 -j ACCEPT

-j

--
Jason Opperisano <opie@817west.com>


