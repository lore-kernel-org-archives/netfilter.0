From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: odd issues with connections to external websites
Date: Thu, 02 Nov 2006 12:55:38 +0100
Message-ID: <4549DCBA.405@plouf.fr.eu.org>
References: <Pine.LNX.4.64.0611021116410.4764@novak.ethosuk.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0611021116410.4764@novak.ethosuk.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Scott van Looy a =E9crit :
> Noticed this in the last month or so:
> When running my IPTables firewall I can't get to some websites, eg=20
> www.adobe.com or jdl.sun.com
> when I disable IPTables I can
>=20
> Anyone got any ideas as to why this could be the case?

www.adobe.com -> www.wip3.adobe.com -> 192.150.20.61
jdl.sun.com -> 192.18.97.144

Both addresses start with 192. My guess is you have some rule intended=20
to filter out the private range 192.168.0.0/16 but with a wrong=20
mask/prefix length.

