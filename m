From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: FW: block + kill connections
Date: Sun, 8 Jan 2006 19:26:33 -0500
Message-ID: <000001c614b3$583c82e0$2801a8c0@MBRC40>
References: <200601081728.01152.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601081728.01152.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

> On Sunday 2006-January-08 17:01, Michael D. Berger wrote:
> > > > I have the same problem.  I DROP in the INPUT chain, but
> > > > the connection stays up
> 
> Likely so, insofar as your local process knows, as explained in my 
> corrected reply to Bob Nichols. But ...
> 
> > > > and receives more junk. 
> 
> No, not if you used a rule as the OP did, with -I to put it 
> at the top 
> of INPUT rules. If a packet matches the first DROP rule, that's where 
> it stops. If a --state RELATED,ESTABLISHED -j ACCEPT rule 
> precedes the 
> DROP, yes, but that's a different issue.
> 
> > > > I await admonition by those more knowledgeable than I.
> 
> Does it make sense now?

[...]

It does make sense in theory, but not in practice.  Below is an excerpt
from the results of an iptables-save (with numbers zeroed).  As you can
see, the QUEUE preceeds any ACCEPT except for -i lo.  The extra DROP is
my paranoia in case QUEUE doesn't work.  The OUTPUT chain blocks some
output that previous communications indicated should not be there. I
note that when I say that there are packets in both directions after
the DROP I have confirmed this with tethereal, which I have running in
the background.  Perhaps there are some timing issues that have not
been mentioned?

:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:MDB-IN - [0:0]
[0:0] -A INPUT -j MDB-IN
[0:0] -A OUTPUT -j MDB-OUT
[0:0] -A MDB-IN -i lo -j ACCEPT
[0:0] -A MDB-IN -p tcp -m tcp --dport 80 -j QUEUE
[0:0] -A MDB-IN -p tcp -m tcp --dport 80 -j DROP
[0:0] -A MDB-IN -m state --state RELATED,ESTABLISHED -j ACCEPT

Mike.
--
Michael D. Berger
m.d.berger@ieee.org 



