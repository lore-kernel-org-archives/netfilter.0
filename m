From: useless@libero.it
Subject: problem
Date: Fri, 09 May 2003 03:26:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030509012626.6635.qmail@zero.sukkonet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi,
i've been an user of netfilter/iptables for a short time, and it's always 
worked great for me, doing NAT and packet filtering exactly as it should 
(thanx a lot to who wrote the NAT-HOWTO although :D). anyway, i'm 
experiencing some strange behaviour: 

i have a DNATting rule as the following:
iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP 

where EXTIF (ppp0 - yeah, dialup) and EXTIP (dynamically assigned but 
correctly detected) are properly set. recently i have set up a DNS server, 
and i wish it was accessible from the outside. i have used djbdns, and set 
it up correctly. actually the requests are received and processed, but the 
outgoing packets with the replies are blocked by my packet filter. i have 
the following log from dmesg: 

IN= OUT=ppp0 SRC=10.0.6.5 DST=80.116.131.210 LEN=68 TOS=0x00 PREC=0x00 
TTL=64 ID=0 DF PROTO=UDP SPT=53 DPT=4538 LEN=48 

10.0.6.5 is the ip which djbdns is running on, and 80... is the ip who made 
the request. what is strange is that the packet was trying to go out with 
the internal ip! is this normal? it's been blocked because i have a rule:
iptables -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it 

shouldn't the packet's source address have already been changed at this 
time? what am i doing wrong? may it be because it's using the UDP protocol? 
my natting rule should work with all protocols though... 

help me!
thanks in advance!
Giorgio

