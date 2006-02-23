From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Thu, 23 Feb 2006 09:42:52 -0500
Message-ID: <43FDC9EC.1050704@certicom.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>	<43FCCF82.6010402@certicom.com>	<5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>	<43FCE338.4090306@certicom.com>
	<5f56302b0602221513i22ff868et991067e3314998da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602221513i22ff868et991067e3314998da@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Daniel Nogradi <nogradi@gmail.com>
Cc: netfilter@lists.netfilter.org


Daniel Nogradi wrote:
> Hi Chinh, on machine B DNS resolution doesn't work at all because the
> name servers are on the internet which it can not access. So I'm not
> pinging google.com but the IP addresses.
> 
> I've turned on logging and when I try to ssh, ping, etc, from B to A
> then I get these messages on both B and in the logs of A:
> 
> kernel: nat: IN=eth1 OUT= MAC=(mac address of eth1) SRC=(IP of machine
> B) DEST=213.191.74.18 LEN=54 TOS=0x00 PREC=0x00 TTL=64 ............
> kernel: out: IN=eth1 OUT=ppp0 SRC=(IP of machine B) DEST=213.191.74.18
>  ...........
> 
> What does this supposed to mean? :)
> 
It mean your packet traversed the prerouting nat eth1, and so on.

I would put 3 log messages, at "prerouting nat eth1", "forward", and
"postrouting nat". If your packet is seen at postrouting then it should be
successfully forwarded.

I noticed that your packet's outbound interface is ppp0. However, I recall your
MASQUERADE rule had "--out-interface eth0". Perhaps this is the cause and your
packet is not masqueraded? Try a simple "iptables -A POSTROUTING -t nat -j
MASQUERADE" without qualifiers.

Other things to try. Use ethereal to sniff eth1, and eth0/ppp0. Is there traffic?

Chinh

