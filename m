From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Fw: DROP All MACs
Date: Mon, 17 Nov 2003 13:38:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031117183840.GB15103@cannon.eng.us.uu.net>
References: <002901c3ad2d$9229c390$0d1ea8c0@win2000adv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002901c3ad2d$9229c390$0d1ea8c0@win2000adv>
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
To: curlybraces <curlybraces@dialogsl.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, Nov 17, 2003 at 11:09:33PM +0600, curlybraces wrote:

> > Oh , i'm sorry
> >
> > i will explain , but i need good solution for this matter today itself
> > ...............pls
> >
> > let me to explain ,
> >
> > in my lan has 5 windpows 2000 pcs. and one Red Hat Linux 8 box .This linux
> > box has 2 ethernet - eth0 , eth1 .
> > DHCP , Firewall ( iptables ) running in the Linux box .Normally without
> > implemention g firewall dhcp server works fine . why i'm try to install a
> > firewall for the dhcp server  is i want block some machines which r
> strainge
> > to the network .
> > using MACs we can restric such unknown users .
> > so what i'm trying to do is
> > as default policies input , forward, output drop .
> > as a next step i sugest to do drop all macs which r in the network .
> > as a next step i willing to do accept one by one which r known as trusted
> > users .
> >
> > so my . Antony this is the i want to implemet for the LAN . If I
> > successfully implemented for the LAN , next step is implement this
> firewall
> > for the Cable modem for the public users.
> >
> > so now i think what am i expecting u ....................!!!!!!!
> > pls reply me soon...........now can u tell me ur any contact no : ?

What you can/should do is to setup your DHCP server to assign IP's to only
those five MS machines (based on their MAC). Although, this does not prevent
any other machine to assign itself a valid IP statically. To solve this
problem is to only allow the traffic of the MAC's you know and drop any other.
An example has been given to you by Antony in a previous email.

This is a frequent problem of the wireless LAN's... The answer is "know your
trusted MAC's". Or let them authenticate before any "session" (with some
well-defined definition of a session).

Ramin

