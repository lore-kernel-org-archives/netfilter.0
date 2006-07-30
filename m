From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: no ssh on eth0
Date: Sun, 30 Jul 2006 14:37:22 +0200
Message-ID: <44CCA802.2090403@plouf.fr.eu.org>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>	<87fygje700.fsf@newton.gmurray.org.uk>
	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>
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

Hello,

Jan Engelhardt a =E9crit :
>>>
>>>I want to prevent ssh on eth0.
>>>
>>>Howto do it ?
>>
>>iptables -I INPUT -i eth0 -p tcp --dport 22 -j DROP

If the goal is to prevent *incoming* SSH connections on eth0.

> If
> 	eth0 10.0.0.1
> 	eth1 192.168.222.3
> then
> /etc/ssh/sshd_config:
>=20
> 	ListenAddress 192.168.222.3

This alone is not enough to prevent connections on eth0. You can connect=20
to any host address on any interface. E.g. connect to eth1 address on=20
eth0 interface and vice versa.

