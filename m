From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 08:13:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617151309.68677.qmail@web14710.mail.yahoo.com>
References: <200406171323.25501.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406171323.25501.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter <netfilter@lists.netfilter.org>

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Thursday 17 June 2004 1:13 pm, Piszcz, Justin
> Michael wrote:
>=20
> > I think he meant, modprobe ip_conntrack_ftp and if
> you are behind nat
> > there is a module for that as well.
>=20
> insmod should do the job perfectly well.
>=20
> NAT is very unlikely when the rules are running on
> the FTP server itself=20
> (they're in the INPUT & OUTPUT chains).
>=20
Thanks very much for everybody's comments on this.=20

In my Linux kernel, the =93FTP protocol support=94 under
=93IP: Netfilter Configuration=94 is build into the
kernel. Therefore, there is no ip_conntrack_ftp module
to load.

I use Linux kernel 2.6.5, I don't use NAT and I use
iptables v1.2.10.

I noticed =93IP: kernel level autoconfiguration=94 was not
set. I just build that also in to the kernel,
recompiled, reinstalled the Linux kernel, rebuild all
modules and rebooted the server and retried the FTP
connection. But my problem is still the same.=20

For active FTP connections it drops the following
packet:
Jun 17 22:51:04 svr1 kernel: OUTPUT PKT DROPPED: IN=3D
OUT=3Deth0 SRC=3D[server IP addr] DST=3D[client IP addr]
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D33736 DF PROTO=3DTCP
SPT=3D20 DPT=3D32914 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

For passive FTP connections it drops the following
packet:
Jun 17 22:54:12 svr1 kernel: INPUT PKT DROPPED:
IN=3Deth0 OUT=3D
MAC=3D00:e0:29:34:b3:58:00:e0:29:34:bb:36:08:00
SRC=3D[client IP addr] DST=3D[server IP addr] LEN=3D60
TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D40886 DF PROTO=3DTCP
SPT=3D32916 DPT=3D32769 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

Is it necessary to build ip_conntrack_ftp as a module?


Sagara


=09
	=09
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail=20

