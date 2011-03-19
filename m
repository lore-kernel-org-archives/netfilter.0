From: "Rob \(lists\)" <lists@sterenborg.info>
Subject: RE: LOG_ACCEPT does not result in matching packet being accepted (ACCEPT works)
Date: Sat, 19 Mar 2011 08:34:45 +0100
Message-ID: <8A7E792DB93B42C5B2C33004FFDBF9C6@Dell>
References: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Hi,
> 
> I am running into a strange issue where packets matching LOG_ACCEPT
> rule (SSH packets) are not accepted. This results in failure to SSH to
> the box from outside. Trigger is still unknown - same rules work fine
> and LOG_ACCEPT works fine in the beginning.

Somehow I find that hard to believe, seeing below that the LOG_ACCEPT
chain doesn't contain any rules.

> If I change the LOG_ACCEPT to ACCEPT, strangely SSH starts working.

Not so strange to me. Using the ACCEPT target, you're actually ACCEPTing
the packet(s) whereas LOG_ACCEPT doesn't (do anything).

> I have not tried a "service firewall restart" etc. and I don't want
> the failed condition to go away before I collect required info.
> Pasting the rules below. If anyone has any clues, appreciate if you
> could let me know

> Chain INPUT (policy DROP)
> target     prot opt source               destination
[...]
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
> LOG_ACCEPT  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
> dpt:22
> LOG_ACCEPT  udp  --  0.0.0.0/0            0.0.0.0/0           udp
> dpt:22
[...]

SSH doesn't use port 22/udp. It only uses port 22/tcp. Don't accept
packets you don't want/need.

> Chain LOG_ACCEPT (2 references)
> target     prot opt source               destination

So, since there is no default chain named LOG_ACCEPT, someone (you?)
created a userdefined chain named LOG_ACCEPT. But since this chain is
empty, the chain does nothing. The same goes for chains LOG_DROP and
icmp_packets; they won't do anything either.

Maybe you should do something like below (sorry for wrapping, please
adapt to your needs).

Change:
$ipt -A INPUT -m state --state NEW -p tcp --dport 22 -j LOG_ACCEPT

Add:
$ipt -A LOG_ACCEPT -j LOG --log-level info --log-prefix "LOG_ACCEPT: "
$ipt -A LOG_ACCEPT -j ACCEPT


-- Rob


