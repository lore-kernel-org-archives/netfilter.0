From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: Gateway cluster using iptables and CLUSTERIP
Date: Fri, 31 Mar 2006 07:20:25 -0700
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125718@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Unfortunately setting nodes to 2 and having the node respond to both
dose not work either. I'm in the process of putting together a 2.6.16.1
kernel and getting the latest iptables compiled to see if it is a bug
that was fixed.

Robert LeBlanc
Brigham Young University

> -----Original Message-----
> From: KOVACS Krisztian [mailto:hidden@balabit.hu]
> Sent: Friday, March 31, 2006 2:55 AM
> To: netfilter@lists.netfilter.org
> Cc: Robert LeBlanc
> Subject: Re: Gateway cluster using iptables and CLUSTERIP
>=20
>=20
>   Hi,
>=20
> On Thursday 30 March 2006 18.31, Robert LeBlanc wrote:
> > iptables -A INPUT -I eth1 -d 10.0.0.1 -j CLUSTERIP -new -hashmode
> > sourceip -clustermac 01:83:91:A7:0D:33 -total-nodes 1 -local-nodes 1
> >
> > I have entered only one node in the cluster so that I would not have
to
> > bring up both nodes during the testing or remember to add the other
node
> > to /proc/net/ipt_CLUSTERIP/10.0.0.1.
>=20
>   Strange. Please note that apparently there are very few CLUSTERIP
users
> out there, so this might also be a bug. Does setting total-nodes to 2
> help?
>=20
> --
>  Regards,
>   Krisztian Kovacs


