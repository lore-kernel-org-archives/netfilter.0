From: Phil Howard <phil-netfilter@ipal.net>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 10:10:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013101034.E15824@hamal.ipal.net>
References: <20021013065007.A15824@hamal.ipal.net> <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there> <20021013080034.B15824@hamal.ipal.net> <20021013135349.FARY28874.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021013135349.FARY28874.mta06-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sun, Oct 13, 2002 at 02:53:46PM +0100
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

On Sun, Oct 13, 2002 at 02:53:46PM +0100, Antony Stone wrote:

| > | Why don't you want 10000 rules on your netfilter box ?   Have you tried
| > | it and found it causes any problems ?
| >
| > My understanding is they are tested sequentially.  Maybe this isn't true,
| > but I see no documentation to the contrary regarding netfilter being any
| > different than past table oriented access list style filtering which uses
| > sequential testing to implement the ordered logic usually involved.
| 
| Your understanding is correct.   Netfilter rules are tested sequentially.   
| However, I think it would still be worth a test of setting up a few thousand 
| rules and see whether you get acceptable bandwidth.   What speed is your 
| external Internet connection ?

The external speed is 45 mbps.  Connections come in at 20-30 per second
during certain peak times.  That works out to 200000-300000 tests per
second.  I think that's pushing the envelope a bit too much, even for a
route-only box.  It's these peaks (usually spam overloading an SMTP server
despite it will be rejecting the mail) that I'm wanting to reduce the impact
from.

What I was hoping for was a means to replace an address in a rule with some
kind of reference to a lookup table object that had multiple addresses and
scaled better than O(n).


| > | > I want to block _incoming_ packets.  Null routing these addresses is
| > | > not sufficient, as the lame SYNs will continue to eat up resources.
| > |
| > | I don't understand that last part.   If you null route packets, surely
| > | there's no destination for the SYNs, therefore no half-open connections
| > | get set up ?
| >
| > Null routing is the goal.  Deciding on the course/direction to pursue is
| > what I am doing at the moment.  It sounds like maybe source routing might
| > be more appropriate than netfilter in this case.
| 
| I think so.   Try using the standard routing table's abilities to block 
| packets at the gateway (same way as 192.168.0.0 packets get blocked by 
| routers), before actually sending them somewhere else to get eaten - the 
| latter could just be a waste of time to set up.

Standard routing uses the destination to look up what to do.  This will need
to be based on source address.  Apparently the policy routing has this
capability, but the documentation for that stuff is rather vague so far.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

