From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT-HOWTO erreta?
Date: Wed, 7 Jan 2004 09:33:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401070933.41806.Antony@Soft-Solutions.co.uk>
References: <20040105223333.GA27409@hbsn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040105223333.GA27409@hbsn.de>
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
To: netfilter@lists.samba.org

On Monday 05 January 2004 10:33 pm, Tobias Hintze wrote:

> hi,
>
> i think i just noticed a mistake in your NAT-howto...
> (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html)
>
> section 5.2 Finer Points Of Selecting What Packets To Mangle
>
> 4th paragraph:
>
> "These options must follow the `-p' option (which has a side-effect of
> loading the shared library extension for that protocol). You can use
> port numbers, or a name from the /etc/services file."
>
> we talk about protocols here. not ports! so /etc/protocols is the right
> reference not /etc/services.

No, /etc/services is correct.

What the phrase you have quoted is saying is "These options must follow t=
he=20
'-p' option [which specifies which protocol is in use, eg -p tcp, -p udp =
etc]=20
(which has a side-effect of loading the shared library extension for that=
=20
protocol).   [It is this shared library extension which allows the furthe=
r=20
specification of port numbers; without it, you cannot specify a port numb=
er]  =20
You can use port number, or a name from the /etc/services file [as an=20
argument to the --sport or --dport options]."

You are correct in thinking that after -p you can use a protocol number o=
r a=20
name from /etc/protocols, however the above paragraph is talking about=20
--sport and --dport as referenced in the preceding two paragraphs of sect=
ion=20
5.2.

Hope this clarifies things,

Antony.

--=20
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


