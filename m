From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: RE: What's going on with my iptables?
Date: Tue, 4 May 2010 13:31:05 +0200
Message-ID: <7f16bcb44ddb55dd3cc4b9d2a7d828c9.squirrel@webmail.vp44.net>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
    <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vp44.com; h=message-id
	:in-reply-to:references:date:subject:from:to:cc:reply-to
	:mime-version:content-type:content-transfer-encoding; s=sel1;
	 bh=lkJXRDZAKQjdrPNCcreqcwAVm9g=; b=Rt9Q4AgeRbHDK9AgGGQR77ukfQSn
	VkUXoALJZhqiuan4L2EXTCz788y5LoS4ESqXpZfKUZS48vvTfOr7ZEoKu5JYJVsT
	/XmYrNTciB+fjy/kC7pBTTr57rKgvGEDQiUbxVUmo4C73HW2h95ZaA2VSPrCPizq
	O6YSUuNJYvN7YKM=
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gary Smith <gary.smith@holdstead.com>
Cc: "'jknowlton@vp44.com'" <jknowlton@vp44.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Sun, May 2, 2010 7:05 am, Gary Smith wrote:
>> Now I can get it to work only by commenting out the last line (iptables
>> -A INPUT -j DROP). But that defies the purpose of a firewall, doesn't
>> it?
>> What the heck happened last afternoon??
>>
>
> Logging helps...
>
> prior to the drop, do a log
>
> iptables -A INPUT -j LOG --log-prefix "FW: "
> iptables -A FORWARD -j LOG --log-prefix "FW: "
> iptables -A OUTPUT -j LOG --log-prefix "FW: "
>
> Then tail the log file and see what is hitting the drop rule.  From there,
> poke any additional holes necessary.
>
>

Thanks Gary.
I went ahead with your suggestion but I still can't seem to figure out
where the problem is.
For example, this is me trying to ping google.com from the shell:

[220040.098711] FW: IN= OUT=eth1 SRC=MYPUBIP DST=72.14.234.104 LEN=84
TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=871 SEQ=14

[...]

[220040.342816] FW: IN=eth0 OUT=
MAC=00:03:47:42:5c:17:00:04:ed:99:2c:fb:08:00 SRC=72.14.234.104
DST=MYPUBIP LEN=84 TOS=0x00 PREC=0x00 TTL=53 ID=48058 PROTO=ICMP TYPE=0
CODE=0 ID=871 SEQ=14


It all seems to be pretty kosher (except for the fact that the packets are
being dropped)..

-JK

