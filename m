From: "kenn murrah" <kenn@thebytebusiness.com>
Subject: Re: newbie question about port blocking
Date: Thu, 17 Apr 2003 09:33:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004701c304ee$4176fb30$2d64a8c0@murrahboy>
References: <003901c304e8$24b56fa0$2d64a8c0@murrahboy> <200304171622.51239.kimj@dawn.dk>
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

Thanks, Kim.  I'll try that ...

BTW, i *AM* using squid, and my iptables already includes:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

so, will the setup you describe be the only thing i need to add in order to
block non-http ports?

Thanks again,

Kenn



----- Original Message -----
From: "Kim Jensen" <kimj@dawn.dk>
To: "kenn murrah" <kenn@thebytebusiness.com>;
<netfilter@lists.netfilter.org>
Sent: Thursday, April 17, 2003 9:22 AM
Subject: Re: newbie question about port blocking


> Hi Kenn,
>
> A simple setup will be something like this:
>
> iptables -i lo -j ACCEPT
> iptables -p tcp --dport 80 -j ACCEPT
> iptables -j DROP
>
> If you are using a transparent proxy, ala Squid, you may have to add some
more
> rules.
>
> /Kim
>
> On Thursday 17 April 2003 15:49, kenn murrah wrote:
> > Sorry for the elementary nature of this question ... I've just installed
> > linux and have a transparent proxy working using iptables ... but my
goal
> > is to block ALL non-http traffic in both directions ... that is, i want
to
> > allow web access but no instant messenging, no ftp, etc.
> >
> > is there a simple line or two that i can add to iptables?  please feel
free
> > to tell me to RTFM, but the tutorial i just downloaded is 151 pages, and
i
> > admit that i'm looking for a fast solution this morning ... (i'll study
the
> > manual on the way home tonight on the train -- i promise!)
> >
> > can anyone help me out?  all advice MOST appreciated.
>
>


