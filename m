From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Dynamic IP address in a rule?
Date: Sun, 26 Apr 2009 20:43:08 +0100 (WEST)
Message-ID: <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paddie O'Brien <paddieobrien@gmail.com>
Cc: netfilter@vger.kernel.org

> Hi,
>
> My IP is dynamically assigned and I want a rule like this one:
>
> iptables -I INPUT 1 -d my_ip_address  -m state --state NEW -j ULOG
>
> Can a rule work out the IP address of its host?

That's a nice question, instead of the dynamic IP on the rule, having a
dynamic host on it like:

Iptables -I INPUT -I eth0 -d myhost.dyndns.org -p tcp --dport 80 -j ACCEPT

When this run's, the rule will stay with the IP address that was grabbed
from the dynamic host, and when the IP changes, the rule won't work
anymore.
My question is, there's no way to make iptables to check always the host
instead of translation the host do IP on the rule apply stage?


