From: David Cannings <lists@edeca.net>
Subject: Re: FW: Filtering multiple networks
Date: Mon, 31 May 2004 20:59:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405312059.57152.lists@edeca.net>
References: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org> <200405311319.33568.lists@edeca.net> <20040531192351.GB26731@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040531192351.GB26731@home.manuelm.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 31 May 2004 19:23, Frank Gruellich wrote:
> * David Cannings <lists@edeca.net> 31. May 04:
> > On Monday 31 May 2004 10:45, Frank Gruellich wrote:
> > Can you please explain how a TCP RST or ICMP message is supposed to
> > get back to a spoofed RFC 1918 (or otherwise reserved) address?
> What makes you think the address is spoofed?  I assumed somebody just
> configured its external interface wrong.  Some antique idea, that not
> all people are bad guys.

Nowadays many core routers will drop packets that appear to come from 
addresses that either haven't been allocated or shouldn't be seen on the 
wider Internet, therefore if packets have got as far as you something is 
awry.  RFC 1918 and RFC 3330 are both good references, then 
http://www.iana.org/ipaddress/ip-addresses.htm.

> > Sending replies of any sort out of a WAN interface onto the Internet
> > to a reserved or private address is very bad practice.
> Yes, okay, you are right.  Sorry, a reflex, when I see -j DROP.

Personally I don't know what to think on the REJECT vs DROP debate, so I 
sit on the fence.  Like everything else, each has advantages and 
disadvantages.

> > Some would even argue that sending to unallocated space is bad.
> What do you mean with unallocated space?

IP blocks that have not been allocated by IANA or one of the regional 
authorities (RIRs).  This conversation is likely to go way off topic for 
this list so instead I'll provide the following URL: 
http://www.cymru.com/Bogons/

David

