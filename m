From: Manuel Samper <manuel@samper.dyndns.org>
Subject: Re: Rejecting udp
Date: Thu, 6 Mar 2003 20:53:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030306195359.GA28937@quark.lan>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local> <003f01c2e1e2$2d9bd100$0301a8c0@hotpop3> <33803.192.222.90.38.1046775610.squirrel@pelorus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <33803.192.222.90.38.1046775610.squirrel@pelorus.org>
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
To: netfilter@lists.netfilter.org

Skip Morrow, on Tuesday, Mar  4 2003 at 12:00, wrote:
> I am trying to remember my networking class (/me shakes the cobwebs out)
> 
> I think that the original question is a good question.  UDP packets
> (legitimately) arriving at my computer are not acknowledged.  That is, I
> don't tell the sender "Yeah, I got that packet.  Thanks."  Nor, do I tell
> the sender "Whoops.  I didn't quite get all of that last packet.  Could
> you send it again?" So, REJECTing a UDP packet doesn't make sense.  The
> sender isn't looking for any type of OK message or anything for that
> matter.  In fact, where would the REJECT message go?  Does the sender even
> have a listen port open?
> 
> But then again, I could be completely wrong.

Maybe. UDP connectionless means any protocol lying on top should
implement their own connection tracking mechanism if it wants one, tftp
is an example that comes to my mind (http://www.ietf.org/rfc/rfc1350.txt
if you are curious).

I don't knwon the SMB internals, but it's wise to reject a blocked port
from inside your lan instead of let any timeouts expire, as someone
noted.

	Manuel

