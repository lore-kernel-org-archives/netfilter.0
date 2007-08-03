From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables rules processing
Date: Fri, 03 Aug 2007 22:03:57 +0200
Message-ID: <46B38A2D.2030204@plouf.fr.eu.org>
References: <20070803170735.GC7815@sid.toystory.lan>	<001b01c7d5f4$91781110$0101000a@tanjian>	<20070803174410.GA11029@sid.toystory.lan>
	<46B38221.2070108@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B38221.2070108@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Grant Taylor a =E9crit :
>=20
> The IPTables rules you have posted do not do it, though I think you
> could use a mport match to accomplish what you are wanting to do.  I.e.=
:

Don't you mean the 'multiport' match ? The 'mport' match was never=20
included in the vanilla kernel, is now deprecated and has been removed=20
from the latest iptables release (1.3.8).

