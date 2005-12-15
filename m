From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: help on load balancing
Date: Thu, 15 Dec 2005 15:20:16 +0100
Message-ID: <19404.8965852291$1134656611@news.gmane.org>
References: <43A179BF.1000102@artcom.pl>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A179BF.1000102@artcom.pl>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

But with this solution it is possible to let https only through one
specially chosen squid - right?

Regards,

Edvin

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pawel =
Staszewski
Sent: Donnerstag, 15. Dezember 2005 15:12
To: wlagmay@yanbulink.net; netfilter@lists.netfilter.org
Subject: Re: help on load balancing

Try do install 3 squid instances and on every squid.conf insert=20
different tcp_outgoind_address of your dsl links


Next try to balance per tcp(80) session  to all  squid instances:

$ipt -t nat -A squid -p tcp --dport 80 -m nth --counter 7 --every 3=20
--packet 0 -j DNAT --to 192.168.0.1:8080
$ipt -t nat -A squid -p tcp --dport 80 -m nth --counter 7 --every 3=20
--packet 1 -j DNAT --to 192.168.0.1:8081
$ipt -t nat -A squid -p tcp --dport 80 -m nth --counter 7 --every 3=20
--packet 2 -j DNAT --to 192.168.0.1:8082

$ipt -t nat -A PREROUTING -i eth4 -s 10.0.0.0/8 -p tcp --dport 80 -m=20
state --state NEW -j squid

the: "-m state --state NEW" param is important ... because you must=20
balance over "tcp session" not "per packet"

But with this configuration some sites will have problems to load like=20
https ... because source of your ip will be change from dsl 1 to dsl 2=20
and dsl 3





wlagmay@yanbulink.net wrote:

>I'm already using http://www.ssi.bg/~ja, this is from Julian Anatasov
right, but
>my problem here, in most of the cases it needs to fully utilized the =
1st
lint
>prior to shifting to the second link.
>
>Regards,
>
>Wennie
>
>Quoting Pawe=C5=82 Staszewski <pstaszewski@artcom.pl>:
>
> =20
>
>>You can't do load balance across 4 dsl link "per packet" ....
>>Only per session.
>>
>>If your isp is doing reverse path filtering .
>>
>>
>>Try routes patch from : http://www.ssi.bg/~ja/
>>
>>And it will be working fine :)
>>
>>
>>Rob Sterenborg wrote:
>>
>>   =20
>>
>>>On Thu, December 15, 2005 14:21, wlagmay@yanbulink.net wrote:
>>>
>>>
>>>     =20
>>>
>>>>Hi Rob,
>>>>
>>>>Im sorry, I forgot to inform you that the clients are not using this
>>>>3 lines to go directly to the internet, instead the on the same
>>>>machine I install Squid proxy server, hoping that with the load
>>>>balance technique, squid can take advantage of the connection
>>>>simultaneously, so my problem actualy is the squid
>>>>to use the 3 lines simutaneously.
>>>>
>>>>
>>>>       =20
>>>>
>>>I haven't used it myself so I'm a bit guessing here ; you may be able
>>>to alter locally generated packets (from Squid) using the ROUTE =
target
>>>combined with the nth match in the OUTPUT chain of the mangle table =
so
>>>the packets are diverted over the 3 NIC's.
>>>
>>>Something like :
>>>
>>>iptables -t mangle -A OUTPUT -o eth0 -m nth --counter 7 \
>>> --every 3 --packet 0 -j ROUTE --oif eth0
>>>
>>>iptables -t mangle -A OUTPUT -o eth0 -m nth --counter 7 \
>>> --every 3 --packet 1 -j ROUTE --oif eth1
>>>
>>>iptables -t mangle -A OUTPUT -o eth0 -m nth --counter 7 \
>>> --every 3 --packet 2 -j ROUTE --oif eth2
>>>
>>>(Where eth3 is your LAN NIC.)
>>>
>>>
>>>Gr,
>>>Rob
>>>
>>>
>>>
>>>
>>>     =20
>>>
>>>>Quoting Rob Sterenborg <rob@sterenborg.info>:
>>>>
>>>>
>>>>
>>>>       =20
>>>>
>>>>>On Thu, December 15, 2005 12:32, wlagmay@yanbulink.net wrote:
>>>>>...
>>>>>
>>>>>
>>>>>         =20
>>>>>
>>>>>>Squid proxy, Im monitoring the 4 ports via MRTG and I noticed that
>>>>>>before It goes to link 2, link 1 must be saturated first or link1
>>>>>>will stop and the request is only transfered to link 2. So it
>>>>>>
>>>>>>
>>>>>>           =20
>>>>>>
>>>>>seems
>>>>>
>>>>>
>>>>>         =20
>>>>>
>>>>>>that it is not doing a load balance, my idea of load balance is
>>>>>>utilizing the 3 lines simultaneously.
>>>>>>
>>>>>>
>>>>>>           =20
>>>>>>
>>>>>...
>>>>>
>>>>>Perhaps you can use the nth patch.
>>>>>http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-ba=
se-
nth
>>>>>
>>>>>
>>>>>Gr,
>>>>>Rob
>>>>>
>>>>>
>>>>>         =20
>>>>>
>>>
>>>
>>>     =20
>>>
>>
>>   =20
>>
>
>
>
>
>
>
>
> =20
>




