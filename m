From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: match many protocol in a rule
Date: Thu, 17 Jun 2010 21:00:18 -0500
Message-ID: <4C1AD332.90603@riverviewtech.net>
References: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com> <AANLkTilErsiq8IUBxUUUq-EhS6KUQUEs6KNHKVD4UPCH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilErsiq8IUBxUUUq-EhS6KUQUEs6KNHKVD4UPCH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Curby wrote:
> I was looking for a similar feature (as it exists in ipfw) but I don't
> think that's possible in iptables.  If you want to specify multiple
> protocols for the purpose of ending with a consistent action or set of
> actions, you could make the multiple rules jump to a custom chain
> which then performs the actions.  However if you want to specify
> multiple protocols to reduce the number of rules, I don't think that
> will work.

I also thought about matching the protocols and jumping to a sub-chain. 
  However that won't work the way you want it to b/c (last I checked) 
you have to specify a protocol to be able to specify a port.  So, you 
might as well match both the protocol and the port on the same rule.



Grant. . . .
