From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Urgent Help needed.... please.
Date: Sat, 29 Mar 2003 09:59:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303290959.37528.kimj@dawn.dk>
References: <20030329080954.19290.qmail@web10808.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030329080954.19290.qmail@web10808.mail.yahoo.com>
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
To: steve@quartly.net, Steve Quartly <stevequartly@yahoo.com>, netfilter@lists.netfilter.org

Hi Steve,

If you have been hacked, then at least you have taken the necessary first=
 step=20
by shutting down, but it doesn't appear like you have cleaned your system=
 or=20
reinstalled it. I would do that before anything else, to ensure that I ha=
ve=20
_no_ bad dudes left on my machine. Then secondly, I would patch the serve=
r=20
with all relevant patches.

Secondly your script is very IP centric, all destinations for everything =
is=20
based on IP's, why don't you try to simply fy your script, so it only mee=
ts=20
your explicit demands. First of all, you could disallow packets from the=20
Internet to the INPUT chain and only accept FORWARD packets which are=20
related/established from inside.

Finally, if you have an immediate problem, try to make a script that rest=
arts=20
your Internet connection and put the firewall script into this, so your=20
firewall is being restarted as well.

Nomatter what, please give some ideas about your network setup - it will =
help=20
with understanding how we can help you.

/Kim

On Saturday 29 March 2003 09:09, Steve Quartly wrote:
> Hi,
>
> A week ago I put a dedicated server on the internet. 2
> days ago a hacker got into my system and caused many
> problems through a security flaw in the version of SSH
> I am running. Last night he tried again, however I
> locked the machine down so even I couldn't get into
> it, and he had no success.
>
> I have now changed over to giptables (which is great)
> but I have a few problems.
>
> If I connect to my server, run the firewall,
> everything is ok. I can look at webpages, SSH, etc
> from my home system. If I shutdown my home system, and
> re-dial to the net, the firewall blocks eveything! I
> can't even ping my server. My parents computer can't
> access my server either. This is very frustrating, can
> anybody please help me here. I suspect that DNS is
> being blocked?
>
> I have attached my firewall script.
>
> If anyone could give me some guidance I'd be very
> grateful.
>
> Thanks,
>
> Steve Q.
>
> http://mobile.yahoo.com.au - Yahoo! Mobile
> - Check & compose your email via SMS on your Telstra or Vodafone mobile=
=2E


