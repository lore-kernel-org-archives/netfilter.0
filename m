From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: dst NETMAP
Date: Tue, 23 May 2023 10:54:25 +0200
Message-ID: <ZGx/QaErKi+JsoC1@calendula>
References: <CAGWgwrPXvZ-eVbsYp-zi0thV4=vz=nfj0jQ-_oEZo3e8TdOzeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGWgwrPXvZ-eVbsYp-zi0thV4=vz=nfj0jQ-_oEZo3e8TdOzeA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Hutton <justlikeef@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Mon, May 22, 2023 at 02:11:36PM -0400, Rob Hutton wrote:
> I am trying to set up a NAT gateway between two businesses where one
> initiates the connection outbound to the other, so therefore have dst
> nat entries in the following form:
> 
> ip daddr 10.192.3.0/24 dnat ip to ip daddr map { 10.192.3.0/24 : 10.12.3.0/24 }
  ~~~~~~~~~~~~~~~~~~~~~~

No need for this redundant match, you can remove it. The map look
already provides the key matching side, therefore...

> and masquerade is enabled on the external interface.
> 
> The netmap is translating the network portion correctly, but the host
> portion is not being preserved and is simply being chosen as if from a
> NAT pool.  So pinging 10.192.3.254 should be translated to 10.12.3.254
> and instead it is translated to 10.12.3.64 (for example).  How do I
> preserve the host portion during the NETMAP translation?

... this should be sufficient to achieve NETMAP in nftables:

        dnat ip prefix to ip daddr map { 10.192.3.0/24 : 10.12.3.0/24 }
                ~~~~~~

note the 'prefix' keyword specifies that the address prefix needs to
be preserved, hence, achieving similar effect to iptables' NETMAP.
