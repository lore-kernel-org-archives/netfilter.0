From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: wireless security
Date: Thu, 10 Jun 2004 08:43:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D47282C@fsnsab20.losangeles.af.mil>
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
To: 'Aleksandar Milivojevic' <amilivojevic@pbl.ca>, Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>


alexksandar,

	i concur with your assessment as to not allowing such
	folly.

	sometimes corporate mandates require security policy to bend
	to bottom-line needs. 

	a couple of suggestions though if you just gotta do it.

	determine what protocols you want to use as this speaks to distance
	and calculation of telemetry stand off distances.
	
	802.11x goes x where x = y ft w/out causing or receving unfiltered
	interference. 

	the perimeter should use a belt and suspenders topology to prevent
	common-mode failures. example....lotsa wintel boxes as clients
suggest
	asic (da best) boxes or unix based firewalls to challenge an
attackers 
	platform knowledge base. solaris or hpux box running checkpoint and
some cisco
	mixed in as chokes would do nicely. the web traffic after leaving
the wireless
	ids vlan oops..forgot to mention the conex inbound from the isp over
wireless
	interface are segregated and filtered by the wirless ids BEFORE
touching the wired
	to prevent lan bcast storms to any wireless nets that might be
looking or just sniffing.

	gee...okay enuf windbags...these are all polciy items that must be
attended to before 
	plugging anything into your production nets.

	take it slow.

~piranha@suspicious.org

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Aleksandar
Milivojevic
Sent: Thursday, June 10, 2004 7:17 AM
To: Peter Marshall
Cc: netfilter
Subject: Re: wireless security


Peter Marshall wrote:
> Hi guys,
> 
> I am sure someone has been faced with this problem, and I was just
wondering
> what the possible solutions are.  A city wide free wireless network has
just
> expanded to cover the area encompassing our building.  The provider of
this
> is also the provider of our Internet (via fiber).  It was decided that it
> would be advantageous for some of our employees to be able to use this
> wireless network when we bring in clients etc.  This of course opens a
large
> possibility of problems concerning crap getting onto our network
(especially
> if they are connected to wireless and plugged into the network).
> 
> We have made it a policy that a personal firewall be installed on all
> firewalls, and that at no time is a wireless card to be plugged into a
> laptop while connected to our LAN.  This of course does not do much for
> internal cards ....
> 
> Is there anyway at all that I can firewall this ?  Or is there a way o
> prevent the two networks from being active at the same time .. I am at a
bit
> of a loss here.

I guess that machines that will be plugged to both wired and wireless 
networks are going to be Windows boxes?  I'm affraid you can't do much 
more that you already did.  Turn off IP forwarding in each of those 
Windows boxes (so they can't route traffic into your network), and turn 
on firewall on wireless interface.  Depending on how are those Windows 
boxes managed, you should be able to make policies that will prevent 
users from changing those settings.  But still, computers with wireless 
access will be the very weak spot on your network (for example, they 
will bypass any anti-virus you might have installed centrally).  IMHO, 
from security point of view, allowing such wireless access is very bad 
idea.  I'd probably put all those clients on separate physical network 
behind firewall, and would trust that network the same as I trust Internet.

If they must have wireless access, build your own wireless network that 
you controll.  If they must use public wireless network, put a wireless 
card in the firewall and remove wireless cards from the clients.  If 
they need both, make a combination of this two.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

