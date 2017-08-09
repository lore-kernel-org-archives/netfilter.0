From: Eric Leblond <eric@regit.org>
Subject: Re: nft and sip with debian 9 stretch
Date: Wed, 09 Aug 2017 13:06:54 +0200
Message-ID: <1502276814.18029.1.camel@regit.org>
References: <b4d31d0b-9f15-9b2a-0804-6ad6fd827cb9@herzog-systems.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b4d31d0b-9f15-9b2a-0804-6ad6fd827cb9@herzog-systems.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marc Neudorfer <marc.neudorfer@herzog-systems.de>, netfilter@vger.kernel.org

Hello,

On Wed, 2017-08-09 at 12:36 +0200, Marc Neudorfer wrote:
> Hello,
> 
> i am currently using Debian 9 (nft 0.7, kernel 4.9).
> I tried to use nft as primary firewall for my network, but there are
> a 
> lot of problems with our sip/voip phones (phones are ringing, no
> voice 
> -> ct-problem)
> The wiki says, the ct-helpers are only available with nft 0.8 and
> kernel 
> 4.12.
> Is there any known method to get sip-phones to work with nft 0.7? Or 
> some kind of workaround?

Indeed, connection tracking helpers assignation can only be used with
nft 0.8 and Linux 4.12.

You can set automatic assignement with:
echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper 

BR
-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/
