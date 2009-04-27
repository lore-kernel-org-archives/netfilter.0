From: <lists@sterenborg.info>
Subject: RE: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 08:56:58 +0200
Message-ID: <000a01c9c705$5c4c2db0$14e48910$@info>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com> 	<3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt> 	<000001c9c703$2d3cabf0$87b603d0$@info> <d39744a20904262346p41c1b5fcy2f754a9263d09df3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20904262346p41c1b5fcy2f754a9263d09df3@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter' <netfilter@vger.kernel.org>

> > If iptables would have to perform a DNS lookup everytime a packet
> > passes, I think it would be terribly slow and probably not usable
> > for packetfiltering.
> 
> Actually the DNS lookup is performed only once - in the time the
> ruleis inserted/appended. If the DNS returns more than one IP per
> name, a number of rules is inserted with each IP returned.

Yes, that's more or less what Jorge described. My point was that if the
Netfilter framework had to perform a DNS lookup for each (new?) packet
that it has to check, I think it would be quite slow (think about DNS
query timeouts, etc) and not so usable as it is now.


Grts,
Rob


