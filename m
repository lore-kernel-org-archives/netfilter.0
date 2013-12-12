From: Phil Oester <kernel@linuxace.com>
Subject: Re: SNAT range does not use unique IP
Date: Thu, 12 Dec 2013 14:34:44 -0800
Message-ID: <20131212223443.GA2211@home>
References: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor S <nat4592@scarlet.be>
Cc: netfilter@vger.kernel.org

On Thu, Dec 12, 2013 at 10:55:53PM +0100, Igor S wrote:
> Dear netfilter guru's
> 
> I am trying to build a kind of a dynamic 1:1 SNAT gateway that is
> supposed to build every incoming IP to a unique internal IP in the
> internal network without any port mangling.

Then you should be using the NETMAP target.

   NETMAP (IPv4-specific)
       This target allows you to statically map a whole network of addresses onto another network of addresses.   It  can
       only be used from rules in the nat table.

       --to address[/mask]
              Network  address to map to.  The resulting address will be constructed in the following way: All 'one' bits
              in the mask are filled in from the new `address'.  All bits that are zero in the mask are  filled  in  from
              the original address.


Phil
