From: "Wyburn, Marc Anil" <Marc.Wyburn@gb.unisys.com>
Subject: XP DNS requests
Date: Mon, 14 Jun 2004 14:25:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E9E5BFC4DD34D511B79900104B939D780325D27D@GB-CSC-EXCH-8>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

This problem has go tme stumped!!!!  I have netfilter setup (v 1.2.8.13) =
on a Fedora Core 1 box.  It seems to be working fine except that I it is =
dropping DNS requesets from XP clients.  Win2K and NT clients work fine. =
 If I do an NSlookup on the XP box it resolves names fine.  If I try to =
connect ot the pages it will connect once or twice but then iptables =
starts dropping all the DNS requests on their way out.  Heres a syslog =
entry.

Jun	14	10:00:31	fw	kernel:	IN=3Deth1	OUT=3D	eth0 SRC=3D192.168.0.19 =
DST=3D***.***.***.*** LEN=3D61	TOS=3D0x00 PREC=3D0x00 TTL=3D127 =
ID=3D26601 PROTO=3DUDP SPT=3D1029 DPT=3D53 LEN=3D41=09

I don't think that iptables is the problem since every other PC works =
fine.  I've even looked at the packets in Ethereal but can't work out =
why this is happening. Has anyone else come across this??

Cheers for any help Marc.

