From: Kevin Dwyer <Kevin.Dwyer@algx.net>
Subject: Re: inner workings of IP tables
Date: Sun, 29 Sep 2002 19:37:40 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
References: <20020929193020.YCUL13996.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929193020.YCUL13996.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Sorry to barge in, but included are some comments I thought must be made.

On Sun, 29 Sep 2002, Antony Stone transmitted the following:

> On Sunday 29 September 2002 8:05 pm, Mitesh P Choksi wrote:
>
> [ Comparing netfilter with Checkpoint Firewall-1 ]
>
> > What about ease of use? The GUI

http://www.fwbuilder.org
(which incidentally generates rulesets for iptables, pf, and ipfilter)

Not that a GUI makes a good firewall.  Aren't you pretty much dead in the
water with checkpoint if you don't have access to their GUI?  I know you
can fw load policies, and possibly even compile them via CLI, but I
challenge you to make competent ruleset changes with vi on checkpoint.

> > Multiple firewalls.

http://www.linux-ha.org
http://w3.arobas.net/~jetienne/vrrpd/
(and more, peep the linux-ha site for a huge list of resources)

Netfilter doesn't have the code to pass the state table across machines
(and would be a neat feature) but you can make a firewall pair by either
using VRRPd or Linux-HA.  You'll drop active connections, but CP did too
up until recently I think.

> > Management of firewalls.

..is made more difficult with their reliance on a GUI, IMO.

..is made more difficult with their licensing schemes.

..is made more difficult when CP support says: Sorry, the only solution to
esoteric bug #48129 is to upgrade to the newest version.  Sorry, the only
solution to esoteric bug #48130 is to downgrade to the previous version.
(as the clock counts the downtime)

..is made more difficult when you upgrade the GUI and magically things
like Manual IPSEC (and who knows what else) disappear.


/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */




