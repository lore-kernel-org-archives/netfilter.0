From: Svein.Fossaen@hydro.com
Subject: mark all packages from a spesific host
Date: Wed, 30 Oct 2002 09:26:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF88152DB3.ECF3E686-ON41256C62.002DF7E2@hda.hydro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I've just started to look into traffic shaping and have the following
environment.


ISP--------eth1-LINUX-eth0----------intranet

I want to mark all traffic coming from host 192.168.0.19 so that i can =
pick
up these packages and filter them before sending out on eth1/ppp0

I've tried things like:

/usr/sbin/iptables -A POSTROUTING -t mangle -s 192.168.0.19 -p tcp \
-o eth0 -j MARK --set-mark 12

/usr/sbin/tc filter add dev eth1 protocol ip parent 1:1 prio 100 \
handle 12 fw classid 1:3

but this dosn't seem to work.....what's am I doing wrong or don't
understand?

-Svein Foss=E5en-
-----------------------------------------------------------------------=
------------------------

This is Unix land.
In quiet nights you can hear ms-windows machines reboot.=



