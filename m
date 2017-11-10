From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Counters for individual elements in maps and sets?
Date: Fri, 10 Nov 2017 08:07:50 +0100
Message-ID: <20171110070750.GA6027@salvia>
References: <869ba4d3be90adbb2519654c489285d0@spoje.net>
 <CAOkSjBhjbdmBw3QgHDcRjuO6KfVfWEhT5Owrdkx3=bkhCH1FKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBhjbdmBw3QgHDcRjuO6KfVfWEhT5Owrdkx3=bkhCH1FKQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Tomas Mudrunka <mudrunka@spoje.net>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Tue, Nov 07, 2017 at 07:44:13PM +0100, Arturo Borrero Gonzalez wrote:
> On 7 November 2017 at 14:09, Tomas Mudrunka <mudrunka@spoje.net> wrote:
> > Hello,
> > i've figured it's possible to simplify my rules by using maps and sets
> > instead of using individual rules, but i need to account traffic for each
> > address in the map separately. Maybe this can be implemented using flags in
> > map/set, so i will be able to enable it like this:
> >
> >         map prometheus {
> >                 type ipv4_addr : classid;
> >                 flags interval, counter;
> >                 elements = {
> >                         1.1.1.2 : 2:2222 counter packets 10 bytes 5120,
> >                         1.1.1.3 : 3:3333 counter packets 3 bytes 489
> >                 }
> >         }
> >
> > just to make it clear, the same map without counters looks like this right
> > now:
> >
> >         map prometheus {
> >                 type ipv4_addr : classid
> >                 flags interval
> >                 elements = {
> >                         1.1.1.2 : 2:2222,
> >                         1.1.1.3 : 3:3333
> >                 }
> >         }
> >
> >
> > Will it be ever possible to have per element counters for maps and sets?
> >
> 
> you are probably looking for something like this:
> https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables

This looks like a different usecase we don't support yet, that doesn't
fit into flow tables.

There's a ticket in bugzilla asking for something like this, we plan
to add support for this indeed.
