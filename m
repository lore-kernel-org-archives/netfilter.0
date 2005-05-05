From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Delay in responding caused by netfilter ? [Completely Solved]
Date: Wed, 4 May 2005 20:29:21 -0400
Message-ID: <200505042029.22089.Alistair@nerdnet.ca>
References: <42721F84.6080503@mnemon.de> <4273031B.20009@riverviewtech.net>
	<4278B1B9.9040302@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278B1B9.9040302@mnemon.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On May 4, 2005 07:27 am, J=F6rg Harmuth wrote:
> Hi all,
>
> Taylor, Grant schrieb:
> > Rather than allowing ident would it be possible to do a REJECT (via
> > iptables -t filter -A OUTPUT -j REJECT) (I'm not sure if this can be a
> > policy or not) that way the ident will fail immediately verses timing
> > out?  That is if you don't want the ident to happen.  Seeing as how a
> > LOT of servers don't even support ident any more this might just as well
> > be an option.
>
> Which is what I did on one server (SuSE) and it solved the problem there.
>
> The other server was different in that the problem occured not always,
> only about 80% of all connections were affected and only POP3. The real
> solution can be found here:
>
> http://www.washington.edu/imap/IMAP-FAQs/index.html issue 7.24
>
> Quick summary. Mostly the cause is either reverse DNS request timing out
> or ident requests also timing out. The latter happens on systems running
> xinetd. In e.g /etc/xinetd.d/ipop3 are lines like
>
> log_on_success +=3D USERID
>
> These lines cause inetd to start an ident request. Delete all of these
> and similar lines in each file they occur, restart xinetd and the prolem
> is gone. No need to write rules :)


	Indeed would be the issue -- I'll not gloat -- but it comes from experienc=
e=20
at work with a mail server that was doing the same thing .. 'twas an identd=
=20
lookup that was waiting to time out when done through the firewall, but=20
responding normally any other time.  That happened to be a Cisco pix, but t=
he=20
cause and the symptom are the same.  Also why I didn't suggest the solution=
,=20
just the cause.

	Alistair Tonner
>
> Thanks to all providing ideas and pointing me to ident.

	Welcome, 'swat we all hereabouts for.

=09
>
> Have a nice time,
>
> Joerg

