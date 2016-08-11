From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: conntrack helpers in kernel 4.7
Date: Thu, 11 Aug 2016 10:52:51 +0200
Message-ID: <20160811085251.GR9430@torres.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am running my firewall at home with Debian stable (which has
iptables 1.4.21) with a current kernel. Since the update to kernel
4.7, my connection tracking seems to be broken which shows itself in
sporadic malfunctions of SIP telephony. Protocols not needing
conntrack helpers do still work fine.

I have found the document "Secure use of iptables and connection
tracking helpers" on
https://home.regit.org/netfilter-en/secure-use-of-helpers/ and am
currently suspecting that support for the legacy mechanisms has been
removed in kernel 4.7 since the reject log messages for SIP packets
have started after I upgraded to linux 4.7.

However, I don't find anything about millions of firewalls suddenly
going up in flames on the net, which suggests that the phenomenon seen
on my system is not widely observed and that my hypothesis is wrong.

I have taken the opportunity of finally adding mod conntrack to my
existing (and unchanged) mod state rules. Since my mod state rules
don't apply any more (everythign seems to be caught by the mod
conntrack rules, I think this is fine.

I am at a loss about how to define the RELATED rules that need the
explicitly mention the helper. Regardless of how I write the rules,
they don't seem to apply and a lot of my SIP packets ends up in the
final REJECT rule.

Here is the relevant part of my rule set:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp spt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp dpt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp dpts:1:65535 helper match "sip"
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp spt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp dpt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp dpts:1:65535 helper match "sip"
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED helper match "sip"
  694  307K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
  180 18459 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            state INVALID
  670 64703 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            LOG flags 0 level 4 prefix "input "
  670 64703 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  int181 int181  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int191 int191  0.0.0.0/0            0.0.0.0/0
    2   120 ACCEPT     all  --  int182 int182  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int192 int192  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int183 int183  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int184 int184  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int185 int185  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int186 int186  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int187 int187  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int188 int188  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  int189 int189  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  per281 per281  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  unt381 unt381  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  unt382 unt382  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  unt383 unt383  0.0.0.0/0            0.0.0.0/0
    0     0 REJECT     all  --  int186 *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable
    0     0 REJECT     all  --  int187 *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable
  209 97813 ACCEPT     udp  --  int+   *       0.0.0.0/0            192.168.181.161      udp spt:68 dpt:67
    0     0 ACCEPT     udp  --  int+   *       0.0.0.0/0            192.168.251.12       udp spt:68 dpt:67
    0     0 ACCEPT     udp  --  int+   *       0.0.0.0/0            192.168.251.9        udp spt:68 dpt:67
    0     0 ACCEPT     udp  --  int+   *       0.0.0.0/0            192.168.251.53       udp spt:68 dpt:67
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp spt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp dpt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp dpts:1:65535 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp spt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp dpt:5060 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED udp dpts:1:65535 helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate ESTABLISHED helper match "sip"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp spt:69 helper match "tftp"
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED udp dpt:69 helper match "tftp"
1093K  729M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
 4003  208K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            state INVALID
43793 1897K int185in   all  --  int185 *       0.0.0.0/0            0.0.0.0/0

Chain int185in (1 references)
 pkts bytes target     prot opt in     out     source               destination
42506 1812K ACCEPT     all  --  *      unt+    192.168.185.250      0.0.0.0/0
    0     0 ACCEPT     all  --  *      int181  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  *      int191  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  *      int182  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  *      per281  0.0.0.0/0            0.0.0.0/0
 1287 84228 ACCEPT     all  --  *      unt381  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  *      unt382  0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  *      unt383  0.0.0.0/0            0.0.0.0/0

Chain POSTROUTING (policy ACCEPT 16480 packets, 1385K bytes)
 pkts bytes target     prot opt in     out     source               destination
 9046  577K MASQUERADE  all  --  *      unt+    192.168.184.0/23     0.0.0.0/0

If you prefer reading iptables-save output, I have pasted it under my
signature.

192.168.185.250 is my internal SIP machine. The firewall does also NAT
for the machines on the internal networks.

And here is what my firewall logs when someone tries to call me:
Aug 10 21:31:09 barrida kernel: input IN=unt381 OUT= MAC=1a:db:fb:4d:fd:f8:9c:c7:a6:2a:f6:09:08:00:45:10:05:94 SRC=212.227.67.205 DST=192.168.251.241 LEN=1428 TOS=0x10 PREC=0x00 TTL=56 ID=8610 PROTO=UDP SPT=5060 DPT=5060 LEN=1408

This confuses me:

