From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Blocking programs with IPtables
Date: Fri, 30 Jul 2004 15:48:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407301548.04847.Antony@Soft-Solutions.co.uk>
References: <410A5D82.4050109@alimentos-granix.com.ar>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410A5D82.4050109@alimentos-granix.com.ar>
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

On Friday 30 July 2004 3:38 pm, Leonardo Teves wrote:

> Hi,
> I=B4m new in this forum, and i have a little question.
> Is there a way to block some programs with Iptables?
> I want to block Microsoft Outlook recovering mail from Imap server.
> I want to force all users to use Thunderbird as mail client without
> deinstalling Outlook from every workstation.
> Is my question clear?
> Any ideas?

Your question is clear.

This cannot be done with netfilter (because all imap connections look the=
 same=20
to netfilter, no matter what client or server software is being used)

I cannot think of another way to do it either, because I would be surpris=
ed if=20
Outlook sent anything in its connect message to identify itself as Outloo=
k=20
(the server end of a connection often does, but the client end usually=20
doesn't, except for web browsers).

Sorry - but perhaps someone else here can prove me wrong?

Regards,

Antony.

--=20
Microsoft may sell more software than any other company, but McDonald's s=
ell=20
more burgers than any other company, and I think the other similarities a=
re=20
obvious...

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


