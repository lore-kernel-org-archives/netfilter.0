From: "toml@thlu.de" <toml@thlu.de>
Subject: Differences in FTP-Handling (Client-Sender) between
 iptables/nftables?
Date: Tue, 23 Jan 2018 15:45:36 +0100
Message-ID: <39761b3a-f5d8-0924-bd97-4208a24e257c@raspi1>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello @ all

A week ago I changed my iptables to nftabls for testing purposes.  Yeah, nftables
have really gotten better, i like it. My rules follow the premise, everything is
forbidden, which is not expressly allowed. But now I have an unsolvable problem
with understanding some of the interrelationships. This is a question for which
there seems to be no answer on the web: Is there a difference in the handling of
FTP-Ports between iptables and nftables...  from the perspective of a sending client?

This is my old basic-schema for iptables:
Chain INPUT (policy DROP 2391 packets, 301K bytes)
num target   prot opt in   out  source      destination
1   ACCEPT   all  --  *    *    0.0.0.0/0   0.0.0.0/0   ctstate RELATED,ESTABLISHED

     <some exclusive NEW accepts>
     <some exclusive NEW accepts saadr-binded to lan>

19  ACCEPT   icmp --  *    *    0.0.0.0/0   0.0.0.0/0   icmptype 8


Chain OUTPUT (policy DROP 101 packets, 12798 bytes)
num   target prot opt in   out  source      destination
1   ACCEPT   all  --  *    *    0.0.0.0/0   0.0.0.0/0   ctstate RELATED,ESTABLISHED

2   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp dpt:21 ctstate NEW
3   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp spts:1024:65535 dpts:1024:65535 ctstate NEW
     <some further exclusive NEW accepts>

13  ACCEPT   icmp --  *    *    0.0.0.0/0   0.0.0.0/0


And this is my new basic-schema for nftables, which is basically the same as the previous schema:
table ip filter {
     chain INPUT {
         type filter hook input priority 0; policy drop;
         ct state established,related accept

         <some exclusive NEW accepts>
         <some exclusive NEW accepts saadr-binded to lan>

         icmp type echo-request limit rate 1/second accept
     }
     chain OUTPUT {
         type filter hook input priority 0; policy drop;
         ct state established,related accept

         tcp dport ftp ct state new accept
         <some further exclusive NEW accepts>

         ip protocol icmp counter accept
     }
}


The peculiarity is, in the iptables-rules, FTP-Send only works with this Statement:
3   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp spts:1024:65535 dpts:1024:65535 ctstate NEW

In the nftables rule it works also without this (translated) rule, see above. Is there an
explanation for this? Thank you for your Help.

Best Regards from Germany
Thomas Luening


ps
I'm sorry, but I needed for this Mail the help from https://www.deepl.com/translator




