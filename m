From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Limit Bandwith
Date: Mon, 12 Apr 2004 16:43:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404121643.20591.Antony@Soft-Solutions.co.uk>
References: <00e801c420a0$b4ea32c0$a8db13ac@gesej.ciasc.gov.br>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00e801c420a0$b4ea32c0$a8db13ac@gesej.ciasc.gov.br>
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

On Monday 12 April 2004 4:13 pm, cron@odi.com.br wrote:

> Hello All,
>
> I=B4m new to iptables and also to the list.
>
> I have a linux box with 1 mb internet connection with is the host for s=
ome
> sites and some email and is also the gateway to 5 pcs with fake ip adre=
ss
> just to provide acess to the internet.
>
> Nat is woking  fine but would be very nice to limit the bandwith to the
> lan. I have no clue where to start. Perhaps someone could anser some
> questions?
>
> Does iptables limit bandwith?

Not really, no - it's more of an "all or nothing" filtering mechanism - e=
ither=20
you decide to allow something, or you decide not to (with certain specifi=
c=20
exceptions such as SYN packet rate limiting for flood protection).

> Any good howto about iptables/bandwith?

Check out http://lartc.org - that will do what you need.

Regards,

Antony.

--=20
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later cons=
umed=20
by Compaq, later consumed by HP)

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


