From: "Mario Antonio" <dino@webjogger.net>
Subject: Re: alias interfaces
Date: Sat, 19 Oct 2002 15:08:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <052201c277a2$eeaa7130$13c01dd0@shadowfax>
References: <044c01c276ff$c3d06df0$13c01dd0@shadowfax> <20021019080539.UUYW28004.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Antony,

Thanks for your feedback and patience.
Things are working nicely now.

Regards  ( By the way, I enjoy your sayings in your emails)

Mario


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, October 19, 2002 4:05 AM
Subject: Re: alias interfaces


> On Saturday 19 October 2002 12:40 am, Mario Antonio wrote:
>
> > Antony,
> >
> > Thanks again for your kindness.
> >
> > I was also doubting about routing problems, but why when I accept all
the
> > traffic in the INPUT chain, everything works fine?
>
> I can't say, but your netmask / routing table is the problem.
>
> > Linux 7.3 and iptables v1.2.7a
> > eth0=10.10.10.239
> > eth0:0=10.10.13.227
> >  workstation accessing the server: 10.10.10.19 netmask 255.255.255.0
>
> This is a Class C netmask.   All machines on the local network must have
> 10.10.10 as the first three bytes of the address.   You are trying to
contact
> address 10.10.13.227, which is on a different network.
>
> Change the aliased address so that it is on the 10.10.10.0 network, or
change
> your netmask so you have at least a Class B subnet.
>
> Antony
>
> --
>
> KDE 3.0.3 contains an important fix for handling SSL certificates.  Users
of
> Internet Explorer, which suffers from the same problem but which
> does not yet have a fix available, are also encouraged to switch to KDE
3.0.3.
>
> http://www.kde.org/announcements/announce-3.0.3.html
>
> ---
> [This e-mail was scanned for viruses by Webjogger's AntiVirus Protection
System]
>
>

---
[This e-mail was scanned for viruses by Webjogger's AntiVirus Protection System]


