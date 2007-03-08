From: Eric Leblond <eleblond@inl.fr>
Subject: Re: nfnetlinkf ctnetlink ct-event
Date: Thu, 08 Mar 2007 21:19:44 +0100
Message-ID: <1173385184.23222.27.camel@localhost>
References: <009801c7619e$dff4adf0$7100000a@W2KMPLOURDE>
	<00a801c761ba$08ab8be0$7100000a@W2KMPLOURDE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00a801c761ba$08ab8be0$7100000a@W2KMPLOURDE>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Plourde <mplourde@digicom.ca>
Cc: netfilter@lists.netfilter.org

Hi,

Le jeudi 08 mars 2007 =E0 14:43 -0500, Michael Plourde a =E9crit :
> If i can patch my 2.4 kernel, is there a way to manage conntrack ?
> (Other way than rmmod , insmod to flush all)

Not really, you can only read /proc/net/ip_conntrack. One tool you can
use is tcpkill available in dsniff. It can be used to kill some tcp
connections by sending a TCP RST packet.

> ----- Original Message -----=20
> From: "Michael Plourde" <mplourde@digicom.ca>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, March 08, 2007 11:28 AM
> Subject: nfnetlinkf ctnetlink ct-event
>=20
>=20
> > Hi,
> >=20
> > i want to patch my kernel 2.4.25 to use conntrack-1.00.=20
> > Could someone give me tips and URL to get those patchs?=20
> >=20
> > Thanks,

Cordialement,
--=20
Eric Leblond <eleblond@inl.fr>
INL


