From: Matt Hellman <netfilter@taxandfinance.com>
Subject: Re: OT: iptables-like firewall for windows?
Date: Fri, 22 Aug 2003 22:54:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F46E563.3040101@taxandfinance.com>
References: <3F461A22.90300@bus.okstate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F461A22.90300@bus.okstate.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Joines <joines@bus.okstate.edu>
Cc: netfilter@lists.netfilter.org

Jason Joines wrote:
>  We have a completely Linux back-end environment but unfortunately
> hundreds of windows desktops.  I'm pretty tired of all the attacks on
> the unprotected windows boxes but don't have the authority to put up a
> network firewall.  We protect all of our Linux servers with iptables.
> Does anyone know of a similar tool for windows, particularly w2k?  The
> built-in stuff seems to be virtually worthless.
> 
> Thanks,
> 
> Jason Joines
> Open Source = Open Mind
> ========================

You mean your Windows desktop boxes are just sitting out on the Internet 
unprotected?  That seems unlikely...surely they are at least behind a 
NAT device or proxy?  In any event, A linux firewall (or any firewall) 
isn't going to fully protect you..take a look at the latest security bug 
in IE (object tag).  Keeping the desktops patched will go a LONG way 
towards securing those machines.  Don't put too much faith in a 
firewall, all it takes is one notebook user to bring your whole network 
down with a virus/trojan.

Goodluck,
Matt



