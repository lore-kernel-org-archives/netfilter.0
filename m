From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Fwd: multiple DNAT alternative?
Date: Sat, 25 Nov 2006 17:03:59 +0100
Message-ID: <4568696F.2060307@plouf.fr.eu.org>
References: <f5e96a3c0611200306x1edc99f1hb848246cd48634e1@mail.gmail.com>
	<f5e96a3c0611200307y6dfc367fr574ced2a39f6d739@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f5e96a3c0611200307y6dfc367fr574ced2a39f6d739@mail.gmail.com>
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

Noman Jamil a =E9crit :
>=20
> Is there any alternative of multiple DNAT's  which is been droped in
> the latest kernels or after 2.6.10.x kernel tree. All i want to do is,
> traffic meant for a particular internal IP should be forward to
> multiple destinations not as load balacing but as per the connection
> tracking. Blow are the desired command of DNAT.
>=20
> iptables -t nat -A PREROUTING -p udp -s 0/0 -d 10.0.2.107 -j DNAT
> --to 202.125.136.60-202.125.136.70
>  (This command is fine and it works too, but i want to do is  not to
> load balance between the ips but to pick up the ip for which data is
> meant for)

I don't understand what you mean with "load balancing" and "pick up the=20
ip for which data is meant for". NAT is always based on connection=20
tracking and applies to a whole connection.

> iptables -t nat -A PREROUTING -p udp -s 0/0 -d 10.0.2.107 -j DNAT
> --to-destination 202.125.136.60 --to-destination 194.202.94.1
> (Any alternative for this command which is depricited after 2.6.10
> kernel tree.)

You can replace this rule with multiple rules, each with one --to=20
option, in combination with the nth, random or statistic match. The nth=20
and random matches are provided by the patch-o-matic-ng up to=20
patch-o-matic-ng-20060511. The statistic match is included in kernel=20
2.6.18 and requires iptables 1.3.6 at least.