(1) Why does the packet end up in the input queue in the first place?
To me, this looks like the incoming packet on unt381 is not correctly
tracked by the NAT code. It should be natted and processed by the
FORWARD chain.

(2) Why are the packet counters of all ctstate rules with helper match
"sip" at zero? Why don't they apply for the incoming packet which
seems to fall through until the concluding REJECT rule?

(3) do I need the PREROUTING --jump CT rule mentioned in the Securing
helpers page if I only use the default Port 5060?

I would appreciate your hints.

Greetings
Marc


-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421



iptables-save:
# Generated by iptables-save v1.4.21 on Thu Aug 11 10:48:27 2016
*raw
:PREROUTING ACCEPT [1195282:737239692]
:OUTPUT ACCEPT [5928:1550650]
COMMIT
# Completed on Thu Aug 11 10:48:27 2016
# Generated by iptables-save v1.4.21 on Thu Aug 11 10:48:27 2016
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [5927:1550562]
-A INPUT -p udp -m conntrack --ctstate RELATED -m udp --sport 5060 -m helper --helper sip -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate RELATED -m udp --dport 5060 -m helper --helper sip -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate RELATED -m udp --dport 1:65535 -m helper --helper sip -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED -m helper --helper sip -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate ESTABLISHED -m udp --sport 5060 -m helper --helper sip -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate ESTABLISHED -m udp --dport 5060 -m helper --helper sip -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate ESTABLISHED -m udp --dport 1:65535 -m helper --helper sip -j ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED -m helper --helper sip -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -m state --state INVALID -j DROP
-A INPUT -j LOG --log-prefix "input "
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -i int181 -o int181 -j ACCEPT
-A FORWARD -i int191 -o int191 -j ACCEPT
-A FORWARD -i int182 -o int182 -j ACCEPT
-A FORWARD -i int192 -o int192 -j ACCEPT
-A FORWARD -i int183 -o int183 -j ACCEPT
-A FORWARD -i int184 -o int184 -j ACCEPT
-A FORWARD -i int185 -o int185 -j ACCEPT
-A FORWARD -i int186 -o int186 -j ACCEPT
-A FORWARD -i int187 -o int187 -j ACCEPT
-A FORWARD -i int188 -o int188 -j ACCEPT
-A FORWARD -i int189 -o int189 -j ACCEPT
-A FORWARD -i per281 -o per281 -j ACCEPT
-A FORWARD -i unt381 -o unt381 -j ACCEPT
-A FORWARD -i unt382 -o unt382 -j ACCEPT
-A FORWARD -i unt383 -o unt383 -j ACCEPT
-A FORWARD -i int186 -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -i int187 -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -d 192.168.181.161/32 -i int+ -p udp -m udp --sport 68 --dport 67 -j ACCEPT
-A FORWARD -d 192.168.251.12/32 -i int+ -p udp -m udp --sport 68 --dport 67 -j ACCEPT
-A FORWARD -d 192.168.251.9/32 -i int+ -p udp -m udp --sport 68 --dport 67 -j ACCEPT
-A FORWARD -d 192.168.251.53/32 -i int+ -p udp -m udp --sport 68 --dport 67 -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m udp --sport 5060 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m udp --dport 5060 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m udp --dport 1:65535 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate ESTABLISHED -m udp --sport 5060 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate ESTABLISHED -m udp --dport 5060 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate ESTABLISHED -m udp --dport 1:65535 -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate ESTABLISHED -m helper --helper sip -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m udp --sport 69 -m helper --helper tftp -j ACCEPT
-A FORWARD -p udp -m conntrack --ctstate RELATED -m udp --dport 69 -m helper --helper tftp -j ACCEPT
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m conntrack --ctstate INVALID -j DROP
-A FORWARD -m state --state INVALID -j DROP
-A FORWARD -i int185 -j int185in
-A int185in -s 192.168.185.250/32 -o unt+ -j ACCEPT
-A int185in -o int181 -j ACCEPT
-A int185in -o int191 -j ACCEPT
-A int185in -o int182 -j ACCEPT
-A int185in -o per281 -j ACCEPT
-A int185in -o unt381 -j ACCEPT
-A int185in -o unt382 -j ACCEPT
-A int185in -o unt383 -j ACCEPT
*nat
:PREROUTING ACCEPT [55038:4057737]
:INPUT ACCEPT [548:153919]
:OUTPUT ACCEPT [1641:284010]
:POSTROUTING ACCEPT [16536:1391079]
-A POSTROUTING -s 192.168.184.0/23 -o unt+ -j MASQUERADE
