From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Troubleshooting Netfilter Firewall (performance issues)
Date: Fri, 4 Nov 2005 09:42:29 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132950@mailbox.vikus.com>
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
To: "Harrison, James" <james.harrison@americancolor.com>
Cc: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: Harrison, James [mailto:james.harrison@americancolor.com]=20
> Sent: Thursday, November 03, 2005 1:24 PM
> To: Derick Anderson
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Troubleshooting Netfilter Firewall (performance issues)
>=20
> On Thu, 2005-11-03 at 12:55 -0500, Derick Anderson wrote:
> [snip]
>=20
> >=20
> > If I were you I would monitor top during a large transfer=20
> and maybe do=20
> > an ethereal dump as well. If your two endpoint machines are both on=20
> > Gbit LAN and your firewall is 100Mbit (on a 100/1000 switch) then=20
> > perhaps your firewall NICs are getting overloaded. Every=20
> night at my=20
> > company all the servers (Gbit) back up to a local machine=20
> (100Mbit).=20
> > They each have their time window for backing up but it's common for=20
> > Nagios to report an "UNKNOWN" status for the backup server in the=20
> > early morning hours. Of course that could simply be the poor little=20
> > backup server not having the time to reply...
> >=20
> > Derick Anderson
>=20
> According to netstat -i I shouldn't be having issues with=20
> overloading the interfaces. (TX-ERR on eth0 and eth1 are=20
> static and have not
> incremented) I have 2/100MB and 2/1000MB interfaces.
>=20
> Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR=20
> TX-DRP TX-OVR Flg
> eth0   1500 0  50757220      0      0      050703586    523  =20
>    0      0 BMRU
> eth0:  1500 0       - no statistics available -              =20
>          BMRU
> eth1   1500 0  339989009      0      0      0397086634   3381=20
>      0      0 BMRU
> eth1:  1500 0       - no statistics available -              =20
>          BMRU
> eth2   1500 0  409181861      0      0      0344550753      0=20
>      0      0 BMRU
> eth3   1500 0  11352902      0      0      015003672      0  =20
>    0      0 BMRU
> eth3:  1500 0       - no statistics available -              =20
>          BMRU
>=20
> It is running on the Devil Linux distro.
>=20
> --
> James Harrison RHCE
> Manager, Information Security
> AIM: harrijh1

Unless Devil Linux has messed with your TCP/IP options in the kernel,
then I think it's time to look at the firewall. If you have an
abnormally high number of rules, this could be an issue, or if you're
rate-limiting anything...

Derick Anderson

