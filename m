From: "Jose Adalberto Gonzalez" <joseg@filanet.com>
Subject: Re: snat Invalid argument??? (urgent)
Date: Fri, 21 Feb 2003 08:47:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c2d9c8$fb43b400$5464a8c0@filanet.com>
References: <5.2.0.9.2.20030221093947.01c7efb0@172.26.0.8>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Cc: netfilter@lists.netfilter.org

Luis,

I have seen similar problems when iptables has not been compiled and
installed
correctly (The INSTALL files needs to be read carefully).  If your syntax is
correct
are you are running 1.2.7a on a linux system, are you booting the right
kernel that
you used to build iptables?  Some times this problem also happends because
the
target module has not been loaded from the library or the kernel.

Good luck,

Jose.



----- Original Message -----
From: "Luis Miguel Cruz Miranda" <luismi@b2bi.es>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 21, 2003 12:41 AM
Subject: snat Invalid argument??? (urgent)


I execute this line:

# iptables -t nat -A POSTROUTING -s 10.1.0.253 -o eth0 -j SNAT --to-source
194.149.216.62
iptables: Invalid argument

but it returns Invalid argument????
What is wrong here?


Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)




