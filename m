From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple question
Date: Wed, 5 May 2004 17:25:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051725.00610.Antony@Soft-Solutions.co.uk>
References: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
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

On Wednesday 05 May 2004 4:27 pm, Oriol Magran=E9 wrote:

>     Hello!
>     Just one question...
>     I have a firewall with the INPUT, OUTPUT and FORWARD policies set t=
o
> DROP, and now I want to allow connections from localhost to localhost (=
any
> port). Which chains are implied here? INPUT? OUTPUT? Both? How should t=
he
> needed rule(s) be?

Yes, you need to allow the packets out through OUTPUT, in through INPUT, =
and=20
the interfaces will both be lo.

If in doubt, just add some LOGging rules and see what happens when you tr=
y to=20
send packets.

Regards,

Antony.

--=20
Late in 1972 President Richard Nixon announced that the rate of increase =
of=20
inflation was decreasing.   This was the first time a sitting president u=
sed=20
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


