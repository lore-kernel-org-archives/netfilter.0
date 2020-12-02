From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 13:36:50 +0100
Message-ID: <X8eKYjtPSINtYYnl@flatwhite>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
 <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite>
 <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Fatih USTA' <fatihusta86@gmail.com>, 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

On Wed, Dec 02, 2020 at 02:10:00PM +0200, Eliezer Croitor wrote:
> On Tue, Dec 01, 2020 at 07:49:43PM +0100, Marcin Szewczyk wrote:
> > Brian Aanderud on 23 Mar 2015 wrote:
> > > What must I do to get the multicast frames routed out a 'different'
> > > interface from the default one after applying a fwmark in iptables the
> > > routing table?  I am able to do this with unicast with a combination
> > > of 'ip rule', 'ip route' to a different table, and iptables to apply a
> > > 'mark'.  But, the marked multicast frames never seem to follow the
> > > other routing table's routes.
> > > [...]
> > 
> > I've stumbled upon the same problem as the one discussed over 5 years
> > ago (with no answer) on this mailing list[1], ie. locally generated
> > multicast and broadcast traffic do not seem to follow policy routing
> > when it is constructed using `iptables --set-mark` and `ip rule fwmark`.

> Just wondering, how can I reproduce this issue on my local network?

The configuration is actually in the message you quoted[1]. You do not
need a network adhering to any specific configuration to reproduce it.
It's a local phenomenon.

> First a broadcast address cannot be "routed" elsewhere then a
> connected network, there is no real "routing" so to speak.

Here routing is limited to the local machine. `ip rule dport` actually
produces positive results so there is a way to force broadcast traffic
to adhere to local routing rules even though the traffic is not going to
be routed on the next layer 3 hop.

In general -- broadcast and multicast traffic adheres to rules in any
table not guarded by the fwmark criterion.

> I do not know how the kernel looks at it but I assume it can only be sent
> towards a connected device such as:
> * ethernet
> * tunnel(these which support broadcast)

I am using my wifi interface but one can reproduce the experiments I
mentioned with a veth device as well:

    ip link add ve1 type veth peer ve2

> Also I am missing some of the thread emails so, What kernel are we talking
> about?
> Let say Debian/Ubuntu/RHEL/CentOS , what version? Etc..

I mentioned Debian Jessie (kernel 4.9) and Debian Buster (kernel 4.19).

> Reproducing is important to understand what the issue is.

As I mentioned -- configuration is in the quoted email[1] and in the
original email[2] (not mine) from 2015.

[1]: https://marc.info/?l=netfilter&m=160690828202259
[2]: https://marc.info/?l=netfilter&m=142714167809246

-- 
Marcin Szewczyk
http://wodny.org
