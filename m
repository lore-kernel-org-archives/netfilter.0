From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Traffic going out wrong interface
Date: Tue, 26 Aug 2003 22:56:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826145630.GB1956@propaganda.localdomain>
References: <3F4B3DCC.8010104@chrisbrenton.org>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F4B3DCC.8010104@chrisbrenton.org>
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
To: netfilter@lists.netfilter.org

On Tue, Aug 26, 2003 at 07:00:28AM -0400, Chris Brenton spoke thusly:

(snip)

>23:47:08.698954 arp who-has 192.168.1.6 tell 64.179.20.65
>0x0000   0001 0800 0604 0001 0050 8beb 5976 40b3        .........P..Yv@.
>0x0010   1441 0000 0000 0000 c0a8 0106 0000 0000        .A..............
>0x0020   0000 0000 0000 0000 0000 0000 0000             ..............
>
>So the firewall is ARPing for the private address and asking it to 
>respond to the DNAT address mapped above. Hummm...

Hi Chris,

I think this behaviour is a documented kernel issue. I've read (but since
forgotten) reasons as to why it works this way and am too lazy to search
again.

http://lists.insecure.org/lists/linux-kernel/2001/Sep/3252.html

ARP requests go out on all interfaces, and can be received on all
interfaces also. The patch linked above (when I tried last) does not apply
cleanly to any of the recent kernel sources. This becomes a problem when
you've got all the ethernet links plugged into the same switch/hub
(depending on your rulesets) and ARP races.

That is if I'm understanding your question properly.

(snip more rulesets)

>01:46:44.909145 64.179.20.65.1881 > 205.158.107.16.80: R [tcp sum ok] 
>1192820737:1192820737(0) win 0 (DF) (ttl 255, id 0, len 40)
>0x0000   4500 0028 0000 4000 ff06 ee2c 40b3 1441        E..(..@....,@..A
>0x0010   cd9e 6b10 0759 0050 4719 0001 0000 0000        ..k..Y.PG.......
>0x0020   5004 0000 d37a 0000 0000 0000 0000             P....z........
>
>02:05:54.646567 64.179.20.66.1525 > 205.158.107.16.80: R [tcp sum ok] 
>149880833:149880833(0) win 0 (DF) (ttl 255, id 0, len 40)
>0x0000   4500 0028 0000 4000 ff06 ee2b 40b3 1442        E..(..@....+@..B
>0x0010   cd9e 6b10 05f5 0050 08ef 0001 0000 0000        ..k....P........
>0x0020   5004 0000 1308 0000 0000 0000 0000             P.............
>
>So the RST is getting transmitted out the wrong interface. Please note 
>that 99.9% of the time this all works fine. It only happens every now 
>and then (maybe once out of every 300-500 SYN/ACK packets seen).

Are you running 'tcpdump' on the firewall/routing device itself ? I think a
number of us have noticed rather odd things in regards to snat/dnat
addresses when running tcpdump on the firewall itself.

>I never see any other external packets going out the internal interface. 
>Its only ARP requests and RST packets. BTW, this is one of the few rules 

HTH.

