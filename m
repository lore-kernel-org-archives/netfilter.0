From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Blocking programs with IPtables
Date: Fri, 30 Jul 2004 16:12:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407301612.38554.Antony@Soft-Solutions.co.uk>
References: <267354A234DF4D46AA6AE56E1240BEF004A3C4@wcsls03.wcslnet.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <267354A234DF4D46AA6AE56E1240BEF004A3C4@wcsls03.wcslnet.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 30 July 2004 4:04 pm, Steve Wakelin wrote:

> Easiest way is to setup your IMAP server on a different port other than=
 143
> and then configure Thunderbird to use that port.  Disable access to 143.

Except that Leonardo obviously doesn't trust his users not to surreptitio=
usly=20
continue using Outlook when they've been told to use Thunderbird - so he=20
doesn't trust them not to configure Outlook to connect to the same port t=
hat=20
Thunderbird connects to.

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: 30 July 2004 15:48
> To: netfilter@lists.netfilter.org
> Subject: Re: Blocking programs with IPtables
>
> On Friday 30 July 2004 3:38 pm, Leonardo Teves wrote:
> > Hi,
> > I=B4m new in this forum, and i have a little question.
> > Is there a way to block some programs with Iptables?
> > I want to block Microsoft Outlook recovering mail from Imap server.
> > I want to force all users to use Thunderbird as mail client without
> > deinstalling Outlook from every workstation.
> > Is my question clear?
> > Any ideas?
>
> Your question is clear.
>
> This cannot be done with netfilter (because all imap connections look t=
he
> same to netfilter, no matter what client or server software is being us=
ed)
>
> I cannot think of another way to do it either, because I would be surpr=
ised
> if Outlook sent anything in its connect message to identify itself as
> Outlook (the server end of a connection often does, but the client end
> usually doesn't, except for web browsers).
>
> Sorry - but perhaps someone else here can prove me wrong?
>
> Regards,
>
> Antony.

--=20
"Linux is going to be part of the future. It's going to be like Unix was.=
"

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


