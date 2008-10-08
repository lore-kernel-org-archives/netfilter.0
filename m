From: Eric Leblond <eric@inl.fr>
Subject: Re: block packet by size
Date: Wed, 8 Oct 2008 18:58:52 +0200
Message-ID: <20081008165852.GA25766@khasse.inl.fr>
References: <98f5d92c0810080921t6232cebai52c6128cf655e731@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98f5d92c0810080921t6232cebai52c6128cf655e731@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Servers 4you <servers4you@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

On Wednesday, 2008 October  8 at 13:21:35 -0300, Servers 4you wrote:
> I need block every packet with 14bytes size.
> 
> what can i do?

man iptables :

   length
          This module matches the length of the layer-3 payload (e.g.
	  layer-4 packet) f a packet against a specific value or range
	  of values.

   [!] --length length[:length]

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
