From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: inner workings of IP tables
Date: Mon, 30 Sep 2002 12:49:03 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0209301239460.3130-100000@netmonster.pakint.net>
References: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Dwyer <Kevin.Dwyer@algx.net>
Cc: netfilter@lists.netfilter.org

On Sun, 29 Sep 2002, Kevin Dwyer wrote:

> Sorry to barge in, but included are some comments I thought must be made.

Ditto.

> On Sun, 29 Sep 2002, Antony Stone transmitted the following:
>
> > On Sunday 29 September 2002 8:05 pm, Mitesh P Choksi wrote:
> >
> > [ Comparing netfilter with Checkpoint Firewall-1 ]
> >
> > > What about ease of use? The GUI
>
> http://www.fwbuilder.org
> (which incidentally generates rulesets for iptables, pf, and ipfilter)
>
> Not that a GUI makes a good firewall.  Aren't you pretty much dead in the
> water with checkpoint if you don't have access to their GUI?  I know you
> can fw load policies, and possibly even compile them via CLI, but I
> challenge you to make competent ruleset changes with vi on checkpoint.

Hehehehe - BD3 (been dere done dat) and it is actually fairly easy.
There are three main ascii files you need to know about but it is pretty
much the same as scripting iptables. You have Objects that are acted upon
by Rules. Of course you end up defining first the object then the rule in
different files. But I have written up perl scripts to do this for
specific setups (back on 4.1 when I needed a Time limited setup I had a
cron job that would change the rulesets from businesshours to
nonbusinesshours)

In fact once you get used to NetFilter/IPTables especially in a scripting
environment you can actually make better sense out of the CP structure. Of
course I only use(d) CP on Solaris where I had SSH access. I remember when
they decided that I should not have access to the GUI because that was the
FW Admin's job. Funny part is he never did notice all the special rules I
implemented (hint - there is a way in the command files to declare rules
as implicit and also as internal ~= hidden)

> > > Multiple firewalls.
>
> http://www.linux-ha.org
> http://w3.arobas.net/~jetienne/vrrpd/
> (and more, peep the linux-ha site for a huge list of resources)
>
> Netfilter doesn't have the code to pass the state table across machines
> (and would be a neat feature) but you can make a firewall pair by either
> using VRRPd or Linux-HA.  You'll drop active connections, but CP did too
> up until recently I think.

Still pretty much does even in NG. At least under real testing (ie: unplug
the one box in the setup)...

> > > Management of firewalls.
>
> ..is made more difficult with their reliance on a GUI, IMO.
>
> ..is made more difficult with their licensing schemes.

YES!

> ..is made more difficult when CP support says: Sorry, the only solution to
> esoteric bug #48129 is to upgrade to the newest version.  Sorry, the only
> solution to esoteric bug #48130 is to downgrade to the previous version.
> (as the clock counts the downtime)

Hehehehehe - yep.

> ..is made more difficult when you upgrade the GUI and magically things
> like Manual IPSEC (and who knows what else) disappear.

Or even better - you now have a bunch of defined Objects which you CANNOT
change except by manually deleting them from the file... sigh.

> /* Kevin Dwyer                                Allegiance Internet */
> /* network security engineer                   Commerce Center II */
> /* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
> /* phone: 240-616-2075                        Greenbelt, MD 20770 */
> /*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


