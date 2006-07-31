From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: no ssh on eth0
Date: Mon, 31 Jul 2006 17:51:25 +0200
Message-ID: <a74803cb862d9adbddb9a6ea3ca6eeea@former03.de>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>	<87fygje700.fsf@newton.gmurray.org.uk>	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>	<44CCA802.2090403@plouf.fr.eu.org>	<facccfbd353e38901017e6dee5a54a99@former03.de>	<44CCE712.4070907@plouf.fr.eu.org>	<98ab1181f512c188a486f7e3667bb2c4@former03.de>	<44CD10E0.501@plouf.fr.eu.org>
	<f5cb25e84f751fd22816a75d4e6ba77b@former03.de>
	<44CE0921.7050103@plouf.fr.eu.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE0921.7050103@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On 31.07.2006, at 15:44, Pascal Hambourg wrote:

> former03 | Baltasar Cevc a =E9crit :
>>> Why ? What is the difference with or without NAT ?
>> You can filter out all incoming packets to local IP addresses on the=20=

>> wan interface before NAT is done;
>
> No you can't, unless you intend to do filtering in PREROUTING chain of=20=

> the 'mangle' table.
I'd probably prefer to do it in the nat table (well, I do know that=20
filtering should be done in filter only, but it works well that way,=20
too). Another option would be to separate it using marks.

And for local host access, which was what we were talking about:
    -t filter -A INPUT -i eth0 -d <local ip> -j REJECT --reject-with=20
icmp-network-unreachable

>
>> if you just use MASQUERADE for outgoing packets, "iptables -A INPUT=20=

>> -i eth0.-d 192.168.0.0/16 -j DROP".
>
> I just don't see how it is different whether you have NAT/MASQUERADE=20=

> or not. To me filtering and NAT in iptables are fundamentally=20
> independent.
Sure, they are. However, if I nat, I can make the following assumption:
there are no (valid) packet addressed to internal addresses on eth0.
Which is something I can't assume when I don't have NOT. WIthout that=20
assumption, I cannot prohibit as much as I can when I assume that.

Baltasar


--

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


