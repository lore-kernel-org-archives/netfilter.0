From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: What's going on with my iptables?
Date: Tue, 4 May 2010 08:03:37 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
	<034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
 <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'jknowlton@vp44.com'" <jknowlton@vp44.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> Thanks Gary.
> I went ahead with your suggestion but I still can't seem to figure out
> where the problem is.
> For example, this is me trying to ping google.com from the shell:
> 
> [220040.098711] FW: IN= OUT=eth1 SRC=MYPUBIP DST=72.14.234.104 LEN=84
> TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=871 SEQ=14
> 
> [...]
> 
> [220040.342816] FW: IN=eth0 OUT=
> MAC=00:03:47:42:5c:17:00:04:ed:99:2c:fb:08:00 SRC=72.14.234.104
> DST=MYPUBIP LEN=84 TOS=0x00 PREC=0x00 TTL=53 ID=48058 PROTO=ICMP TYPE=0
> CODE=0 ID=871 SEQ=14
> 
> 
> It all seems to be pretty kosher (except for the fact that the packets are
> being dropped)..


You are dropping outgoing packets.  Stop doing that :).  Unless you are ultra paranoid about traffic originating from your firewall, there is no need to drop OUTPUT.  IMHO, the OUTPUT chain is useful for when you need to block specific outgoing traffic in a certain manner, say, port 25, to make sure that all mail flows through a specific server on your network for compliance, etc.  Or in the case of proxying, where you want to ensure that all traffic going to port 80 goes through the proxy and only the proxy can go out.

In essence, you are saying, do let my requests go out...

Then, for the input chain, make sure you have a rule to allow established and related connections to come in (and to be forwarded) and then return packets that originated from your network should be able to return just fine.

-A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

Give that a try.
