From: Jeho Park <jhpark-nf-user@kernelproject.org>
Subject: Re: How stop DoS and SYN attack..
Date: Wed, 07 Jun 2006 02:22:58 +0900
Message-ID: <4485B9F2.3030300@kernelproject.org>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C72@knowledge.wizdom.nu>	<4485974C.3060500@kernelproject.org>
	<e32f231c0606060836x7a4856bdx8ed1e2146723e46d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e32f231c0606060836x7a4856bdx8ed1e2146723e46d@mail.gmail.com>
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
To: Alberto Ferrer <albertoferrer@gmail.com>
Cc: netfilter@lists.netfilter.org

Alberto Ferrer wrote:

> =BFSo its impossible stop a DDoS ? (SYN Flood in my case.)
>
if you limit DDos to the TCP SYN flood, you may be right
but there are so many DDos patterns not based TCP..
so if you make enable tcp_sync_cookies flag of your kernel, you can=20
protect TCP sync attack,
but as time goes on, your system and network will be stoped. so that=20
solution can't solve the problem basically
( please refer to the "sietse van zanen"'s post and=20
http://www2.laas.fr/METROSEC/attacks-taxonomy-SAR2005.pdf )

in the DDOS problem, i think QoS or  my idea dropping any flooding=20
packet in NIC driver layer may give a more  general solution than =20
IP-based netfilter.  there are so many paper to solve this DDos, but as=20
i know there is none exact solution to resolve this DDos exactly. =20

>
> 2006/6/6, Jeho Park <jhpark-nf-user@kernelproject.org>:
>
>> Sietse van Zanen wrote:
>>
>> >There's not really very much you can do about DDOS attacks with=20
>> netfilter alone. You can block the traffic ofcourse, or try to fiddle=20
>> with --limit, or tcp_syn_cookies.
>> >
>> >
>> i think as a attacker try to send more and more sync packets, router
>> will lose cpu time and system resource .. even if  tcp_syn_cookies
>> function is active or not. the reason i think like this is that i hear=
d
>> tcp_syn_cookies
>> can't stop router being slow..
>>
>> in this DDOS attaction problem, i suggest  as NIC driver module detect=
s
>> packet flooding, DOS attack and block or
>> ignore the packet which is sent from the attacker. we can protect out
>> network backlog safely and there will be no network soft irq ..
>>
>> a few week later, i will try to test my idea.
>> i will use detection engine i made 3 year ago (
>> http://sourceforge.net/projects/geto )
>> as a result, i can't sure my idea is right. so i try to test that.
>>
>> >But usually the problem is that the amount of traffic just fills=20
>> your entire Internet connecection, which renders it useless. The only=20
>> thing you can do in such a situation is ask yout ISP to block the=20
>> attack upstream.
>> >And often, ISPs are very unhappy about customers being DDOS-ed.
>> >
>> >-Sietse
>> >
>> >-----Original Message-----
>> >From: netfilter-bounces@lists.netfilter.org=20
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alberto=20
>> Ferrer
>> >Sent: Saturday, June 03, 2006 10:33 PM
>> >To: netfilter@lists.netfilter.org
>> >Subject: How stop DoS and SYN attack..
>> >
>> >=BFany know a way to stop via Linux with iptables or related a SYN=20
>> attack ?
>> >=BFwhere i can read something related to this?
>> >
>> >Thanks in advance.
>> >
>> >P.S: sorry for my bad english :D
>> >--
>> >Alberto Ferrer
>> >
>> >
>> >
>> >
>> >
>> >
>>
>>
>
>


