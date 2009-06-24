From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 16:06:52 +0100 (WEST)
Message-ID: <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
    <200906241320.13779.christoph.paasch@gmail.com>
    <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
    <200906241347.41841.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200906241347.41841.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Paasch <christoph.paasch@gmail.com>
Cc: netfilter@vger.kernel.org, Rob Sterenborg <rob@sterenborg.info>

>> Can you guys help on this? Sorry but i really have no idea, with the
>> PREROUTING it was easy for me.
> You can add -i and -o to specify the incoming and outgoing interface to
> distinguish from the Internet and the LAN-side.

no luck:

I think it's always better to first allow, and drop in the end, no?

iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT
iptables -t filter -A FORWARD -m state --state NEW -p tcp --dport 22 -j
ACCEPT
or
iptables -t filter -A FORWARD -o eth1 -m state --state NEW -p tcp --dport
22 -j ACCEPT
iptables -t filter -A FORWARD -j DROP

no luck.

