From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nft] Regarding `tcp flags` (and a potential bug)
Date: Tue, 27 Jul 2021 23:11:16 +0200
Message-ID: <20210727211116.GA13897@salvia>
References: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
 <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Yan <tom.ty89@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Tue, Jul 27, 2021 at 10:52:39PM +0800, Tom Yan wrote:
> Just noticed something that is even worse:
> 
> # nft add rule meh tcp_flags 'tcp flags { fin, rst, ack }'
> # nft add rule meh tcp_flags 'tcp flags == { fin, rst, ack }'
> # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) != 0'
> # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) == 0'
> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags { fin, rst, ack }
>         tcp flags { fin, rst, ack }
>         tcp flags fin,rst,ack
>         tcp flags ! fin,rst,ack
>     }
> }

Could you develop the issue you're seeing here?
