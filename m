From: Julien Vehent <julien@linuxwall.info>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 14:20:18 +0200
Message-ID: <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost>
References: <4A65AF17.70002@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65AF17.70002@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

On Tue, 21 Jul 2009 14:05:43 +0200, Fabio Marcone <fabio.marcone@duet.it>
wrote:
> Hi!
> I have a router linux and I need to filter packets in postrouting chain 
> using source mac address. But... in postrouting chain, what is source 
> mac address? mac address of effective source of the packet or router 
> interface mac address ?
> 
> Thanks in advance,
> Fabio

Hi Fabio,

I don't think you can filter packets in postrouting.
The only tables available in POSTROUTING are mangle and nat.

To filter packets in a router, I think you have to do it in the FORWARD
chain.

see: http://jengelh.medozas.de/images/nf-packet-flow.png

Julien

-- 
julien
http://jve.linuxwall.info/blog

