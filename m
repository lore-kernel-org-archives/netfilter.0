From: "Cassani Alexio" <alexio.cassani@bhuman.it>
Subject: RE: VPN Server behind a iptables FW (PPTP)
Date: Thu, 13 Mar 2003 13:01:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DBF92B7FA3E6C94A99B4AE5938A62B7E4023C4@excw2k01.bhlan.bhuman.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi Raymond,
> >=20
> > VPN Server Internal IP:192.168.0.1
> > VPN Server public IP (hosted by the firewall) is a global=20
> address. So=20
> > IPTables server performs NAT.
> How are you doinf NAT? Does the public ip get bound to an=20
> interface on the iptables server, e.g. eth0:1?
Yes I've configured all my global addresses on eth0 of the linux box,
the router cisco simply forward all the requests to it.

I've used your script but it doesn't work for me. The problem seems to
be the same, the VPN client reachs the tcp port of the vpn server (1723)
but then hangs for a few seconds and finally it stops showing up the
same error message ("721 remote computer is not responding").

The vpn server doesn't log anything of these attempt.

Maybe the problem could be at kernel level :|

Thanks,
Alexio

