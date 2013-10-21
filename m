From: Tiebing Zhang <tzhang@ncst.com>
Subject: RE: IPSec VPN client and SNAT
Date: Mon, 21 Oct 2013 00:41:11 +0000
Message-ID: <63D56E37DD5D8F49B566E188E684C57E175860D6@VAMAIL2.ncst.com>
References: <63D56E37DD5D8F49B566E188E684C57E17585B41@VAMAIL2.ncst.com>,<9b39ecb0-aabc-4ac2-bf3b-a50e60304ed9@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9b39ecb0-aabc-4ac2-bf3b-a50e60304ed9@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruno Gysels <bruno.gysels@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Shrew software adds the SA automatically. So here is the XFRM state and poliy dump

( just restarted the vpn so ignore the byte count for now):



$ sudo ip -s x state
src 192.168.5.201 dst 192.168.5.60
        proto esp spi 0xbc57d988(3159873928) reqid 0(0x00000000) mode tunnel
        replay-window 4 seq 0x3355166544 flag  (0x00000000)
        auth-trunc hmac(sha1) 0x9d2cdd5506a4aad1f453c7160bfa6f6de0432792 (160 bits) 96
        enc cbc(aes) 0x2c46d783137dbd316c86ed7a0dc9c764 (128 bits)
        sel src 0.0.0.0/0 dst 0.0.0.0/0 uid 0
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 2880(sec), hard 3600(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          76(bytes), 1(packets)
          add 2013-10-20 17:34:40 use 2013-10-20 17:35:31
        stats:
          replay-window 0 replay 0 failed 0
src 192.168.5.60 dst 192.168.5.201
        proto esp spi 0x04d45aff(81025791) reqid 0(0x00000000) mode tunnel
        replay-window 4 seq 0x4038476940 flag  (0x00000000)
        auth-trunc hmac(sha1) 0x76030cf892d53b248cc73cd6629287c36756085a (160 bits) 96
        enc cbc(aes) 0xc88906d5c7f5c01a889a5ac143c957ee (128 bits)
        sel src 0.0.0.0/0 dst 0.0.0.0/0 uid 0
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 2880(sec), hard 3600(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2013-10-20 17:34:40 use -
        stats:
          replay-window 0 replay 0 failed 0



$ sudo ip -s x policy
src 192.168.2.102/32 dst 0.0.0.0/0 uid 0
        dir out action allow index 11225 priority 0 ptype main share any flag  (0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2013-10-20 17:34:40 use 2013-10-20 17:35:31
        tmpl src 192.168.5.201 dst 192.168.5.60
                proto esp spi 0x00000000(0) reqid 0(0x00000000) mode tunnel
                level required share any
                enc-mask 00000000 auth-mask 00000000 comp-mask 00000000
src 0.0.0.0/0 dst 192.168.2.102/32 uid 0
        dir in action allow index 11216 priority 0 ptype main share any flag  (0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2013-10-20 17:34:40 use -
        tmpl src 192.168.5.60 dst 192.168.5.201
                proto esp spi 0x00000000(0) reqid 0(0x00000000) mode tunnel
                level required share any
                enc-mask 00000000 auth-mask 00000000 comp-mask 00000000
src 192.168.5.201/32 dst 192.168.5.60/32 uid 0
        dir out action allow index 11209 priority 0 ptype main share any flag  (0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2013-10-20 17:34:40 use 2013-10-20 17:35:16
src 192.168.5.60/32 dst 192.168.5.201/32 uid 0
        dir in action allow index 11200 priority 0 ptype main share any flag  (0x00000000)
        lifetime config:
          limit: soft (INF)(bytes), hard (INF)(bytes)
          limit: soft (INF)(packets), hard (INF)(packets)
          expire add: soft 0(sec), hard 0(sec)
          expire use: soft 0(sec), hard 0(sec)
        lifetime current:
          0(bytes), 0(packets)
          add 2013-10-20 17:34:40 use 2013-10-20 17:35:16



GW runs Fedora 19. I couldn't get TRACE to work. I added the trace in iptables and "modprobe xt_LOG",

but nothing shows up in the log file. I had to use iptables "LOG" target in the mangle/raw/filter tables to see

where packets are traveling.



Thanks again for your help.


