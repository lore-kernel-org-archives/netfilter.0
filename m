From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: RE: What's going on with my iptables?
Date: Tue, 4 May 2010 23:41:03 +0200
Message-ID: <783a6c041a42ba2618d48a11c60df221.squirrel@webmail.vp44.net>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
    <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
    <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
    <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vp44.com; h=message-id
	:in-reply-to:references:date:subject:from:to:cc:reply-to
	:mime-version:content-type:content-transfer-encoding; s=sel1;
	 bh=tNqBvzwEPOLLyP2eZYMBCExf+PU=; b=A88qgox+sl9NZyuIBvV3U0+wlZ2M
	13cPfOFkd9DTyCllX0h5z1cjE/aILYMnr99qtgNRzr5DvRr7Pics7iIj2MAZIoKi
	S5lAEKRZGOEEV875emyXXBNgzsPutL1CaAQui8nh2j5/cG4a3ZiNYqAgyQOAgxO2
	Kni9R/2U6OrxDNs=
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A9F@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gary Smith <gary.smith@holdstead.com>
Cc: "'jknowlton@vp44.com'" <jknowlton@vp44.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Tue, May 4, 2010 5:03 pm, Gary Smith wrote:
>> Thanks Gary.
>> I went ahead with your suggestion but I still can't seem to figure out
>> where the problem is.
>> For example, this is me trying to ping google.com from the shell:
>>
>> [220040.098711] FW: IN= OUT=eth1 SRC=MYPUBIP DST=72.14.234.104 LEN=84
>> TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=871 SEQ=14
>>
>> [...]
>>
>> [220040.342816] FW: IN=eth0 OUT=
>> MAC=00:03:47:42:5c:17:00:04:ed:99:2c:fb:08:00 SRC=72.14.234.104
>> DST=MYPUBIP LEN=84 TOS=0x00 PREC=0x00 TTL=53 ID=48058 PROTO=ICMP TYPE=0
>> CODE=0 ID=871 SEQ=14
>>
>>
>> It all seems to be pretty kosher (except for the fact that the packets
>> are
>> being dropped)..
>
>
> You are dropping outgoing packets.  Stop doing that :).  Unless you are
> ultra paranoid about traffic originating from your firewall, there is no
> need to drop OUTPUT.  IMHO, the OUTPUT chain is useful for when you need
> to block specific outgoing traffic in a certain manner, say, port 25, to
> make sure that all mail flows through a specific server on your network
> for compliance, etc.  Or in the case of proxying, where you want to ensure
> that all traffic going to port 80 goes through the proxy and only the
> proxy can go out.
>
> In essence, you are saying, do let my requests go out...
>
> Then, for the input chain, make sure you have a rule to allow established
> and related connections to come in (and to be forwarded) and then return
> packets that originated from your network should be able to return just
> fine.
>
> -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
> -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>
> Give that a try.
>

Thanks!
That seemed to do the trick.
I guess my original rule:

-A INPUT -i $INTERNET -m state --state ESTABLISHED,RELATED -j ACCEPT

somehow stopped working.

Unfortunately I am having troubles with port forwarding & opening
now..none of them are accessible from the outside :(

-A INPUT -j ACCEPT -p tcp --destination-port 80 -i $INTERNET
-A INPUT -j ACCEPT -p tcp --destination-port 22 -i $INTERNET

-A FORWARD -i $INTERNET -p tcp --dport 9500 -j ACCEPT
-t nat -A PREROUTING -p tcp -i $INTERNET --dport 9500 -j DNAT
--to-destination 10.0.1.11
-A FORWARD -i $INTERNET -p tcp --dport 8112 -j ACCEPT
-t nat -A PREROUTING -p tcp -i $INTERNET --dport 8112 -j DNAT
--to-destination 10.0.1.11

What's wrong now??

-JK

