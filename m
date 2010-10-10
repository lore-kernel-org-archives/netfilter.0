From: richard lucassen <mailinglists@lucassen.org>
Subject: Packets disappear in DNAT rule
Date: Sun, 10 Oct 2010 21:38:40 +0200
Message-ID: <20101010213840.863a1036.mailinglists@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I have this simple straight-on configuration:

          +------+ +-------+
internet--+router+-+ Linux +--internal network
          +------+ +-------+

The external network is a /29 subnet. The internal network a
RFC1918 /24 network. The external network is 1.2.3.0/29:
gateway: 1.2.3.1
Linux: 1.2.3.2 on eth0

The internal network is 192.168.64.0/24, the Linuxbox has
192.168.64.1 on eth1 and is the gateway for the internal network. On the
internal network there is a server 192.168.64.3 which I'd like to
expose to the internet using the ip 1.2.3.3 from the /29 range I have:

          +------+ +-------+                    +------------+
internet--+router+-+ Linux +--internal network--+192.168.64.3|
          +------+ +-------+                    +------------+
                                                      |
----->----->1.2.3.3--DNAT-->---192.168.64.3---->------/

I run on the Linux gateway:

I_MANG_PRE="iptables -t mangle -A PREROUTING"
I_PRE="iptables -t nat -A PREROUTING"

arp -s 1.2.3.3 00:1e:58:df:ae:04 pub
ip r a 1.2.3.3 via 192.168.64.3 dev eth1
${I_PRE} -i eth0 -d 1.2.3.3 -j DNAT --to 192.168.64.3

So far, so good. No problem, it works like a charm and it has always
worked like that.

Now I'm connecting a backup internet line on 11.22.33.0/29. I connect
the router to eth2 of the Linux box. Eth2 on the Linuxbox has address
11.22.33.2, the router has 11.22.33.1:

           +-------+ +-------+
internet1--+router1+-+ Linux +--internal network
           +-------+ +-------+
                        eth2 (11.22.33.2)
                         |
           +-------+     |
internet2--+router2+-----/
           +-------+ (11.22.33.1)

I'd like to expose the same host 192.168.64.3 to the internet, using
the ip address 11.22.33.3. First of all, I need policy routing. I add a
new table (12) and some rules:

ip rule add from 11.22.33.0/29 lookup 12
ip route add default via 11.22.33.1 dev eth2 table 12
ip rule add fwmark 1002 table 12

I add CONNMARK tracking:

${I_MANG_PRE} -i eth0 -d 1.2.3.0/29 -j CONNMARK --set-mark 1000
${I_MANG_PRE} -i eth2 -d 11.22.33.0/29 -j CONNMARK --set-mark 1002
${I_MANG_PRE} -i eth1 -j CONNMARK --restore-mark

arp -s 11.22.33.3 00:11:22:33:44:55 pub
ip r a 11.22.33.3 via 192.168.64.3 dev eth1
${I_PRE} -i eth2 -d 11.22.33.3 -j DNAT --to 192.168.64.3

Well, this has always worked very well under kernels older than 2.6.26
(and maybe some higher as well), but under 2.6.32 and higher it has
stopped working. The packets entering eth2 are dropped on the floor
after the DNAT rule but are not logged:

${I_PRE} -i eth2 -d 11.22.33.3 -j DNAT --to 192.168.64.3

ULOG before the DNAT logs the packet, a ULOG after the DNAT shows
nothing. The packets simply get lost.

Another interesting thing is that pinging the exposed server from a
station on eth2 with an ip address in the 11.22.33.0/29 of the second
internet (e.g. 11.22.33.4) line shows that everything is working as
expected.

I know it's quite complex to explain the above configuration, but it's
a config I have used very very often in the past and it simply has
stopped working somewhere between 2.6.26 and 2.6.32.

If I add an address to the eth2 NIC:

ip address add 11.22.33.5/29 dev eth2

I can ping the 11.22.33.5 from the internet. But as soon as I apply a
DNAT rule (even a simple PAT) the DNAT-ed packets just disappear without
any logging (there is nothing coming out of eth1, even not an arp
request)

I also wrote a bugreport (which is quite unclear IMHO, sorry for that),
as I think it's a bug somewhere in the iptables or kernel code:

http://bugzilla.netfilter.org/show_bug.cgi?id=680

Anyone an idea? 

Richard.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
