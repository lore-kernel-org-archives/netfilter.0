From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Clear Iptables chains?
Date: Mon, 8 Jul 2002 18:01:37 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708170139.UTNE19225.mta07-svc.ntlworld.com@there>
References: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX> <200207081522.g68FMr807248@vulcan.rissington.net> <02070818341908.14428@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070818341908.14428@Lms>
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
To: netfilter@lists.samba.org

On Monday 08 July 2002 5:34 pm, Jan Humme wrote:

> On Monday 08 July 2002 17:22, Antony Stone wrote:

> > I'd prefer to see:
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> >
> > Then you add in the rules for the stuff your definitely know you want to
> > allow.
>
> Certainly.
>
> What about default policies for the nat and mangle tables?

Those should be ACCEPT, unless you're being sneaky/clever, and you definitely 
know what you are doing..

The reasons are simple:

1. The choice of whether to block or accept packets should be done in the 
filtering table - that's what it's for.   The nat table is for address 
translation, and the mangle table is for packet mangling.   Don't drop 
packets in the nat table; drop them in the filter table.

2. If you start setting default policies of anything except ACCEPT in the nat 
or mangle tables, it's very easy to stop all traffic through your firewall, 
and spend some time scratching your head trying to figure out why, because 
there are no rules in the filter table causing the behaviour you observe.

 

Antony.

