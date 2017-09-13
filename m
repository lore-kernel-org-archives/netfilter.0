From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 12:10:05 +0200
Message-ID: <20170913101005.GA2661@salvia>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
 <E2AE9F76-4DD3-4DB2-8AB9-BA179BB1A046@creamfinance.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E2AE9F76-4DD3-4DB2-8AB9-BA179BB1A046@creamfinance.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Rosenstein <thomas.rosenstein@creamfinance.com>
Cc: Arturo Borrero Gonzalez <arturo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Wed, Sep 13, 2017 at 11:36:56AM +0200, Thomas Rosenstein wrote:
> Hi,
> 
> I have to check it out, but in the mean time I already wrote my small
> iptables plugin to rewrite the dst-addr.
> 
> let's call it pre-alpha:
> 
> https://github.com/creamfinance/dstwrite

Did you try packet field mangling?

https://wiki.nftables.org/wiki-nftables/index.php/Mangle_packet_header_fields

You need a Linux kernel >= 4.10.

Syntax is simple, eg.

        ip daddr set 1.2.3.4


