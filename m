From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 09:30:57 +0100 (WEST)
Message-ID: <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
    <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
    <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruno Moreira Guedes <thbmatrix@gmail.com>
Cc: netfilter@vger.kernel.org

> Just because of that I don't like dynamic IPs. But, are you using more
> than one IP on that interface?? So, if you use more than one, there
> are only one you don't know(probably), specify the rules for the ones
> you know first!!
> If you have only one IP address, try simply doing the rule for the
> incoming interface and be happy ;)
>
> Another way is to set your after-dhcp script to reload your firewall!!

That is no solution. it may be for your cenario but not for the most of
people. Just think, if who makes the connection is a modem, and you have
your *unix machine on nat, that won't work.
Second, imagine that you have Fixed IP, and want to allow for a situation
somebody that has a dynamic IP, and allow it with it's dynamic host, how
would you? You wouldn't, the best was is to write some sort of script to
check when the IP on the host changes, and remove/reinsert the rule with
the dynamic host.

For iptables to do a DNS query every time a packet comes, that's a disaster.
But other thing cames in mind, when doing: "iptables -L" it does a reverse
lookup on the IP's, is iptables doing a reverse lookup on every packet? or
only when listing the rules?

