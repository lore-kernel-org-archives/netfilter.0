From: =?UTF-8?B?0K7RgNC40Lkg0J/Rg9GF0LDQu9GM0YHQutC40Lk=?= 
	<aikipooh@gmail.com>
Subject: mangling packets with nfqueue and conntrack
Date: Mon, 30 Dec 2013 02:06:00 +0400
Message-ID: <CAKws=GR7BD9ESiuwpxSQXY7=vGO8iiCYE21cmwLemOrCe6vK6A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=3jEpw6c3MENz/eC3lpn/jCYC9RGJvm8Iq3JLP0X29eI=;
        b=ui91uG8VwdXE7hv+Y6CBIdRQ5T4GISMMfFk22imqyasVzIXHRw/KHenOtFDX0qn0sr
         N8jtRyVxuIpQkGLI4p6pCe2BQJHlubn1vxbP2hdPmqClZA+Rhcr4hWQ6cblSZ3MRp1VH
         5fxc6qn8LnUv+gXim+pxHb0Fvdgqs9vUHkyCuR/RrSr4vwwP5LjFelD+xzJJ9AqsZy5L
         ScLemrSawc6JeDzlM9MXXhUe8xVEQ6TAGyUt6EFWgolY+IgvW9/blbfWq6JKVIM+B6nm
         EY9L0LLppbZK6wiL4qzwwEWHxJxGzui1gRNQztbuia7olC9ITJsRA9mJD4oXhLwzp1Oc
         Ccxw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Good UTC night, everyone!

I have one host, let's call it server, with iptables setup like this:

iptables -tmangle -A PREROUTING -j CONNMARK --restore-mark
iptables -tmangle -A PREROUTING -j LOG --log-prefix "pre "
iptables -tmangle -A PREROUTING -p tcp -s 192.168.3.10 --dport 80 -j
MARK --set-mark 0x10
iptables -tmangle -A PREROUTING -j LOG --log-prefix "test "
iptables -tmangle -A PREROUTING -m mark --mark 0x10 -j NFQUEUE
iptables -tmangle -A POSTROUTING -j LOG --log-prefix "post "
iptables -tmangle -A POSTROUTING -j CONNMARK --save-mark

The program employs libnetfilter_queue to mangle packets, it gets a
packet from a host in the internal network (192.168.3.10), changes the
srcaddr to external interface, and destaddr to the target address and
calls nfq_set_verdict to ACCEPT it. The packet leaves then the
external interface without problem.
Now I want to route all incoming replies to the same nfqueue, but the
reply packet (the very first one with SYNACK) doesn't have the mark.
The excerpt of the kernel log follows:

Dec 30 01:42:18 localhost kernel: pre IN=enp0s19f5u2 OUT=
MAC=00:0a:cd:23:fb:3f:00:0a:cd:23:fb:ab:08:00 SRC=192.168.3.10
DST=10.232.68.43 LEN=64 TOS=0x10 PREC=0x00 TTL=64 ID=2753 DF PROTO=TCP
SPT=48053 DPT=80 WINDOW=29200 RES=0x00 SYN URGP=0
Dec 30 01:42:18 localhost kernel: test IN=enp0s19f5u2 OUT=
MAC=00:0a:cd:23:fb:3f:00:0a:cd:23:fb:ab:08:00 SRC=192.168.3.10
DST=10.232.68.43 LEN=64 TOS=0x10 PREC=0x00 TTL=64 ID=2753 DF PROTO=TCP
SPT=48053 DPT=80 WINDOW=29200 RES=0x00 SYN URGP=0 MARK=0x10
Dec 30 01:42:18 localhost kernel: post IN= OUT=enp3s0 SRC=10.232.68.43
DST=173.194.32.160 LEN=60 TOS=0x10 PREC=0x00 TTL=63 ID=2753 DF
PROTO=TCP SPT=48053 DPT=80 WINDOW=29200 RES=0x00 SYN URGP=0 MARK=0x10
Dec 30 01:42:18 localhost kernel: pre IN=enp3s0 OUT=
MAC=00:1e:8c:0c:c4:54:a0:f3:e4:5f:2a:30:08:00 SRC=173.194.32.160
DST=10.232.68.43 LEN=52 TOS=0x00 PREC=0x00 TTL=55 ID=0 DF PROTO=TCP
SPT=80 DPT=48053 WINDOW=29200 RES=0x00 ACK SYN URGP=0
Dec 30 01:42:18 localhost kernel: test IN=enp3s0 OUT=
MAC=00:1e:8c:0c:c4:54:a0:f3:e4:5f:2a:30:08:00 SRC=173.194.32.160
DST=10.232.68.43 LEN=52 TOS=0x00 PREC=0x00 TTL=55 ID=0 DF PROTO=TCP
SPT=80 DPT=48053 WINDOW=29200 RES=0x00 ACK SYN URGP=0
Dec 30 01:42:18 localhost kernel: post IN= OUT=enp3s0 SRC=10.232.68.43
DST=173.194.32.160 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=7701 DF
PROTO=TCP SPT=48053 DPT=80 WINDOW=0 RES=0x00 RST URGP=0

When I set up the server as a simple router and try to connect from
internal network, the conntrack works and the reply packets are
marked.

What can be the problem here? I have tried to ask people on
serverfault and superuser, but no one could help.

-- 
Point of presence: http://aikipooh.ipernity.com
