From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: Re: snat Invalid argument??? (urgent)
Date: Fri, 21 Feb 2003 13:21:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030221131220.01cb42c0@172.26.0.8>
References: <5.2.0.9.2.20030221111803.01c99710@172.26.0.8>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E560538.3040303@gmx.de>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

Hummmm.
I use cvs code but I can use the userspace patches :/ and I need them :/
Any idea?

At 11:53 21/02/2003 +0100, Sven Schuster wrote:
>Luis Miguel Cruz Miranda wrote:
>
>>No there is no broken line at all, the borken line is beacuse of the=20
>>eudora mail client, sorry.
>>I search into google and the news at google without find the solution.
>>
>>I am using redhat 7.3, kernel 2.4.20 patched with=20
>>patch-o-matic-20030218.tar, iptables is iptables-1.2.5-3 from the offic=
ial rpm.
>>
>>Is there any incompatibility between the patched kernel I have and the=20
>>iptables rpm?
>>Should I recompile the userspace programs?
>
>
>Yes I think this is your problem. Just get iptables v1.2.7a source code=20
>(or the latest CVS)
>and compile it again. Everything should work fine after that.
>
>Sven

Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



