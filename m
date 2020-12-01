From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Tue, 1 Dec 2020 19:49:42 +0100
Message-ID: <X8aQRtjwMXfstjRr@flatwhite>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Brian Aanderud <brian.aanderud@rockwellcollins.com>

Brian Aanderud on 23 Mar 2015 wrote:
> What must I do to get the multicast frames routed out a 'different'
> interface from the default one after applying a fwmark in iptables the
> routing table?  I am able to do this with unicast with a combination
> of 'ip rule', 'ip route' to a different table, and iptables to apply a
> 'mark'.  But, the marked multicast frames never seem to follow the
> other routing table's routes.
> [...]

Hi,

I've stumbled upon the same problem as the one discussed over 5 years
ago (with no answer) on this mailing list[1], ie. locally generated
multicast and broadcast traffic do not seem to follow policy routing
when it is constructed using `iptables --set-mark` and `ip rule fwmark`.

iptables counter is incremented so the rule matches. It looks as if
routing occurred before mangling when the mark had not yet been set but
re-routing did not occur after mangling as it seems to be done for
unicast traffic and according to the diagram[2].

Same set of routing rules and tables except for `fwmark` being replaced
with some other criteria, eg. `dport`, works.

Can anyone suggest if I am trying to do something that just should not
work, am I missing some small but vital detail or is it some kind of a
bug?

On Debian Buster I can use:

    ip rule add to 255.255.255.255 dport 5001 table foo

which works, but I would like to be able to use fwmark for that on
Debian Jessie for example which doesn't have the 2018 additions like
dport.

As for the reason I want to be able to send packets to 255.255.255.255
on two different interfaces (one tagged with a VLAN) depending on dport
-- some legacy software and hardware I cannot modify.

I have also experimented with success with veth and putting one of the
applications into a separate network namespace but it feels like an
overkill.

I am interested both in a solution and an explanation why the thing I am
trying to do does not work.


[1]: https://marc.info/?l=netfilter&m=142714167809246&w=2
[2]: https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

-- 
Marcin Szewczyk
http://wodny.org
