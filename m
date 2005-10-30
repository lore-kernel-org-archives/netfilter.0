From: Patrick McHardy <kaber@trash.net>
Subject: Re: pppoe with NAT not working
Date: Sun, 30 Oct 2005 16:30:58 +0100
Message-ID: <4364E732.30809@trash.net>
References: <23027.::ffff:195.115.41.103.1129902602.squirrel@webmail.nerim.net>
	<435921A7.6050703@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-bounces@lists.netfilter.org>
In-Reply-To: <435921A7.6050703@nerim.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter-devel>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-devel-bounces@lists.netfilter.org
Errors-To: netfilter-devel-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <sbernard@nerim.net>
Cc: netfilter-devel@lists.netfilter.org, netfilter@lists.netfilter.org

S=E9bastien Bernard wrote:

> I figured out the problem.
>=20
> NAT is not working with the rp-pppoe.so plugin.
> I moved back to the
>=20
> pty "/usr/sbin/pppoe -I eth0 -T 80 -m 1452"
>=20
> Which worked now (go figure...).
> And NAT is working again.
>=20
> Any reason for this ?

We had a report about NAT failing to work in a similar situation
with HW checksums, but I couldn't find the reason. You could try:

- check if you have HW checksums enabled on the eth-device using
   ethtool
- enable conntrack logging by loading ipt_LOG and executing
   "echo 255 >/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid".
- if this shows something about invalid checksums, disable HW
   checksumming on the eth-device and try again

