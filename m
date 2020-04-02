From: Phil Sutter <phil@nwl.cc>
Subject: Re: [ANNOUNCE] nftables 0.9.4 release
Date: Thu, 2 Apr 2020 14:47:44 +0200
Message-ID: <20200402124744.GY7493@orbyte.nwl.cc>
References: <20200401143114.yfdfej6bldpk5inx@salvia>
 <8174B383-989D-4F9D-BDCA-3A82DE5090D2@gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8174B383-989D-4F9D-BDCA-3A82DE5090D2@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sbezverk <sbezverk@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>, netdev@vger.kernel.org, lwn@lwn.net

Hi Serguei,

On Thu, Apr 02, 2020 at 08:38:10AM -0400, sbezverk wrote:
> Did this commit make into 0.9.4?
> 
> https://patchwork.ozlabs.org/patch/1202696/

Sadly not, as it is incomplete (anonymous LHS maps don't work due to
lack of type info). IIRC, Florian wanted to address this but I don't
know how far he got with it.

Cheers, Phil
