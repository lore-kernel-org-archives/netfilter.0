From: Philip Pemberton <usenet06@philpem.me.uk>
Subject: Re: NATing on a single interface?
Date: Thu, 26 Oct 2006 21:44:06 +0100
Message-ID: <ehr6m6$v00$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org> <ehql65$f08$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehql65$f08$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Robert Nichols wrote:
> There's no reason a forwarded packet can't go back out the same
> interface on which it arrived.  There's an obvious compromise in
> security when you have both sides of the firewall on the same

I do trust my own machines, basically because they're mine - I'm very 
obsessive about keeping the OS and virus scanners up to date.

 > physical network, but if you trust your own machines and just
 > want to protect against external attacks you should be OK as
 > long as the DSL router forwards packets to the firewall machine
 > only.

It appears to be mangling the packets - e.g. an inbound packet from 
12.34.56.78 to 98.76.54.32 (PPP_IP) gets its destination IP changed to the DMZ 
address (e.g. 10.0.0.1 for my server). Return packets are sent to the source 
(e.g. 12.34.56.78 in the example) using the DSL router (10.1.0.2) as the gateway.

What I need to figure out is how to actually set up the firewall. I did find a 
nice IPTables tutorial, but it's 357 pages long! Guess I'd better stop 
procrastinating and start reading....

Thanks.
-- 
Phil.                         |  (\_/)  This is Bunny. Copy and paste Bunny
usenet06@philpem.me.uk        | (='.'=) into your signature to help him gain
http://www.philpem.me.uk/     | (")_(") world domination.
If mail bounces, replace "06" with the last two digits of the current year.


