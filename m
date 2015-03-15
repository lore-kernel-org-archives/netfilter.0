From: Santiago Vila <sanvila@unex.es>
Subject: Re: iptables rules still working after being flushed (?)
Date: Sun, 15 Mar 2015 17:41:05 +0100
Message-ID: <20150315164105.GA13867@cantor.unex.es>
References: <alpine.DEB.2.11.1503151144110.8487@cantor.unex.es>
 <CADGd2Dr=g9KH91jeJt3a_HSsObrYOQszmaaxvUDHjO=k9-YjpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADGd2Dr=g9KH91jeJt3a_HSsObrYOQszmaaxvUDHjO=k9-YjpQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Lauro <johnalauro@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Mar 15, 2015 at 12:21:19PM -0400, John Lauro wrote:
> As far as I know, when there is version coupling, it's only impacted those
> rules out of sync or missing between versions, and it's been pretty good
> about complaining.
> 
> iptables -L -n will not show all the tables (just the filter tables, and so
> you probably didn't flush all the tables.  There is also tables for nat,
> security, raw, and mangle.)
> Try running
> iptables-save  (it just goes to stdout so it doesn't save it anywhere
> besides your terminal unless you tell it to)

Thanks a lot for trying, but no, that's not the problem.

I have never used any of those tables, so I would not need to flush
them, but in either case, and to be sure:

for t in nat security raw mangle; do iptables -t $t -L -n; done

Output:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination


and still I can't make more than 19 ssh connections in a row.

Where are the old tables stored and why do they work after I deleted them?

See what I said this is an X-File?
