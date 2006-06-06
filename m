From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: Is ip_conntrack_ftp needed for 1:1 nat?
Date: Tue, 6 Jun 2006 10:37:48 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE1257C1@q.LeBlancNet.us>
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
To: Alexandru Dragoi <alex@zoomnet.ro>
Cc: netfilter@lists.netfilter.org



> -----Original Message-----
> From: Alexandru Dragoi [mailto:alex@zoomnet.ro]
> Sent: Tuesday, June 06, 2006 10:16 AM
> To: Robert LeBlanc
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Is ip_conntrack_ftp needed for 1:1 nat?
>=20
> Robert LeBlanc wrote:
>=20
> >I have a gateway that is using iptables and I have several 1:1 NATs
> >configured. I am having trouble establishing an ftp session to my
remote
> >server. The gateway has a virtual adapter with the public IP address
and
> >I have SNAT and DNAT configured to forward all ports to the host.
What
> >do I need to get this working? I keep getting refused ports errors.
> >
> >Thanks,
> >Robert LeBlanc
> >
> >
> >
> # modprobe ip_nat_ftp
>=20
> You may also use iproute2 for nat, but it may not work.

Thanks Alexandru, works like a charm now. I just loaded the ip_nat_ftp
module and it works great. I didn't even have to mess with iproute2.

Robert LeBlanc

