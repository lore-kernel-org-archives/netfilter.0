From: netfilter@serverguy.net
Subject: Problem with SNAT and same port number
Date: Mon, 23 Feb 2004 13:30:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402231330.59035.netfilter@serverguy.net>
Reply-To: netfilter@serverguy.net
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am wanting to change the source address of outgoing packets that have a=
 src=20
port of 53.

I have tried=20
/sbin/iptables -A POSTROUTING -p tcp -t nat -o bond0 --sport 53 -j SNAT=20
--to-source 192.168.0.1:53

This doesnt work, it seems to be that you cant SNAT to a port the same as=
 the=20
original src port because

/sbin/iptables -A POSTROUTING -p tcp -t nat -o bond0 --sport 53 -j SNAT=20
--to-source 192.168.0.1

/sbin/iptables -A POSTROUTING -p tcp -t nat -o bond0 --sport 53 -j SNAT=20
--to-source 192.168.0.1:52

both works, but obviously not the same results as I wanted because the sr=
c=20
port is also changed.

Is there any other way to do what I am wanting??

TIA

