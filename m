From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: too many INVALID packets
Date: Wed, 18 Jun 2008 14:15:00 +0200
Message-ID: <200806181415.00808.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all.

I have a couple of questions about netfilter conntrack and INVALID packets. 

I'm administrator of couple of servers, some of them still running 2.4 
kernels, some running (upgraded or new install) to 2.6.18 (Debian packaged 
kernels). On all of them I have firewall beginning with these rules:

iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -m state --state INVALID -j DROP

and the same in FORWARD chain.

Machines with 2.4 kernel see almost no INVALID packets in the long run.
Machines with 2.6 kernel see hundreds of INVALID packets every day. 
I suppose that the logic deciding what is INVALID has changed a lot a now 
catches more stuff than before.

However on two servers I had to pass INVALID packets through as the users 
complained about hanging connections or being unable to connect at all.
Part of the problem involved Xen, and checksum offloading and was solved by 
turning tx-checksumming off on virtual interfaces. But even after that, this 
server and another one (without xen) see lots (thousands a day on workdays, 
hundreds a day on weekends) of INVALID packets. I do not think they are just 
some weird portscans as they come also from local network and there is 
significant drop on weekends. Most of the invalid packets have ACK FIN or ACK 
RST flags, and seem to be part (end) of regular connections. What can I do 
about these? and what happens if I just drop them?

I wanted to find out more why these packets are marked as INVALID, so I did:
echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

BTW it should be documented somwhere - not only in source code - that you have 
to enter the protocol number you want get logged. Many sources on internet 
suggest echo 1 > /proc/...log_invalid, and it sounds logical that this file 
just swithces logiing on/off. But no, it logs only the protocol you ask 
(1-ICMP, 6-TCP, 17-UDP .. see ./include/linux/in.h)

Now I see log entries like:

ip_ct_tcp: invalid packet ignored IN= OUT= SRC=a.b.c.d DST=x.y.z.q LEN=48 
TOS=0x00 PREC=0x00 TTL=118 ID=57462 DF PROTO=TCP SPT=2745 DPT=110 
SEQ=1241333208 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT (020405B401010402)
(most of them have SYN flag)

Interesting thing is that these log entries do not match those logged by
iptables -t filter -A INPUT -m state --state INVALID -j LOG

Can someone tell why these two logs do not match, and what happens with 
packets logged by (ip_ct_tcp) ip_conntrack_log_invalid?

I noticed that iptables offers new match: -m conntrack --ctstate
which has also NEW, RELATED, ESTABLISHED and INVALID states. Are they somehow 
different from those matched by -m state --state ?

I suspected that problems might be with intel giabit ethernet cards (e1000) 
and their checksum offloading (these are the only servers with such cards) so 
I tried to disable checksum offloading, but anyway there were just a few 
logged packets with wrong checksum. Even when I turned ip_conntrack_checksum 
off situation didn't change much. Anyway, I was wondering if checksum 
offloading has any sense on firewall, as netfilter will calculate and check 
the checkums anyway. Or is there any smart communication between the driver 
and netfilter saying that checksum is ok, or will be calculated later so 
netfilter does not have to care about checksums? 

Is it possible that disabling ip_conntrack_checksums would solve the problem 
with xen machines in the same way as disabling cheksum offloading did?

At last I would like to know if conntrack cares about TCP flags? Does it check 
if NEW (and RELATED) TCP packets have SYN flag set and if not treats them as 
INVALID? I tried this:

iptables -t filter -A INPUT -m state --state NEW -p tcp ! --syn -j LOG

and it catches quite a lot of packets, but still it seems that conntrack knows 
about TCP connections being opened (SYN) and closed (FIN). Is there any 
reason for NEW packets without SYN to be allowed through?

Thanks in advance for all answers. I tried to RTFM but didn't find these 
details anywhere so if you point me in the right direction I'd be glad.

-- 
Regards
        Vladislav Kurz
