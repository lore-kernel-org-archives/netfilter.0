From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Firewall won't let win98 in ???
Date: Wed, 11 Jun 2003 08:31:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306110831.15816.Alistair@nerdnet.ca>
References: <20030608211659.A14869@jmhowell.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030608211659.A14869@jmhowell.com>
Content-Disposition: inline
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
To: "Jerry M. Howell II" <jmhowell@jmhowell.com>, netfilter@lists.netfilter.org

On June 8, 2003 11:16 pm, Jerry M. Howell II wrote:
> I know this might sound a bit strange but has anyone ever had the
> problem were the firewall will let linux, freebsd, win2k, and winxp by
> but noone that seems to run win98 can access my webserver at all. My
> clients that run it can't pull in e-mail, nor ssl, or even a simple
> webpage. All other O/S'es seem to access it just fine. Anyone have any
> clues as to what I need to do to allow win98 and possably win95 past the
> firewall besides putting DNS on a seperate server?

-- 
	I've run into something odd with win98 and iptables once myself.
	I had 1 (one) of 3 win98 clients that *could not* connect correctly 
	to the webserver/FTP/ssh servers from inside the firewall, but
	could surf the internet, connect to outside services etc.... 

	I belive that it had to do with win98 IPMTU discovery being
	turned off.  I had to completely remove the registry entries regarding
	networking and then reinstall the networking compnents.

	The root cause was one of those freeware *improve your internet
	surfing speed* applications that *tunes* the windows networking 	
	settings. (and apparently does a terrible job at it since it turns off
	IPMTU discovery!!!!) 

	Other possible issue.  -- *IF* you are connected to DSL on the outside, 
	are you running an MTU clamp?? (Something like :)
	iptables -A FORWARD -s $INSIDE_SEGMENT -d 0.0.0.0 -m TCPMSS \ 
	-j --clamp-mss-to-pmtu ??
	If the clients can surf the web, but cannot connect to the firewall host,
	you might want to put that in the input chain as well..

	If you aren't running one at all, I'd *very* strongly reccoment the function
	as it cures many connection ills with b0rked TCP stacks that do not 
	conform to the standards.

	win98 (original retail) and win95 have rather nonstandard TCP stacks.
	


	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

