From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 17:34:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c3b9f5$fc81d8c0$0201a8c0@OurPC>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <200312032301.11900.Antony@Soft-Solutions.co.uk>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
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

I tried telnet from my WinXP machine to both open ports without any
responce.  I'm hosting neither services on this machine.  It will be a
gateway machine with a very minimal hardened installation.

Dave

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, December 03, 2003 5:01 PM
Subject: Re: open ports 25/tcp and 110/tcp


> On Wednesday 03 December 2003 10:46 pm, David F. Strauch wrote:
>
> > Hello All,
> >
> > I've been working with giptables firewall and have run into a big issue.
> > Although my script seems to be correct namp is finding ports 25/tcp and
> > 110/tcp open.  To start troubleshooting this problem I've commented
> > everything out and stripped down the ruleset to just the default DROP
> > policy.  Yet nmap -sT -F -P0 -0 xx.xx.xx.xx still returns 25/tcp and
> > 110/tcp as open!
> >
> > Now I'm starting to think that iptables is broken. I've built iptables
with
> > grsecurity-1.9.12 and iptables1.2.8 with a plain vanilla kernel 2.4.22
Is
> > anyone aware of any issues?
>
> Where are you testing from?
>
> Is there any chance (particularly with port 25) that the requests are
being
> redirected to some other server, and this is what is being reported as
open?
>
> Try doing "telnet xx.xx.xx.xx 25" and see what login banner you get for
the
> SMTP service - does this correspond to the machine you're testing, or any
> other machine you know about?
>
> Try the same thing on port 110 and see if that login banner reveals a clue
> either.
>
> Antony.
>
> -- 
> The idea that Bill Gates appeared like a knight in shining armour to lead
all
> customers out of a mire of technological chaos neatly ignores the fact
that
> it was he who, by peddling second-rate technology, led them into it in the
> first place.
>
>  - Douglas Adams in The Guardian, 25th August 1995
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>



