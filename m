From: Goetz Bock <netfilter@blacknet.de>
Subject: conntrack for samba/netbios-ns
Date: Wed, 5 Nov 2003 01:34:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031105003401.GA11702@shell.blacknet.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>


Dear list,

as googeling did not turn up anything nor did a browsing through the
lists archive turn up anything usefull, I'll just have to ask.

I'm running (well tried to) a very restricted samba server using the
excelente fireHOL firewalling script. I allow pc1 (a.b.c.17) to connect
to the samba server on pc2 (a.b.c.24), everything happens in a /27
subnet (e.g. a.b.c.31 is broadcast).

It produces some rules, and the relevant lines are:

> # Setting up rules for SAMBA/NETBIOS-NS (server)
> /sbin/iptables -t filter -A in_internet_samba_s2 -p udp -s pc1 --sport netbios-ns --dport netbios-ns -m state --state NEW\,ESTABLISHED -j ACCEPT
> /sbin/iptables -t filter -A in_internet_samba_s2 -p udp -s pc1 --sport 1024:65535 --dport netbios-ns -m state --state NEW\,ESTABLISHED -j ACCEPT
> /sbin/iptables -t filter -A out_internet_samba_s2 -p udp --sport netbios-ns -d pc1 --dport netbios-ns -m state --state ESTABLISHED -j ACCEPT
> /sbin/iptables -t filter -A out_internet_samba_s2 -p udp --sport netbios-ns -d pc1 --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT

further down all RELATED traffic is allowed. but that's basically it
(well, ssh and dns are allowed, too)


Without a firewall a connection attemp looks like this:

> 01:10:18.364212 a.b.c.17.32769 > a.b.c.31.netbios-ns: ...
> 01:10:18.364637 a.b.c.24.netbios-ns > a.b.c.17.32769: ...
> 01:10:18.673435 a.b.c.17.32781 > a.b.c.24.netbios-ssn: ...

so pc1 looks for the samba server using broadcasts, and pc2 replies.
Than pc1 talks to netbios-ssn and everything is fine.

With the firewall the following happens:

> 01:18:44.850282 a.b.c.17.32769 > a.b.c.31.netbios-ns: ...
> 01:18:45.159103 a.b.c.17.32769 > a.b.c.31.netbios-ns: ...
> 01:18:45.459074 a.b.c.17.32769 > a.b.c.31.netbios-ns: ...

at the same time dmesg logs:

> OUT-server:IN= OUT=eth1 SRC=a.b.c.24 DST=a.b.c.17 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137 DPT=32769 LEN=70
> OUT-server:IN= OUT=eth1 SRC=a.b.c.24 DST=a.b.c.17 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137 DPT=32769 LEN=70
> OUT-server:IN= OUT=eth1 SRC=a.b.c.24 DST=a.b.c.17 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137 DPT=32769 LEN=70

It looks like if the conntacking modules (all from stock 2.4.22) are not
ablel to relate the reply a.b.c.24.netbios-ns > a.b.c.17.32769 to the
request a.b.c.17.32769 > a.b.c.31.netbios-ns.

Is there a conntrack_netbios-ns or am I doing something wrong?

BTW: I know that this can be fixed by allowing NEW connections from
     pc2:netbios-ns to pc1:<highports>. In this scenario this would be
     basicaly save/sound. But it breaks down if I want to run a simmilar
     strict firewall (and I want to, on pc1 to be exact) on the client.
     Than I would have to allow all incomming connections from port
     netbios-ns to local high ports. And that is not realy desired.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

