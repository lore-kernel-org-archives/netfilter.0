From: palica <palica+netfiler@cupka.name>
Subject: nftables DNAT not working
Date: Wed, 21 Oct 2015 12:33:13 +0200
Message-ID: <562769E9.5000200@cupka.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cupka.name; s=mail;
	t=1445423581; bh=uk5rxVhIZzHXr1oo9M+H1PHllELcSslXIUe16zGxJXk=;
	h=From:Subject:To:Date;
	b=YohqJ0PqnkVLyRNs2q07dgue7diLbw0+c1HdtMYWdXo+0QKnqO4f8U4xvE/3bvqCf
	 FBYVckGpX+726WOZBVBPYfvgqBjCwu3dpBu+aFigEF7toIuN+bo6EIAN5YhZx44MfR
	 4DQv2JlpDLPdG3rSYEdKQHGKZ1ccQPW96yyqvCv0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

hello list,

please help me debug this.

I have 4.0.5 kernel and 0.5 nftables installed. this is my ruleset

table ip filter {
        chain input {
                type filter hook input priority 0; policy accept;
                ct state established,related counter packets 303 bytes
18088 accept
                ct state invalid counter packets 4 bytes 292 log prefix
"Invalid traffic: " drop
                iif lo counter packets 0 bytes 0 accept
                ip protocol icmp accept
                tcp dport ssh ct state new counter packets 5 bytes 212
log prefix "New SSH connection: " accept
                tcp dport { http, https} ct state new counter packets 7
bytes 352 log prefix "New HTTP/S connection: " accept
                counter packets 30 bytes 1497 log prefix "Dropped
traffic: " drop
        }

        chain forward {
                type filter hook forward priority 0; policy accept;
                ct state new counter packets 0 bytes 0 log prefix
"FORWARD CHAIN: " accept
        }

        chain output {
                type filter hook output priority 0; policy accept;
                ct state new counter packets 33 bytes 2476 log prefix
"OUTPUT CHAIN: "
        }
}
table ip nat {
        chain prerouting {
                type nat hook prerouting priority 0; policy accept;
                tcp dport { http, https} counter packets 0 bytes 0 log
prefix "DNAT :" dnat 10.0.3.40
                log prefix "DNAT prerouting: "
        }

        chain postrouting {
                type nat hook postrouting priority 0; policy accept;
                ip saddr 10.0.3.0/24 oif br0 counter packets 0 bytes 0
snat 37.187.110.20
                log prefix "SNAT postrouting: "
        }
}
table ip6 filter {
        chain input {
                type filter hook input priority 0; policy accept;
                iif lo counter packets 0 bytes 0 accept
                ct state established,related counter packets 8 bytes 768
accept
                ct state invalid counter packets 0 bytes 0 log prefix
"Invalid traffic: " drop
                icmpv6 type { nd-router-advert, nd-neighbor-advert,
echo-request, nd-neighbor-solicit} counter packets 70 bytes 5024 accept
                tcp dport ssh ct state new counter packets 0 bytes 0 log
prefix "New SSH connection: " accept
                tcp dport { https, http} ct state new counter packets 2
bytes 160 log prefix "New HTTP/S connection: " accept
                udp dport domain ct state new counter packets 0 bytes 0
log prefix "New DOMAIN connection: " accept
                counter packets 0 bytes 0 log prefix "Dropped
connection: " drop
        }
}

these are the only two packets that get logged upon trying to connect to
port 80
Oct 21 12:46:26 kernel: New HTTP/S connection: IN=br0 OUT=
MAC=00:22:4d:ad:bc:d0:1c:e6:c7:52:07:40:86:dd
SRC=2001:41d0:0008:d609:0000:0000:0000:0001
DST=2001:41d0:000a:6314:0000:0000:0000:0001 LEN=80 TC=0 HOPLIMIT=59
FLOWLBL=660071 PROTO=TCP SPT=60001 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0
Oct 21 12:46:26 kernel: New HTTP/S connection: IN=br0 OUT=
MAC=00:22:4d:ad:bc:d0:10:bd:18:e5:ff:80:08:00 SRC=5.135.156.9
DST=37.187.110.20 LEN=60 TOS=0x10 PREC=0x00 TTL=60 ID=15350 DF PROTO=TCP
SPT=58750 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0

the network interfaces are br0 the destination for DNAT is a LXC using veth.

What am I doing wrong/ overlooking?

Thank you very much for your time.

Palica
