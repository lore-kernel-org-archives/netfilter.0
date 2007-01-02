From: "epankala@cc.hut.fi" <epankala@cc.hut.fi>
Subject: xtables monitoring via NETLINK (or similar)
Date: Tue, 02 Jan 2007 20:04:34 +0200
Message-ID: <459A9EB2.1000809@cc.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


I have been looking into how kernel supplies userspace with what is
happening inside kernel via NETLINK socket and how udevd->hald->dbus->use=
r
benefits from it.
(NETLINK_ROUTE protocol reports for example interface up/down events
and KOBJECT report device add/remove && insmod/rmmod events)


I was wondering is there a way to monitor iptables (xtables)
replace_table/(un)register_target/...  events somehow.
(could not see it in kernel code but that doesn't mean it's not there.
NETLINK_FIREWALL seems to be about queuing packets to userspace)

Main incentive for me is that it would be better to listen for a socket=20
than
poll for firewall changes manually.

If such does not exist would there be intrest to add such capability.
I could volunteer to do bit of design/implementation if such feature=20
would be welcomed.

--=20
Janne (orshouldthisgotonetfilter-devel) P=E4nk=E4l=E4


