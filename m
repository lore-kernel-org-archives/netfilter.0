From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie question about nat
Date: Tue, 4 May 2004 17:43:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405041743.01688.Antony@Soft-Solutions.co.uk>
References: <004901c42edf$c73c77b0$a704a8c0@mpro4167> <200405031654.14566.Antony@Soft-Solutions.co.uk> <001401c431f0$3c172b80$a704a8c0@mpro4167>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c431f0$3c172b80$a704a8c0@mpro4167>
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

On Tuesday 04 May 2004 4:55 pm, Oriol Magran=E9 wrote:

>     Thank you very much!! It works perfectly!! :-)
>
>     And now one last question: from a security point of view, what do y=
ou
> think is better; discarding packets with DROP or with REJECT?

I tend to DROP to the outside world (don't let them know there's an=20
intelligent system dropping their packets - just let them think they fell=
 off=20
the end of a cable somewhere), and REJECT to my internal users (so they g=
et a=20
quick response saying "that website cannot be found" or "remote host clos=
ed=20
connection" or whatever, and they don't spend ages waiting for a timeout =
when=20
they could be getting on with something more useful).

Regards,

Antony.

--=20
It is also possible that putting the birds in a laboratory setting=20
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


