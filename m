From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: bridging with iptables (was no subject)
Date: 30 Jun 2002 14:21:32 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025439692.1643.23.camel@tux>
References: <1025308208.860.9.camel@tux>
	<NJEFLNJDIFFNMHDEBKMJGEJGDOAA.jpatterson@asgardgroup.com> 
	<20020630091342.U4136@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020630091342.U4136@oknodo.bof.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Schaaf <bof@bof.de>
Cc: Joe Patterson <jpatterson@asgardgroup.com>, Netfilter <netfilter@lists.samba.org>

On Sun, 2002-06-30 at 09:13, Patrick Schaaf wrote:
> Hi Joe,
> 
> > Does anyone know how netfilter deals with non-ip protocols?
> 
> Yes. It doesn't deal with them at all, as delivered "out of the box".
> 
> Here's a dump of what I know about the situation:
> 
> - netfilter is a set of hooks placed in stratetic places in the L3 networking
>   stack. Right now there are hooks for IPv4, IPv6, ARP, and I think there's
>   also something for DecNET, which I don't now nothing about.
> - the hooks are all _inside_ the L3 stack.
> - iptables is a user of the hooks put into the IPv4 stack.
> - ip6tables is a user of the hooks put into the IPv6 stack.
> - arptables is a user of the hooks put into the ARP stack.
> - there is a patch to place netfilter hooks into the bridge code,
>   which _may_ be capable of filtering by ethernet protocol type.
>   I have not used it or looked closely. See http://bridge.sourceforge.net/
> 
> I don't think that there is any code right now which is able to filter
> on IPX or AppleTalk header fields.

http://users.pandora.be/bart.de.schuymer/ebtables/

Description: ethernet bridge tables

this is another user of the netfilter hooks in the bridge code.
And ebtables can filter on ethernet protocols and some simple ipv4
filtering aswell.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

