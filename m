From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: manual : CONNTRACK EXPRESSIONS
Date: Fri, 23 Jul 2021 17:00:43 +0200
Message-ID: <20210723150043.GA16034@salvia>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <328573485.4.1626983857363.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <328573485.4.1626983857363.JavaMail.zimbra@contatogs.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pauloric@contatogs.com.br
Cc: netfilter@vger.kernel.org

Hi,

On Thu, Jul 22, 2021 at 04:57:37PM -0300, pauloric@contatogs.com.br wrote:
> Hi
> 
> Near  CONNTRACK EXPRESSIONS at manual I think that should be good to insert something like:
> 
> ct {state | direction | status | mark | expiration | helper | label}
> ....
> ct count [over]    <------->
> 
> and just a little bellow it has already an example of it.
> ...
> filter input tcp dport 22 meter test { ip saddr ct count over 2 } reject
> 
> Maybe a include at Table 55. Conntrack expressions  too ??? <----

Since 0.9.7, manpage contains a reference to 'ct count'.

There is also an example usage:

       restrict the number of parallel connections to a server.

           nft add set filter ssh_flood '{ type ipv4_addr; flags dynamic; }'
           nft add rule filter input tcp dport 22 add @ssh_flood '{ ip saddr ct count over 2 }' reject

> Could it be inserted at https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes#Ct    ???

Updated.

Thanks
