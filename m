From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: TTL target
Date: Fri, 23 Jul 2004 13:35:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382A6B@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

sorry for being a wet blanket - so to speak.

if stateless defense algortihms are employed, the need to retain state in
order to 
make proper decisions.

i suspect that much of todays netsec and/or ids software violates one of the
main
premises of coding securely [re:
cheswick/bellovin/comer/farmer/venema/etc...

--> 	bad traffic....

0.	cant get thru code is specialized, fast, small and clean...(fewer
possible holes)
	
	programmmers...
	i used to write assembler, so its not w/out my own past coding sins 
	but you canned guys are too smart for me nowadays...besides C became
kooler than
	masm...hmmmm

	you perl/C+/c-not-so-sharp guyz, please check your
arrays/matrices/string and error 
	handlers before/after calls (during testing phases), instead of
blindly trusting the
	integrity of other stack software....

	my syadmin colleagues in the shell scripting community (including
moi) should rtfm [re: manpages]
	a bit more before we implement new or expand existing services.

	firewall folks....
	learn the syntax and execution order of whatever module you are
using if possible.
	there's nothing worse than editing rules in the order you want and
some "optimizer"
	re-orders your ruleset during the commit and reflects it on display.

	also remember the thingz a firewall can and connot do.
	dont "set it and forget" as many corps would have you do.

1.	cant attack service if daemon isnt running its not running.
(self-explanatory)

2.	cant attack daemon, if it isnt listening or only rcv/xmt w/its front
end 
	(web,proxy,etc...)service if daemon isnt running its not running.
	(this addrresses of common-mode failure,,if my winbloze box get
broken
	the same sets of tools MUST require execution on a diff
chipset,ruleset,OS platform)
	this set of hacking tools are a prodigous feat to have handy AND
shift gears 
	at the same time......

its just that it causes one to wonder if redirecting for control / stat
gather / chroot jails
or just plaining denying access to "suspect" by...

association
	(isps that allows launches from there domains), policy, siganture or
just plain lack of trust isnt

signature
	(this looks like it did the last time we got attacked, lets treat it
the same - kill it)

policy
	(i am a transit carrier and my customers will look elsewhere if they
think i'm letting exploits traverse
	(the same routes as his traffic)

	i'd just as soon drop packets with a silent but resounding thud
w/out signalling that i ever saw them.

!piranha

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Friday, July 23, 2004 11:43 AM
To: Gonzalez, Federico; netfilter@lists.netfilter.org
Subject: RE: TTL target


just re-read your original post.  if you're trying to *change* the TTL of
packets traversing your firewall--you need the TTL patch from patch-o-matic,
which will enable a "-j TTL" target in the MANGLE table.

sorry for the confusion.

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
Federico
Sent: Friday, July 23, 2004 1:52 PM
To: netfilter@lists.netfilter.org
Subject: TTL target


Hi,

I have iptables 1.2.9, red hat kernel 2.4.22 and i need to use the TTL
target to change the packets TTL.

How do i enable this functionality ?

Thank you.


