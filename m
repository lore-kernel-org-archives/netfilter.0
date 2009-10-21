From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Ramdom NAT drop
Date: Wed, 21 Oct 2009 13:33:39 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509C1@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local>
 <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
 <4ADEBE76.20700@chello.at>
 <034DEBCAE934A74991E6E76B8DA72D14185DD509A2@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D14185DD509A2@HSSBS.holdstead.local>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> I would also expect to see this, but I don't think the packet is even
> making it to the filter section.  I have logging for anything dropped
> and yet nothing is coming in from originating IP's that are affected.
> I will probably do something painful and put more logging in the chains
> to see if I can better catch the problem.  The only issue I have is
> that the problem is random.
> 
> I will definitely look for that though.


Included is the rule that I think is being randomly ignored.  

-A PREROUTING -d 208.46.23.38 -j DNAT --to-destination 10.80.65.38

This is in effect.  So I believe that I should never see a hit in the INPUT chain for this rule since all requests are being forwarded to the 10.80.65.38 IP address.  Only 10.80.0.0/16 are local.  

I expcted to see this rule as the forward is indeed happening (basically we logged all traffic prior to this rule to generate the hit:

Oct 21 13:33:35 hsoakfiw01c kernel: FW-F-443: IN=eth1 OUT=eth0 SRC=116.250.48.135 DST=10.80.65.38 LEN=1050 TOS=0x00 PREC=0x00 TTL=102 ID=30940 DF PROTO=TCP SPT=2374 DPT=80 WINDOW=32768 RES=0x00 ACK PSH URGP=0

The INPUT catch had a rule to log all traffic coming in as well, which is where we picked up this hit:

Oct 21 13:31:01 hsoakfiw01c kernel: FW-I: IN=eth1 OUT= MAC=00:0c:29:9c:88:9b:00:13:c3:d7:a3:68:08:00 SRC=189.162.111.146 DST=208.46.23.38 LEN=40 TOS=0x00 PREC=0x00 TTL=241 ID=16396 DF PROTO=TCP SPT=3552 DPT=80 WINDOW=0 RES=0x00 ACK RST URGP=0 

So, am I wrong in thinking that external traffic forwarded in via NAT should never hit the INPUT chain and go straight to FORWARD chain, or is my problem something else completely?


