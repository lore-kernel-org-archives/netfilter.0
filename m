From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: TCP and UDP dport in the same rule
Date: Mon, 23 Mar 2020 12:46:06 +0100
Message-ID: <20200323114606.y4mudsebactsddkn@salvia>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
 <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
 <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, Mar 22, 2020 at 05:36:47PM +0100, Reindl Harald wrote:
>
>
> Am 22.03.20 um 15:43 schrieb Frank Myhr:
> > nftables has its own concept of sets:
> > https://wiki.nftables.org/wiki-nftables/index.php/Sets
> >
> > I don't know of a way to use ipset with nftables
>
> well, that's a showstopper for even consider switch to nftables given
> the amount of code maintainig ipsets from shell scripts *because* they
> live outside of the ruleset

Probably you can keep your set configuration in a separated file, e.g.

 # cat mysets.nft
 set blacklist {
        type ipv4_addr
        elements = {
               192.168.100.20,
               192.168.134.78,
               192.168.156.77,
        }
 }

Then, include this file from the ruleset.

 # cat ruleset.nft
 table ip foo {
       include "./mysets.nft"

       chain bar {
               type filter hook prerouting priority 0;

               ip saddr @blacklist counter drop
       }
 }

So your set configure lives outside of your ruleset.

> it makes many things so much easier up to write backends in whatever
> language to maintain ipsets without any knowledge of the ruleset using
> them finally
>
> i even deploy ipsets to different machines no matter where they are
> phyisically located and hwat the role of the machine is (firewall,
> endpoint...)

Then, you can distribute your mysets.nft file to your different
machines, as described in the example above.

Thanks.
