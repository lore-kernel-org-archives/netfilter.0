From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables set - network/netmask
Date: Thu, 1 Feb 2018 12:19:40 +0100
Message-ID: <20180201111940.fu556ybv2ob2k3l5@salvia>
References: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr>
 <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
 <CAOkSjBiMZUKBGYNJMaq98KzxDLWPLa_hd6+6Af06JWuAfM8G=A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBiMZUKBGYNJMaq98KzxDLWPLa_hd6+6Af06JWuAfM8G=A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: hdemir <hdemir@metu.edu.tr>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Thu, Feb 01, 2018 at 11:03:35AM +0100, Arturo Borrero Gonzalez wrote:
> On 1 February 2018 at 08:50, hdemir <hdemir@metu.edu.tr> wrote:
> > Hi,
> >
> > I found this conversation;
> >
> > https://www.spinics.net/lists/netfilter/msg56947.html
> >
> > It would be useful to have NET function as ipset has.
> >
> >
> 
> Then, using that example:
> 
> > hash:net,net
> 
> % nft add rule tablename chainname ip saddr and 255.255.255.0 . ip
> daddr and 255.255.255.0 vmap { 10.10.10.0 . 10.10.20.0 : accept }
> 
> > hash:net,port,net
> 
> % nft add rule tablename chainname ip saddr and 255.255.255.0 . tcp
> dport . ip daddr and 255.255.255.0 vmap { 10.10.10.0 . 80 . 10.10.20.0
> : accept }
> 
> 
> > hash:net,iface
> >
> 
> % nft add rule tablename chainname ip saddr and 255.255.255.0 . iif
> vmap { 10.10.10.0 . eth0 : accept }
> 
> Will add this to the nftables wiki [0].

Thanks Arturo!

Sorry, I overlook your reply.
