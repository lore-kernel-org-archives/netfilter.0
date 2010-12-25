From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Fair queuing with htb
Date: Sun, 26 Dec 2010 01:29:32 +1300
Message-ID: <4D15E3AC.5000909@treenet.co.nz>
References: <201012230226.31297.gregoire.leroy@hyperthese.net> <201012250208.36503.gregoire.leroy@hyperthese.net> <4D155860.6090507@via.ecp.fr> <201012250452.01340.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201012250452.01340.gregoire.leroy@hyperthese.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Gr=E9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Cc: Antoine Souques <corum@via.ecp.fr>, Andrew Beverley <andy@andybev.com>, Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org

On 25/12/10 16:51, Gr=E9goire Leroy wrote:
> Le Saturday 25 December 2010 03:35:12, Antoine Souques a =E9crit :
>>> I've attached a graph which explains what are the marked packets.
>>
>> Your design is wrong. You mark the upload traffic, when the main htt=
p
>> traffic is the download traffic. That is why your QoS seems ineffect=
ive
>
> In this case I have probably misunderstood the goal of the tcp_outgoi=
ng_mark
> squid directive. Andrew, in what purpose is it developped ?
>
>>
>>> The general goal is to do a QoS based on user ip. If I had no proxy=
, it
>>> would be easy. However, since I've a proxy, my firewall sees the pr=
oxy
>>> ip, not the users IP.
>>
>> Where is your firewall ? Between the proxy and the webserver, or the
>> otherside ?
>>
>
> Yes it is
>
>> In the first case, you can only mark the upload traffic (it's to lat=
e
>> for the download traffic). You should use the conntrack module to ma=
rk a
>> connection, and so, you will be able to mark the download traffic
>
> I thank it was the goal of the tcp_outgoing_mark squid directive (aut=
hored by
> Andrew).
>
>> Moreover, I don't understand why you don't have access to your user
>> addresses. You use mark, so your firewall and your proxy are running=
 on
>> the same box. So, when the download traffic leaves your proxy/firewa=
ll,
>> the destination adsress is the user address. tc is called when a pac=
ket
>> is send to the network, or when a packet arrive. So you can do IP ba=
sed
>> QoS.
>
> The problem is if I limit the traffic between the proxy and users, th=
en he
> won't any difference between the data downloaded from internet and th=
e data
> which was in cache in squid.
>
> I want to limit the rate only for non-cached data, so it seems releva=
nt to
> apply QoS between proxy server and internet.
>

There are three ways to do that:

1) Delay_pools in Squid capping the Server bandwidth speeds based on an=
y=20
client info desired.

2) QoS between the clients and Squid using qos_flows. They mark traffic=
=20
destined to the clients separated into flows based on the data source=20
type; cache, sibling peer, parent peer, direct origin.

  3) Between Squid and the origin servers you need to mark and limit on=
=20
arrival into the box and Squid is not involved, or is set to pass-thru=20
the markings. Squid will be limited along with the client.

AYJ
