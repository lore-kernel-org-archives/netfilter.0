From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: inner workings of IP tables
Date: Mon, 30 Sep 2002 00:52:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929235243.RXLC6699.mta01-svc.ntlworld.com@there>
References: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
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
To: netfilter@lists.netfilter.org

On Monday 30 September 2002 12:37 am, Kevin Dwyer wrote:

> Sorry to barge in, but included are some comments I thought must be made.

No problem - it's a public mailing list :-)

> Not that a GUI makes a good firewall.  Aren't you pretty much dead in the
> water with checkpoint if you don't have access to their GUI?  I know you
> can fw load policies, and possibly even compile them via CLI, but I
> challenge you to make competent ruleset changes with vi on checkpoint.

Yes, and the choice of platforms for the GUI is much smaller than for the 
firewall product itself.   FW-1 runs (to my knowledge, possibly more now) on 
Windows, Solaris, RH Linux and Nokia IPSO.   The GUI runs on Windows.

Okay, there *is* a version of the GUI for Solaris, but it's horrible, and is 
missing quite a number of the features of the version they want you to 
use.....

> Netfilter doesn't have the code to pass the state table across machines
> (and would be a neat feature) but you can make a firewall pair by either
> using VRRPd or Linux-HA.  You'll drop active connections, but CP did too
> up until recently I think.

No, I think CP FW-1 has pretty much had state table synchronisation for as 
long as they've been supporting things like Stonebeat and VRRP to provide the 
failover.   They've certainly had it for the past 5 years.

> > > Management of firewalls.
>
> ..is made more difficult with their reliance on a GUI, IMO.

Hmmm.   It looks easier and gives you "point-and-click" (over)confidence, but 
I agree that if you lose the GUI, you're stuffed.

> ..is made more difficult with their licensing schemes.

Pay them enough $$$ and you get an unlimited licence, full VPN, decent 
encryption.   I'd prefer to use netfilter and spend the money on a house.

> ..is made more difficult when you upgrade the GUI and magically things
> like Manual IPSEC (and who knows what else) disappear.

Hmmm.   I haven't seen that, but then I haven't played with FWng.   As you 
say, though, with a GUI-based product you're at the vendor's mercy how easy 
they make it for you to get at different parts and set things the way you 
want.   At least with a CLI you're in full control, even if you need to learn 
a bit more syntax before you start typing.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

