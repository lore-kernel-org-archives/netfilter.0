From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: binding nntp to one interface
Date: Thu, 12 Sep 2002 13:55:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20020912135158.0265ece8@of23sm3>
References: <5.1.0.14.2.20020912090056.012e6d48@linda>
 <5.1.0.14.2.20020912131043.02711d58@of23sm3>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D807FA6.7040404@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Anders Fugmann <afu@fugmann.dhs.org>, netfilter@lists.netfilter.org

almost

insmod /lib/modules/2.4.19-pre9/kernel/net/ipv4/netfilter/iptable_mangle.o
iptables -t mangle -A PREROUTING -d news.isp.dk -j MARK --set-mark 1
iptables -t mangle -A OUTPUT -d news.isp.dk -j MARK --set-mark 1

for the iptables marking and

echo 203 table1.out >> /etc/iproute2/rt_tables
echo 204 table2.out >> /etc/iproute2/rt_tables
ip rule add fwmark 1 table table1.out
ip rule add fwmark 2 table table2.out

ip route add default via <gateway1> dev ppp0 table table1.out
ip route add default via <gateway2> dev eth2 table table2.out

for iproute2

and it all work like a beuty

Thanks again

Rasmus

At 13:51 12-09-2002 +0200, Anders Fugmann wrote:
>Rasmus Reinholdt Nielsen wrote:
>>thanks a lot
>>it seams like its working now
>Perfect. Glad I could help.
>Just to be sure, was all the steps I gave you correct?
>
>Regards
>Anders Fugmann
>
>--
>Neo: 'Can you fly that thing?'
>Trinity: 'Not yet'.
>$ apt-get install pilot-prg-v212helicopter.


