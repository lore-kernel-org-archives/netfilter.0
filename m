From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: FW: Filtering multiple networks
Date: Mon, 31 May 2004 21:23:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531192351.GB26731@home.manuelm.org>
References: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org> <20040531104524.GA26731@home.manuelm.org> <200405311319.33568.lists@edeca.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200405311319.33568.lists@edeca.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

* David Cannings <lists@edeca.net> 31. May 04:
> On Monday 31 May 2004 10:45, Frank Gruellich wrote:
> > * Markus Zeilinger <mz@sea.uni-linz.ac.at> 31. May 04:
> > > - Thy is DROP bad here? As I see REJECT would send an error message
> > > back to the source, but this would not make any sense on packets
> > > coming on the WAN interface with private IP addresses, or am I wrong?
> > [misconfigured box]
> Can you please explain how a TCP RST or ICMP message is supposed to get 
> back to a spoofed RFC 1918 (or otherwise reserved) address?

What makes you think the address is spoofed?  I assumed somebody just
configured its external interface wrong.  Some antique idea, that not
all people are bad guys.

> Sending replies of any sort out of a WAN interface onto the Internet
> to a reserved or private address is very bad practice.

Yes, okay, you are right.  Sorry, a reflex, when I see -j DROP.

> Some would even argue that sending to unallocated space is bad.

What do you mean with unallocated space?

Thank you,
 regards, Frank.
-- 
Sigmentation fault

