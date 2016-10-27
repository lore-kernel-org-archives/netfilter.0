From: Leon Merten Lohse <leon@green-side.de>
Subject: Re: nftables: named set for ipv4 networks
Date: Thu, 27 Oct 2016 23:41:52 +0200
Message-ID: <20161027234152.2c94a832@doomgiver>
References: <20161023213822.16337e5c@doomgiver>
        <20161027192338.GA1570@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161027192338.GA1570@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

(repost to list. sorry for the duplicate)

Thank you, Pablo!
Unfortunately this results in a segfault for me. I was able to boil the
ruleset down to a minimal example that segfaults. 

# nft -f segfault.ruleset 
Segmentation fault

Even if I made a severe error, it should not segfault, right? ..

Versions of nftables and kernel are as in my previous emails.

Best 
Leon

---

# segfault.ruleset

flush ruleset

table inet filter {
  # blocked networks
  set blacklist_v4 { type ipv4_addr; flags interval; }
}

# this would be included from a generated file
add element inet filter blacklist_v4 {
192.168.0.1/24,
}



On Thu, 27 Oct 2016 21:23:38 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Sun, Oct 23, 2016 at 09:38:22PM +0200, Leon Merten Lohse wrote:  
> > Hi,
> > 
> > is there a way to migrate a hash:net type ipset to nftables?
> > We use this to implement a blacklist where we block a large number
> > of networks.
> > 
> > I tried using a type ipv4_addr named set as follows:
> > 
> > flush ruleset
> > table inet filter {
> >   set blacklist_v4 { type ipv4_addr; }
> > }
> > add element inet filter blacklist_v4 { 10.0.0.0/8 }
> > 
> > However, this results in:
> > Error: Set member cannot be prefix, missing interval flag on
> > declaration add element inet filter blacklist_v4 { 10.0.0.0/8 }
> >                                        ^^^^^^^^^^
> > Is ipv4_addr the wrong type in this case? I could not find any
> > documentation on it.
> > Using networks in anonymous sets seems to work flawlessly.    
> 
> Missing "flags interval;" here, so this should be:
> 
>         table inet filter {
>            set blacklist_v4 { type ipv4_addr; flags interval; }
>         }
> 
> With named sets, you have to specify this flag since the kernel uses
> to select what is the best data structure uses to represent what you
> need.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html  

