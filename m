From: David Cannings <lists@edeca.net>
Subject: Re: FW: Filtering multiple networks
Date: Mon, 31 May 2004 13:19:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405311319.33568.lists@edeca.net>
References: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org> <20040531104524.GA26731@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040531104524.GA26731@home.manuelm.org>
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

On Monday 31 May 2004 10:45, Frank Gruellich wrote:
> * Markus Zeilinger <mz@sea.uni-linz.ac.at> 31. May 04:
> > - Thy is DROP bad here? As I see REJECT would send an error message
> > back to the source, but this would not make any sense on packets
> > coming on the WAN interface with private IP addresses, or am I wrong?
> It would be kinda polite to point the sender of the packets to his
> misconfigured box.  REJECT is like yelling 'Hey, you are wrong!'
> DROPping is like closing your eyes to somebodys problem.  Anyway, it's
> you decision right here.

Can you please explain how a TCP RST or ICMP message is supposed to get 
back to a spoofed RFC 1918 (or otherwise reserved) address?  Sending 
replies of any sort out of a WAN interface onto the Internet to a 
reserved or private address is very bad practice.  Some would even argue 
that sending to unallocated space is bad.  If border routers don't drop 
such packets, your firewall most certainly should.

David

