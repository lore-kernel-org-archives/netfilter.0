From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: one interface, basic setup
Date: Thu, 21 Jul 2005 06:49:50 -0500
Message-ID: <42DF8BDE.5080805@gmx.co.uk>
References: <42DF0A8E.9020102@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DF0A8E.9020102@sbcglobal.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Bill McCormick wrote:
> (basic and packet filtering) I still feel unsure. I want to build a FW 
> for outgoing packets only. My setup looks like this:
> 
> internet <---->Netgear FVS318 <----> LAN

A dual-homed Linux machine could do a better job in place of that 
router. A lot of folks believe in "hardware routers", but in fact those 
are only software routers which provide less control and may have 
unknown vulnerabilities. (Exception: Linksys embedded Linux devices. 
Using a Linux distro for that platform makes them very powerful.)

> Where LAN is a Linux FC3 and several Windows machines. The router closes 
> all outbound traffic except from the FC3 box. Currently, Windows 
> machines DHCP from the router, so that is the gateway, and proxy out

Right now I'm like this at home:
Internet <---> Linksys WRT54G [switch + WAP] <---> LAN
The DHCP server is one of the LAN hosts, but the Linksys is still the 
gateway. There's no inherent connection between who is DHCP and who is 
the default gateway.

> through squid et. al. on FC3. I'll move the DHCP service to FC3 and make 
> that the gateway.

That's awkward in that each packet destined to go out will pass twice 
over the LAN: once from originator to FC3, then again from FC3 to the 
router. Will it cause problems for you? I don't know.

> I want the FC3 gateway to allow all outbound traffic 
> from squid; destination ports might be more than HTTP. I also want to 
> allow outbound SMTP and POP to a specific destination only. FC3 is also

It's very important to restrict outbound SMTP of Windows machines, 
especially if it happens that they get infected. Most spam these days 
originates (in SMTP terms) from unsecured home Windows machines.

> providing services http, telnet, ftp, ssh, smtp, imap/imaps and 
> pop/pop-ssl. Eventually, I'll want to do a transparent proxy as well.

Note that with shell access, your users could get out directly. I 
believe that even a Windows machine can tunnel ports over ssh.

> So it looks like I want both the INPUT and OUTPUT chains to ACCEPT all 
> and I should build rules in the FORWARD chain. With only one interface, 
> is that correct?

I think you're right, yes. With only one interface you have the problem 
of not being able to filter on the incoming interface. You have to use 
IP-based rules, and a determined and capable "attacker" could get around 
your limits.

I think I'd set up a different logical segment for the clients, such 
that they could not reach the router at all. Just one more hurdle for 
any would-be "extruder" trying to get out.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

