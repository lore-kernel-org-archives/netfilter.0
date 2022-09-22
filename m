From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Change in nft set element add syntax?
Date: Thu, 22 Sep 2022 07:40:20 +0200
Message-ID: <Yyv1RIjX0pGSbAMP@salvia>
References: <20220922021238.donues3tuiufzbsn@sarek.home.aplund.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220922021238.donues3tuiufzbsn@sarek.home.aplund.id.au>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Austin Lund <austin.lund@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

No syntax updates have been done, see below.

On Thu, Sep 22, 2022 at 12:12:38PM +1000, Austin Lund wrote:
> Hi,
> 
> I upgraded from nft 1.0.1 to 1.0.5 and found some of the rules I have
> gave some errors.  I narrowed it down to adding to sets.  It's all
> pretty simple; the error is
> 
> > # /usr/bin/nft -c -f /etc/nftables.conf
> > /etc/nftables.conf:44:3-37: Error: Could not process rule: Operation not supported
> > 	ip saddr @badconns goto update_drop
> > 	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > /etc/nftables.conf:64:3-28: Error: Could not process rule: Invalid argument
> > 	add @badconns { ip saddr }
> > 	^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> I have my nftables.conf stuff like this:
> 
> > table inet filter {
> >         set badconns { typeof ip saddr; timeout 1h; }
> >         set badconns6 { typeof ip6 saddr; timeout 1h; }
> > ...
> >         chain input {
> > ...
> >                 ip saddr @badconns goto update_drop
> >                 ip6 saddr @badconns6 goto update_drop
> > ...
> >         }
> >
> >         chain update_drop {
> >                 update @badconns { ip saddr }
> >                 update @badconns6 { ip6 saddr }
> >                 drop
> >         }
> > ...
> 
> This logic is probably somewhat broken, but it does work in the older
> version.  Should this give an error in the new version? 

This loads fine here.

# cat test.nft
table inet filter {
         set badconns { typeof ip saddr; timeout 1h; }
         set badconns6 { typeof ip6 saddr; timeout 1h; }

         chain input {
                 ip saddr @badconns goto update_drop
                 ip6 saddr @badconns6 goto update_drop
         }

         chain update_drop {
                 update @badconns { ip saddr }
                 update @badconns6 { ip6 saddr }
                 drop
         }
}
# nft -f test.nft
# echo $?
# nft list ruleset
table inet filter {
        set badconns {
                typeof ip saddr
                size 65535
                flags dynamic,timeout
                timeout 1h
        }

        set badconns6 {
                typeof ip6 saddr
                size 65535
                flags dynamic,timeout
                timeout 1h
        }

        chain input {
                ip saddr @badconns goto update_drop
                ip6 saddr @badconns6 goto update_drop
        }

        chain update_drop {
                update @badconns { ip saddr }
                update @badconns6 { ip6 saddr }
                drop
        }
}

# nft -v
nftables v1.0.5 (Lester Gooch #4)
