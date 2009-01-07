From: Roman Fiedler <roman.fiedler@telbiomed.at>
Subject: Re: Mystics of packet forwarding
Date: Wed, 07 Jan 2009 12:26:44 +0100
Message-ID: <49649174.6070606@telbiomed.at>
References: <4963B3EB.6090806@arturaz.net> <496475AB.9040303@arturaz.net> <d39744a20901070251qc6c87e9l8f33deaf4febfa83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20901070251qc6c87e9l8f33deaf4febfa83@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ivan Petrushev wrote:
>> Ok, it seems that really - someone in LAN is attacking the internet.
> It could be worms or viruses. In my experience every home or student
> Windows network is awfully crowded with viruses. Maybe you should work
> on filtering your outgoing traffic.
>
> I'm not sure, but search on google what could cause ban on DIGG or
> YAHOO. Probably lots of connections or flood could result in banning
> you from these sites. But you say that immediately when you remove the
> NAT rules the access is restored? I don't believe their firewalls are
> quick enough to restore your position two seconds after you stop being
> "bad" to them. Maybe something else is the reason.

Are there any hardcoded external IPs in your ruleset? These might fail 
if other hosts have some DNS-round-robin.


