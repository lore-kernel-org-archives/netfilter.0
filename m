From: Frank Smith <fsmith@hoovers.com>
Subject: Re: freeswan and netfilter.
Date: Sat, 12 Jul 2003 15:32:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <29210000.1058041959@k6.artair.com>
References: <99E5EB82CE45D511845F00508BE95B4C9F3AB5@CTPNT002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <99E5EB82CE45D511845F00508BE95B4C9F3AB5@CTPNT002>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: sathvanth subramaniam <sathvanth.subramaniam@ctp.ilabsgroup.com>, netfilter@lists.netfilter.org

Yes, they work together.  First, get freeswan working.  Then
when you add netfilter rules start with a default ACCEPT policy
and add a LOG entry at the end of each chain.  This will help
you understand the packet flow so you can learn whether you need
to apply a rule to an eth interface or to one of freeswan's
ipsec interface to accept/deny a particular packet.
   You'll probably want to change the default policy to DENY at
some point once you have enough rules in place to not lock
yourself out of the box.
   If you are also NATing your connections on the same box then
you also have to keep track of whether the rules need to apply
to the real or NATed addresses.  The log rule at the end of each
chain will help you see which one you need.
   
Good luck,
Frank

--On Friday, July 11, 2003 12:14:23 +0530 sathvanth subramaniam <sathvanth.subramaniam@ctp.ilabsgroup.com> wrote:

> hi all,
>  has anyone tried the freeswan + netfilter combination and made it work.i am
> working on it and want to know if its possible.
>  any help or directions is appreciated.
> 
> Regards,
> sathvanth





