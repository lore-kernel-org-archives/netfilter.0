From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: error using variable for network device name in 'hook ingress
 device $external_interface'
Date: Mon, 17 Aug 2020 12:01:58 +0200
Message-ID: <20200817100158.GA5884@salvia>
References: <f05dedbd-3c4c-e31c-80ec-0383e7da1518@gc9.org>
 <20200817095839.GA5731@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200817095839.GA5731@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant C <grant@gc9.org>
Cc: netfilter@vger.kernel.org

On Mon, Aug 17, 2020 at 11:58:39AM +0200, Pablo Neira Ayuso wrote:
> On Sun, Aug 16, 2020 at 05:23:38PM -0700, Grant C wrote:
> > Hello,
> > 
> > Is there special syntax required to use a variable name instead of
> > hard-coding the interface name in a declaration like the following?
> > 
> > chain blackhole {
> >   type filter hook ingress device $external_interface priority -500; policy
> > accept
> > 
> > Error: syntax error, unexpected '$', expecting string or quoted string or
> > string with a trailing asterisk
> >                 type filter hook ingress device $external_interface priority -500; policy accept
> > 
> > using the interface name directly instead of the variable works.
> > 
> > Trying the new syntax that allows using a list, 'ingress devices = { }' also
> > fails when using a variable either inside an anonymous list, or as the name
> > of a named list.
> > 
> > 
> > I am using nftables 9.3 from Debian Buster backports.
> 
> Support for variable from chain device (as you use above) is available
> in the nftables release (or using the current git snapshot), this is a
> recent enhancement.

... in the _next_ nftables release
