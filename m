From: Bent Mathiesen <bent@oriad.net>
Subject: Re: Is Linux IPTABLES firewall comparable with license Firewall
Date: Mon, 20 Oct 2003 03:00:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310200300.12689.bent@oriad.net>
References: <20031018091807.26000.qmail@web20711.mail.yahoo.com> <3F932E05.6040307@taxandfinance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F932E05.6040307@taxandfinance.com>
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
To: Matt Hellman <netfilter@taxandfinance.com>, ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

I would say that only one thing come in mind for commercial solutions:

I work in an enterprise business, there we use sunscreens, checkpoint ver=
sion=20
4-NG(FP3)+prover-1, Pix, ipchains, etc.

For checkpoint, it is the resent gui version, that enable to look into de=
tails=20
of a larger rulesbase (N*100 customer base). However, I would say, that t=
he=20
quality/stability of the gui software itself is --- at the same level at =
it=20
always have been....

The second, and most important, is options for HA (high awailabillity).


However, I do not think the quality of the software and hardware from=20
top-vendors is that good. I can give plenty of examples of checkpoint=20
software/fw problems and hardware failure of Cisco.

And we have used ipchains for years to protect Checkpoint boxes!!
(the hardware is old pc stuff and have been the most stable of it all).

(I would use iptables and PF more if possible - however, as an enterprise=
, you=20
have to have the right names on the official papers).


The above is my personal observation and oppinions and not those of the=20
company I work for.


Best regards

  Bent Mathiesen



On Monday 20 October 2003 02:36, Matt Hellman wrote:
> ads nat wrote:
> > Hi,
> > I don't know whether this is right list for my
> > question.
> >
> > I am facing basic problem while convincing to users. I
> > have implemented IPTABLES firewall on my Linux 8.0
> > server. I am frequently asked by users which
> > firewall/security measures are taken for my network.
> > My competitors use Checkpoint Firewall.
> > Can somebody guide me how to convince my users that
> > Linux IPTABLES Firewall is technically at par with
> > commercial Firewall such as checkpoint.
> >
> > Also if same security policies are adopted for
> > IPTABLES and checkpoint, Is IPTABLES technically at
> > par with commercial FIREWALLs?
> >
> > Thanks
> >
> >
> >
> >
> > __________________________________
> > Do you Yahoo!?
> > The New Yahoo! Shopping - with improved product search
> > http://shopping.yahoo.com
>
> netfilter is best suited for configurations in small to medium
> enteriprises IMHO (it is also an excellent host based firewall).
> Commerial firewalls have significant advantages...they come out of the
> box with top-notch gui management capabilities, fail-over, vpn and
> application-level services which support multiple authentication
> sources.  Some of this can be accomplished on a netfilter box, but not
> without significant effort to configure and maintain.
>
> The greatest advantage netfilter has is that it runs on a Linux box
> which gives it a tremendous amount of flexibility.  You can do some
> things on a Linux box that you wouldn't dream of on a commercial
> firewall. Of course, some see this as a distinct disadvantage compared
> to an appliance;-)
>
> Anymore, I'm having a tough time recommending a PC running Linux versus
> some of the entry level commercial firewalls, like a Pix, that can be
> had for under $1000, if for no other reason that it will be FAR less
> likely to have a hardware failure. If you're customers aren't
> satifisfied with your using netfilter on Linux, buy an inexpensive cisc=
o
> Pix...I'm sure the name "Cisco" will impress them;-)
>
> Goodluck,
> Matt

--=20
Bent Mathiesen

bent@oriad.net



