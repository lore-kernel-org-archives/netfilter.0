From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: RE: snat Invalid argument??? (urgent)
Date: Fri, 21 Feb 2003 11:28:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030221111803.01c99710@172.26.0.8>
References: <B848917C9D07D71199C5005004D778B8017B8C@TELECOMS04>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B848917C9D07D71199C5005004D778B8017B8C@TELECOMS04>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Eugene Joubert <eugenej@centratel.co.za>, netfilter@lists.netfilter.org

No there is no broken line at all, the borken line is beacuse of the eudo=
ra=20
mail client, sorry.
I search into google and the news at google without find the solution.

I am using redhat 7.3, kernel 2.4.20 patched with=20
patch-o-matic-20030218.tar, iptables is iptables-1.2.5-3 from the officia=
l rpm.

Is there any incompatibility between the patched kernel I have and the=20
iptables rpm?
Should I recompile the userspace programs?

At 10:58 21/02/2003 +0200, you wrote:

>Did you use this as is ...with a broken line. I tried your syntax in one=
=20
>line and got no errors.
>
>Try using it in one line....
>
>-----Original Message-----
>From: Luis Miguel Cruz Miranda [<mailto:luismi@b2bi.es>mailto:luismi@b2b=
i.es]
>Sent: 21 02 2003 10:41 AM
>To: netfilter@lists.netfilter.org
>Subject: snat Invalid argument??? (urgent)
>
>I execute this line:
>
># iptables -t nat -A POSTROUTING -s 10.1.0.253 -o eth0 -j SNAT --to-sour=
ce
>194.149.216.62
>iptables: Invalid argument
>
>but it returns Invalid argument????
>What is wrong here?
>
>Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
>CCNA - Systems Administrator            |       Pol. Ind. de Asipo
>                                          |       C/A - Parcela 86-C
>Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
>Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN=
)

Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



