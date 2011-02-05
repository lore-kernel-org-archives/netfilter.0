From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Sat, 5 Feb 2011 20:29:02 +0100
Message-ID: <20110205202902.0a006e48@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	<20110203120131.38cd818d@catus>
	<1296827153.3644.7.camel@debian-laptop.OptimumWireless>
	<1296838192.3644.20.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296838192.3644.20.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

Hi,

>$tc qdisc add dev eth0 root handle 1: htb r2q 1

You can add "default XX" to define direct class as 1:XX. Any traffic
that doesn't get classified by specific filters will end up in class
1:XX. If you wonder why XX is prefixed by "1:", it's because of the
qdisc handle.

># this is the parent class
>$tc class add dev eth0 parent 1:0  classid 1:1 htb rate 3000kbit ceil
>3000kbit

The class you created here has classid of 1:1 and is attached to qdisc
itself.

>$tc class   add dev eth0 parent 1:100    classid 1:1 htb rate 256kbit
>ceil 256kbit prio 3

1) parent should be 1:1, that's classid of the class you created
earlier,
2) classid should be 1:100

that's probably what you wanted:
$tc class   add dev eth0 parent 1:1 classid 1:100 htb rate 256kbit
ceil 256kbit prio 3

>## Now I should create a filter for the ip address:
>$tc filter add dev eth0 parent 1:100 protocol ip u32 match ip dst
>172.16.100.1/32 classid 1:1

1) parent should be set to 1:1, that's the class you attach filter to
2) classid should be 1:100, that's the class, traffic should be
directed to

>## Now for the qdisc
>$tc qdisc add dev eth0 parent 1:100 handle 500: sfq perturb 2

that's ok

Best regards,
Marek Kierdelewicz
