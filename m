From: Thomas Kirk <thomas@arkena.com>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Thu, 26 Aug 2004 11:13:28 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040826091328.GD18545@arkena.dk>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
	<1093339912.2050.208.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1093339912.2050.208.camel@localhost>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org, Roksana Boreli <Roksana.Boreli@nicta.com.au>

Hi

On Tue, Aug 24, 2004 at 05:31:52AM -0400, John A. Sullivan III wrote:

> The answer depends on what exactly you are trying to do.  If you are
> branching together two networks, you may wish to consider moving the
> IPSec stack to the Linux gateway and creating a LAN-to-LAN connection.=20
> If you wish to restrict access to just those few clients, you can make
> such restrictions in iptables.

Excusing me for interrupting the discussion but in a situation where i
would like to make a LAN-to-LAN IPsec VPN between to offices both
running iptables on the gateways. Ive been lurking on the liste for
some time but i have a few questions regarding this. First each site
have a link to internet howto specify which protocols that should go
over VPN and which should go to internet? Which IPsec implementation
would be the most stable and secure solution to use. Currently im
using a couple of retired pcworkstations running debian woody so i
would prefer something that is supported by debian but its not
absolutly neccessary :)

Thanks in advance

--=20
Venlig Hilsen/Kind Regards
Thomas Kirk
IT-chef
ARKENA A/S

Mejlgade 27-29, DK-8000 Aarhus C
Havnegade 39, DK-1058 K=F8benhavn K

Telephone Direct: +45 8620 4264
Telephone Office: +45 7023 3456
Telephone Mobile: +45 2612 3237

Office FAX: +45 8620 4270
WWW: http://www.arkena.com
--

"I've always wondered if there was a god. And now I know there is --
and it's me." -- Homer Simpson


