From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Thu, 24 Oct 2002 22:31:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021024223148.A19115@funkyjesus.org>
References: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain> <1035328874.10494.38.camel@elendil> <200210230943.g9N9hiL02304@vulcan.rissington.net>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200210230943.g9N9hiL02304@vulcan.rissington.net>; from Antony@Soft-Solutions.co.uk on Wed, Oct 23, 2002 at 10:43:37AM +0100
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Wed, Oct 23, 2002 at 10:43:37AM +0100, Antony Stone wrote:
> On Wednesday 23 October 2002 12:21 am, Cedric Blancher wrote:

<snip>

> > This means, that with proper output filtering, we couldn't have achieve
> > this this easy, and must have find something else to gain our remote
> > shell. That would have make the intrusion far more difficult.
> 
> The OUTPUT rules are always going to allow traffic to or from expected
> ports.  53 is a good one to guess is going to be made accessible, so you
> simply set up netcat to contact your external system on port 53, and you
> can still do what you've outlined above even with pretty good OUTPUT
> filters in place.
> 
> The trouble is, netfilter only knows about IP addresses and TCP/UDP port
> numbers - it doesn't understand anything about the content of packets
> being sent on those ports, so it can't check that port 53 is being used
> only for DNS queries, port 80 is being used only for HTTP transfers etc.

Yes, but then, as someone else has already pointed out, you could
encapsulate malicious traffic within legitimate looking requests - so a
netfilter with an understanding of DNS traffic wouldn't help.  So even those
filters don't prevent any malicious outbound traffic, but think of the
effort and knowledge involved compared to just allowing anything outbound.

> My point is that if you can break into a machine, you can break out of it 
> again,

Eventually, possibly, it's all about making the time and effort involved so
great that it's not worth trying.

> so OUTPUT filters are generally either not much use, or they get in the
> way of your normal applications.

Depends if you write them, er, right.

> Re the comment "--cmd-owner is your friend", I agree that this is worth
> adding to any OUTPUT rules you do choose to specify, but bear in mind that
> a compromised application or trojan is still going to be running under an
> expected user on the target machine, therefore --cmd-owner isn't
> necessarily going to see anything strange...

Oh yeah, tis but another tool in the box.

> If you're concerned about this level of security (which you should be)
> then you need to deal with Operating System security and things like Host
> Intrustion Detection - netfilter is not going to do the job effectively
> for you.

"Host Intrusion Detection"?  For example..... ?

-- 
FunkyJesus System Administration Team


