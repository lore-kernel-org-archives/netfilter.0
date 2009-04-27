From: <lists@sterenborg.info>
Subject: RE: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 08:41:20 +0200
Message-ID: <000001c9c703$2d3cabf0$87b603d0$@info>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com> <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

> That's a nice question, instead of the dynamic IP on the rule,
> having a dynamic host on it like:
> 
> Iptables -I INPUT -I eth0 -d myhost.dyndns.org -p tcp --dport 80 -j
> ACCEPT
> 
> When this run's, the rule will stay with the IP address that was
> grabbed from the dynamic host, and when the IP changes, the rule
> won't work anymore.
> My question is, there's no way to make iptables to check always the
> host instead of translation the host do IP on the rule apply stage?

If iptables would have to perform a DNS lookup everytime a packet
passes, I think it would be terribly slow and probably not usable for
packetfiltering.


Grts,
Rob


