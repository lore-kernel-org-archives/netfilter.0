From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 13:04:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E895155@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Yup.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Thursday, June 17, 2004 12:52 PM
To: netfilter@lists.netfilter.org
Subject: Re: Allow active and passive FTP connections

On Thursday 17 June 2004 5:41 pm, Sagara Wijetunga wrote:

> <justin.piszcz@mitretek.org> wrote:
> > Is it necessary to build ip_conntrack_ftp as a
> > module?
> > If you want to do ports other than 21 on 2.4, yes,
> > on 2.6, no, you can
> > use the append=3D"" option in LILO.
>
> Could you elaborate this a bit? I use Linux kernel
> 2.6.5 and ip_conntrack_ftp is compiled into the
> kernel. Do I still have to pass a append=3D"" option to
> kernel at LILO?

Only if you want to connect to a non-standard port number (ie: other
than 21)

Regards,

Antony.

--=20
This email is intended for the use of the individual addressee(s) named
above=20
and may contain information that is confidential, privileged or
unsuitable=20
for overly sensitive persons with low self-esteem, no sense of humour,
or=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar.   Whisk until soft peaks form, then place in a warm oven
for 40=20
minutes.   Remove promptly and let stand for 2 hours before adding some=20
decorative kiwi fruit and cream.   Then notify me immediately by return
email=20
and eat the original message.

                                                     Please reply to the
list;
                                                           please don't
CC me.





