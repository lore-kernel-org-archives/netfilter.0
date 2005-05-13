From: Christophe SUIRE <christophe.suire@adelux.fr>
Subject: Re: NAT performance
Date: Fri, 13 May 2005 09:16:14 +0200
Message-ID: <02A7CEB4-AD81-4D92-BD1A-A2A5EB00AFF9@adelux.fr>
References: <80E06785-6636-4481-ABD1-6C6C28D52629@adelux.fr>
	<4283EEB7.7010207@riverviewtech.net>
Mime-Version: 1.0 (Apple Message framework v728)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4283EEB7.7010207@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

The hardware is :
     Xeon 3,4Ghz
     1Go of RAM
     Intel Giga cards for public an private network (e1000 driver)
     2 SCSI U320 Raid 1 hard drives

The system is :
     Debian Sarge
     Kernel 2.6.8
     iptables 1.2.11

Thanks a lot.
-- =20
Christophe

Le 13 mai 05 =E0 02:03, Taylor, Grant a =E9crit :

> Christophe SUIRE wrote:
>
>> Hi,
>> I have done some tests, and i'm surprise with the poor result with =20=

>> NAT.
>> I have a linux firewall, 2.6.8 kernel, one card for public =20
>> network,  and one card for the lan.
>> All cards are giga bit cards.
>> I have 10 PC which are each in a VLAN, and with a gateway which =20
>> is  the virtual VLAN interface under the firewall link with the =20
>> lan card.
>> I have 5 switch with a 100Mbit/s uplink to the firewall (with a =20
>> giga  bit backbone switch). I have 2PC under each switch. So in =20
>> theory each  PC have 50Mbit/s of bandwidth.
>> Each PC have 10 alias ip, so i have 10 networks with 10 virtuals  =20
>> clients under each network.
>> So each virtual client (100) have 5Mbit/s of bandwidth.
>> On the firewall each vlan network is SNAT to go out to the internet.
>> My bandwidth test is done with TPTEST, and a TPTEST server under =20
>> the  public network of the firewall.
>> My procedure is : tcp-receive of 50Mo
>>     launch the test for 1 virtual client and get the time
>>     launch the test for 2 virtuals clients together and get the =20
>> time  for each
>>     ....
>>     launch the test for 100 virtuals ...
>> When i do my test without NAT, just routing, the total bandwidth =20
>> used  is near to 500Mbit/s, which is great !
>> But when i do my test with NAT, the total bandwidth used is near =20
>> to  170Mbit/s !!! So i have an import drop of the performance !
>> And this bandwidth is the same from 20 virtuals clients to 100  =20
>> virtuals clients.
>> So i understand that NAT need to rewrite all packets .. but here =20
>> the  performance is very poor.
>> If someone can explain me why ??
>>
>
> What are the specs on the system you are using as the firewall?
>
>
>
> Grant. . . .
>
>
>


