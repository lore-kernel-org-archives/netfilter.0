From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: p0f patch
Date: Fri, 19 Jan 2007 21:23:15 -0500
Message-ID: <20070120022315.GB18433@minastirith>
References: <LJELKDOLLLOLLEFCCMCFMELPEIAA.tim@heagarty.com>
	<LJELKDOLLLOLLEFCCMCFEEMPEIAA.tim@heagarty.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <LJELKDOLLLOLLEFCCMCFEEMPEIAA.tim@heagarty.com>
Content-disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Here is a link, but I have not tried the patch:

http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/patchlets/osf/linux-2.6/net/ipv4/netfilter/?rev=4018

If you are looking for something that is Netfilter-specific, psad
implements the p0f algorithm over Netfilter log messages (requires the
--log-tcp-options argument to iptables when creating the LOG rule):

http://www.cipherdyne.org/psad/

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F



On Jan 19, 2007, Tim Heagarty wrote:

> So does anybody know of a Netfilter/Iptables patch that supports the p0f log
> scanning utility? The link from the p0f site to netfilter.org is broken. I'm
> suspecting that the patch was never fully released or supported.
> 
> 
> 
> Thank you,
> 
> Tim Heagarty, CISSP, CISA, MCSE
> http://www.TheaSecure.com/
> (928) 533-9690
> "There are 10 kinds of people in the world; those that understand binary,
> and those that don't."
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Tim Heagarty
> Sent: Wednesday, January 17, 2007 11:44 PM
> To: netfilter@lists.netfilter.org
> Subject: p0f patch
> 
> 
> Is anybody aware of a POM for p0f? They say there is one but I can't find
> it.
> 
> Thank you,
> 
> Tim Heagarty, CISSP, CISA, MCSE
> http://www.TheaSecure.com/
> (928) 533-9690
> "There are 10 kinds of people in the world; those that understand binary,
> and those that don't."
> 
> 
> 

