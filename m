From: Alex Bligh <alex@alex.org.uk>
Subject: State not matching late RST packets
Date: Mon, 28 Feb 2011 21:31:41 +0000
Message-ID: <CCB4E9B1F9E71199C5EA5793@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

I have a config on machine 10.1.1.1 which looks much like this:

-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A INPUT -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m limit --limit 2/sec -j LOG --log-prefix "iptables"
-A INPUT -p tcp -j REJECT --reject-with tcp-reset
-A INPUT -j REJECT --reject-with icmp-port-unreachable

The first 2 lines are dropping illegal tcp flags.

It is making *outbound* connections to machine 10.2.2.2 port 753.

I see lines like this in the log:

Feb 28 21:22:18 10.1.1.1 kernel: [26577.690615] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=48366 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:22:18 10.1.1.1 kernel: [26577.690633] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=44571 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:22:18 10.1.1.1 kernel: [26577.690651] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=44540 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:22:18 10.1.1.1 kernel: [26577.690669] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=44506 
WINDOW=0 RES=0x00 RST URGP=0

This indicates to me that 10.2.2.2 is sending an RST back after
10.1.1.1 believes the tcp connection has died. Possibly 10.1.1.1
is closing the socket without doing a proper shutdown() or something.

What is worrying is sometimes this appears to cause the remote end
to hang around trying to shutdown the socket (trace below - note
all related to one DPORT). I am concerned this will tie
up the remote end. Short of just allowing any old spurious
RST in, or fixing the application concerned, is there any way
I can make netfilter keep state on open connections open a bit longer,
i.e. count the RST within ESTABLISHED / RELATED for a few seconds
after the connection has closed? Or should the reject with
tcp-reset be sufficient? (I'm not sure you can reject an RST with
an RST).

Feb 28 21:08:24 10.1.1.1 kernel: [25742.851929] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:24 10.1.1.1 kernel: [25743.060559] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:24 10.1.1.1 kernel: [25743.480563] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:25 10.1.1.1 kernel: [25744.320574] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:27 10.1.1.1 kernel: [25746.000595] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:30 10.1.1.1 kernel: [25749.360635] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:37 10.1.1.1 kernel: [25756.080711] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:08:50 10.1.1.1 kernel: [25769.520675] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0
Feb 28 21:09:17 10.1.1.1 kernel: [25796.400746] iptablesIN=node OUT= 
MAC=00:16:3e:28:14:d5:00:15:17:1d:d6:5c:08:00 SRC=10.2.2.2.2 DST=10.1.1.1 
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=753 DPT=45777 
WINDOW=0 RES=0x00 RST URGP=0

-- 
Alex Bligh
