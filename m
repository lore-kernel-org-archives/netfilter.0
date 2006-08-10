From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: Problem with router connected to two ISPs (connection marking?)
Date: Thu, 10 Aug 2006 15:12:23 +0200
Message-ID: <3b37c573ddc16140d97b8e68d15aa489@former03.de>
References: <200608082140.03815.marek.zachara@telperion.pl>
	<44D9CB5B.9020508@freemail.hu>
	<200608091435.49051.marek.zachara@telperion.pl>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200608091435.49051.marek.zachara@telperion.pl>
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
To: Marek Zachara <marek.zachara@telperion.pl>
Cc: netfilter@lists.netfilter.org


On 09.08.2006, at 14:35, Marek Zachara wrote:

>>
>> Maybe these lines will help you... :) But if not.... :D
>>
>> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
>> --to-source $MY_IP
>> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
>> --to-source $MY_IP
>>
> well, the packets can be send out with two different IPs - depending=20=

> on which
> ISP the connection came from - so this would just bind all connections=20=

> to one
> of the IPs making it impossible to have a connection from the other=20
> one.
> no, i am pretty sure the snatting must be done automatically based on=20=

> contrack
> entries.
I agree. These rules don't make much sense. Actually, the second rule
won't ever get hit as the first one gets all the traffic.
What _can_ be done, while not solving our problem, is rewriting of the
outgoing traffic to the IP of that interface:
# iptables -t nat -A POSTROUTING -o ${extif1} -s ! ${extnet1}/29 -j=20
SNAT --to ${extip1}
# iptables -t nat -A POSTROUTING -o ${extif2} -s ! ${extnet2}/29 -j=20
SNAT --to ${extip2}

Which makes sense, however does not discharge conntrack of the duty to=20=

handle
reply packets, as these rules left alone would just lead into the=20
replies
having the wrong IP address in addition to going out on the wrong=20
interface.

Conntrack should, at least that's my understanding, SNAT (or should I=20
say de-DNAT) the
replies before they enter the routing mechanism.

Is anybody who know the code well enough to tell why the packets don't=20=

hit
the conntrack snat 'rules' or aren't rewritten out on the list? Thanx!

Baltasar

--
Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


