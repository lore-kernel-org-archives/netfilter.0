From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 14:29:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088101748.2028.39.camel@grendel>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
	 <200406241454.28088.Antony@Soft-Solutions.co.uk>
	 <1088092124.2029.28.camel@grendel>
	 <200406241709.50795.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406241709.50795.Antony@Soft-Solutions.co.uk>
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

On Thu, 2004-06-24 at 12:09, Antony Stone wrote:
>
> In my experience (with things like SMTP, HTTP) it appears to be the server 
> which generally issues the (first) FIN/ACK, telling the client that there's 
> no more data 

Weird, my experience with HTTP has been the other way around. The client
request typically requires just a single back. Its the data returned
from the server that can take multiple packets (thus the client finishes
first). This is why when most people run into this time-out issue its
always the server still trying to transmit _from_ TCP/80, rather than
the client trying to send _to_ TCP/80. A good example are the log
entries that started this thread.

> I wonder how other stateful firewalls (eg: CP FW-1?) handle this sort of thing 
> - do they listen for *both* FIN/ACKs (and thereby leave themselves prey to 
> half-open connections littering their connection table for systems which 
> don't bother to send the responding FIN/ACK)?

With FW-1 and PIX, they use a higher state table time out. Again, proper
way to fix this would be to reset the timer if the session stays active.
Fixes both your worries and mine. :)

As for OS's that don't return a FIN/ACK, I can't say I've seen this in
the wild (which is why I asked which OS so I could test this). I know
there used to be a few OS's (older Mac OS and SGI come to mind) that
used to "cheat" by sending a RST/ACK instead of a FIN/ACK, but that was
cleaned up years ago.

HTH,
Chris



