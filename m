From: Andre Cunha <anovaescunha@gmail.com>
Subject: Packets not being nat'd intermittently with iptables
Date: Mon, 16 Jan 2017 11:43:13 +0100
Message-ID: <CAGOYNM-f9eaSL2CdX5E67EDxr9fsnxAeXMv0uaUNLcf5TJjfpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qvLxVhp2qjVEdb2X887RoSROxoH9Kk92P0MoqGFli1M=;
        b=r4b4op7mtPdgOMrMRvVZp29DPF5XLRe4PpPD1EqJ4qVTCGkiYuNI485jmYtiWnWYg3
         icol/R1xV6n35oCDCAAKKAO21jc25r1FCPVzRzQdKlq4YW2n2z+nGEzlPJ2jJWpAqGFd
         1A2xKsOWPYpY9uE0RBoJWTsVGsr7dNbBF9KrYHowzD1mYJaBFek+bOsox1nGPaoFtAtd
         IxXcHWu6+sj+Idmkuu/M2FbmUJGkkbnBKrt+YzknSfz1YbrE0nQPDGUyQtMN7ca9FDZv
         EHw70Tb9ZO21yToAnuHILBQZv/dd0eqbArKuzu7ENC8XT6gbug6BbQllbAwGKguba5hk
         kufQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm having a strange behavior with nat/iptables.

I have the following scenario:

Internet ---- [xenbr0] Server [xapi2] ----- VMs

The VMs are in the 192.168.0.0/24 subnet. I have NAT with iptables so
that external requests from the internet can reach the internal VMs.
I started a ping from an external client machine 50.116.26.209 to HTTP
server IP 78.x.x.229, which translates to IP 192.168.0.229 located in
one of the VMs. Here are the tcpdumps on each interface:

internal vm [evertyhing ok on the vm side]
-----------
02:20:07.848280 IP 50.116.26.209 > 192.168.0.229: ICMP echo request,
id 23409, seq 3, length 64
02:20:07.848304 IP 192.168.0.229 > 50.116.26.209: ICMP echo reply, id
23409, seq 3, length 64

xapi2 [only echo request, no replies here...]
-----
02:20:49.077968 IP 50.116.26.209 > 192.168.0.229: ICMP echo request,
id 23409, seq 3, length 64

xenbr0 [2 packets replies for the same request, one nat'd and the
other with internal address]
------
02:20:49.078071 IP 192.168.0.229 > 50.116.26.209: ICMP echo reply, id
23409, seq 3, length 64
02:20:49.078107 IP 78.x.x.228 > 50.116.26.209: ICMP echo reply, id
23409, seq 3, length 64

Another strange thing that I see is internal interface xapi2 receiving
packets without being NAT'd:

TRACE: nat:PREROUTING:policy:9 IN=xapi2 OUT= SRC=50.116.26.209 DST=78.x.x.229
TRACE: filter:INPUT:rule:8 IN=xapi2 OUT= SRC=50.116.26.209 DST=78.x.x.229

When this happens, the packet is discarded (rule 8 in my filter
table), but these packets should not be there in the first place...
and it happens occasionally, but enough to cause access problems to
the web server.

[root@xenserver-2 ~]# iptables --list -n -v
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
54498  112M ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
  193 55092 ACCEPT     47   --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       91.122.159.196
138.201.64.228
 4256  317K ACCEPT     all  --  xapi2  *       192.168.0.0/24
0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       78.x.x.231
0.0.0.0/0
 855K   60M ACCEPT     all  --  *      *       0.0.0.0/0
78.x.x.231
>>>>>> 23970 1599K REJECT     all  --  *      *       0.0.0.0/0            78.x.x.224/29     reject-with icmp-port-unreachable
27361 3721K ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:443
 5326  453K ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0            icmptype 255
    0     0 ACCEPT     udp  --  xenapi *       0.0.0.0/0
0.0.0.0/0            udp dpt:67
2906K  932M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0            ctstate NEW udp dpt:694
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            ctstate NEW tcp dpt:443
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0            multiport dports 5404,5405
20938 1511K REJECT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
   30  1772 ACCEPT     tcp  --  *      *       0.0.0.0/0
192.168.0.225        multiport dports 8443:8446
  886 64643 ACCEPT     tcp  --  *      *       0.0.0.0/0
192.168.0.227        multiport dports 80,8069,8080,8090
75056   89M ACCEPT     all  --  xapi2  *       192.168.0.0/24
0.0.0.0/0
80933 6781K ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0            icmptype 8
  443 32522 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:22022
 122K   11M ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            multiport dports 80,443
 141K  119M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       91.122.159.196
0.0.0.0/0
12036  635K REJECT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            reject-with icmp-port-unreachable

Basically packets go to the PREROUTING table for nat as expected, and
the ones that for some reason do not get nat'd, reach the INPUT chain
(since net 78.x.x.224/29 is local to the host) and hit the REJECT
rule. The remote client received an ICMP port unreachable message.
Since the issue is intermittent, I'm considering that there is some
issue either with iptables or the kernel...

Another strange thing in the TRACE output is that the NAT/PREROUTING
table has only 8 rules, and the trace says that it hit rule 9 (maybe
it's the default policy?)

Here is my nat table:

[root@xenserver-2 ~]# iptables --list -n -t nat --line-numbers -v
Chain PREROUTING (policy ACCEPT 611K packets, 43M bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1     1761 90004 DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.224        to:192.168.0.224
2     1686 87453 DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.225        to:192.168.0.225
3     1589 79760 DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.226        to:192.168.0.226
4     1855 92353 DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.227        to:192.168.0.227
5     2929  148K DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.228        to:192.168.0.228
6    21333 1668K DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.229        to:192.168.0.229
7     1664 85048 DNAT       all  --  xenbr0 *       0.0.0.0/0
  78.x.x.230        to:192.168.0.230
8        0     0 DNAT       tcp  --  xenbr0 *       0.0.0.0/0
  0.0.0.0/0            tcp dpt:28080 to:192.168.0.10:8080

Chain INPUT (policy ACCEPT 566K packets, 40M bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain OUTPUT (policy ACCEPT 364K packets, 29M bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain POSTROUTING (policy ACCEPT 386K packets, 30M bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        0     0 SNAT       all  --  *      xenbr0  192.168.0.224
  0.0.0.0/0            to:78.x.x.224
2       28  2128 SNAT       all  --  *      xenbr0  192.168.0.225
  0.0.0.0/0            to:78.x.x.225
3        0     0 SNAT       all  --  *      xenbr0  192.168.0.226
  0.0.0.0/0            to:78.x.x.226
4        6   424 SNAT       all  --  *      xenbr0  192.168.0.227
  0.0.0.0/0            to:78.x.x.227
5      116  7552 SNAT       all  --  *      xenbr0  192.168.0.228
  0.0.0.0/0            to:78.x.x.228
6     1171 70329 SNAT       all  --  *      xenbr0  192.168.0.229
  0.0.0.0/0            to:78.x.x.229
7        0     0 SNAT       all  --  *      xenbr0  192.168.0.230
  0.0.0.0/0            to:78.x.x.230
8       32  2066 MASQUERADE  all  --  *      xenbr0  192.168.0.0/24
   0.0.0.0/0


Could you help me understand what's going on?

Thanks
Andre
