From: =?us-ascii?Q?Sebastian_Cla=3Fen?= <clse0001@hs-niederrhein.de>
Subject: RPC match Problem
Date: Wed, 9 Apr 2003 16:02:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2fea0$a0950b60$0200a8c0@basti79>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm trying to allow NFS-Mounts (and ditionaly NIS) to the machine
running iptables.
Got the following rule in "filter"-table:
-A INPUT -p udp -m rpc -m udp -s x.x.x.0/24 -i eth1 --dport sunrpc
--sport 0:1023 -j ACCEPT --rpcs
portmapper,nfs,mountd,ypserv,ypbind,rstatd,llockmgr,nlockmgr
-A INPUT -m helper -m state -s x.x.x.0/24 -i eth1 --state
ESTABLISHED,RELATED -j ACCEPT  --helper rpc
-A OUTPUT -m helper -m state -d x.x.x.0/24 -o eth1 --state
ESTABLISHED,RELATED -j ACCEPT  --helper rpc

I tried it with and without "-m helper --helper rpc".

Doing tcpdump during connection WITHOUT any rules brings the following:
11:31:55.228237 client.700 > server.sunrpc:  udp 56
11:31:55.229171 server.sunrpc > client.700:  udp 28 (DF)
11:31:55.229414 client.700 > server.sunrpc:  udp 56
11:31:55.229637 server.sunrpc > client.ZI.700:  udp 28 (DF)
11:31:55.229917 client.700 > server.868:  udp 100
----
11:31:55.258482 server.868 > client.700:  udp 60 (DF)
11:31:55.258825 client.2176895300 > server.nfs: 132 lookup [|nfs]
11:31:55.259050 server.nfs > client.2176895300: reply ok 128 lookup
[|nfs] (DF)
11:31:55.259433 client.2176895301 > server.nfs: 120 read [|nfs]
11:31:55.274379 server.nfs > client.2176895301: reply ok 1124 read (DF)

At the point marked "----" it stopps when i'm using the rules above.

I enabled debugging in ip_conntrack_rpc_udp, ip_conntrack_rpc_tcp and
ipt_rpc.
The i got the following messages:
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: new packet to
evaluate ..
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet is from the
initiator. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: RPC packet contains
a "get" requestor. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: RPC packet contains
procedure request [100005]. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: allocated RPC req_p
for xid=3524466890 proto=17 141.46.64.8:700
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: allocated RPC
request for protocol 17. [done]
Apr  9 13:45:23 server kernel: ipt_rpc: new packet to evaluate ..
Apr  9 13:45:23 server kernel: ipt_rpc: ct detected. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: PROTO_UDP [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: packet length is correct. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: RPC packet contains a "get"
requestor. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: entered match_rpcs [-1] [100005]
..
Apr  9 13:45:23 server kernel: ipt_rpc: RPC packet contains authorised
procedure request [100005]. [match]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: new packet to
evaluate ..
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet is from the
receiver. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: port found: 868
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: expect related ip
141.46.64.8:0-141.46.64.254:868 proto=17
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: expect related mask
255.255.255.255:0-255.255.255.255:65535 proto=65535
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet evaluated.
[expect]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: new packet to
evaluate ..
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet is from the
initiator. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: RPC packet contains
a "get" requestor. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: RPC packet contains
procedure request [100003]. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: allocated RPC req_p
for xid=3541244106 proto=17 141.46.64.8:700
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: allocated RPC
request for protocol 17. [done]
Apr  9 13:45:23 server kernel: ipt_rpc: new packet to evaluate ..
Apr  9 13:45:23 server kernel: ipt_rpc: ct detected. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: PROTO_UDP [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: packet length is correct. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: RPC packet contains a "get"
requestor. [cont]
Apr  9 13:45:23 server kernel: ipt_rpc: entered match_rpcs [-1] [100003]
..
Apr  9 13:45:23 server kernel: ipt_rpc: RPC packet contains authorised
procedure request [100003]. [match]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: new packet to
evaluate ..
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet is from the
receiver. [cont]
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: port found: 2049
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: expect related ip
141.46.64.8:0-141.46.64.254:2049 proto=17
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: expect related mask
255.255.255.255:0-255.255.255.255:65535 proto=65535
Apr  9 13:45:23 server kernel: ip_conntrack_rpc_udp: packet evaluated.
[expect]

Port 868 is for mountd and 2049 for nfs an both seemed to be "expected".
But in /proc/net/pi_conntrack i found only a line "EXPECTING: ..." for
port 2049 and no line (not expection nor established) for port 868.

Anybody got a clue?

BTW: Is there any reason why the examples in rpc.patch.help inserting
rules to nat/PREROUTING instead? I tried that too, doesn't work either.

Greets
  Sebastian.


