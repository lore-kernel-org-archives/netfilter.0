From: Greg Cope <gregcope@gmail.com>
Subject: How to Get a DMZ hosts's trafic routed via a particular IP address
	on a firewall?
Date: Thu, 5 May 2005 17:31:54 +0100
Message-ID: <c0e9781f05050509315ff51a77@mail.gmail.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi all,

I have an iptables firewall that has 3 ethernet cards,
eth0(Red/internet) , eth1 (DMZ), eth2 (lan)

eth0 has a few alias;

eth0 (217.154.55.249) gateway
eth0:1 (217.154.55.250) for the mail server - an A record for mail.e-dba.ne=
t
eth0:2 (217.154.55.253) for a webserver
eth0:3 (217.154.55.245) another alias for a host on the DMZ

When sending trafic from this firewall host or any host behind it the
trafic leaves from eth0 (217.154.55.249).

The firewalls default gateway router is an ADLS ethernet modem on 217.154.5=
5.241

However mail (SMTP) trafic goes in via 217.154.55.250, and I would
like it to go out via 217.154.55.250 as this has the correct
(mail.e-dba.net) PTR records.

I have tried within my iptables script:

SMTP_MARK=3D2
echo 25 smtp.out >> /etc/iproute2/rt_tables
IPROUTE2_SMTP_TABLE=3D"smtp.out"
INET_IFACE=3D"eth0"
MAIL_INET_ALIAS=3D"217.154.55.250"1"

$IPTABLES -A PREROUTING -i eth0 -t mangle -p tcp --dport 25 -j MARK
--set-mark ${SMTP_MASK}
ip rule add fwmark $SMTP_MARK table $IPROUTE2_SMTP_TABLE

- All good so far

But the following seem to do the wrong thing.....

ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_ALIA=
S
ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP

What am I doing wrong.

If anyone knows of any howtos/tutorials to RTFM then please let me know.

Thanks

Greg

