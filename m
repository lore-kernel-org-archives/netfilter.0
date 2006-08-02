From: =?ISO-8859-1?Q?Gerard_Par=EDs_Aixal=E0?=
	<gerard.paris@estudiants.urv.cat>
Subject: Re: Filtering MAC addresses and Multicast
Date: Wed, 02 Aug 2006 18:04:46 +0200
Message-ID: <44D0CD1E.5000006@estudiants.urv.cat>
References: <44CF1266.5090109@estudiants.urv.cat> <44CFB3EE.2010007@rtij.nl>
	<44D05188.3040506@estudiants.urv.cat>
	<44D052DD.3060103@rtij.nl> <"44D0731A.4 070507"@freemail.hu>
	<44D09298.20503@estudiants.urv.cat> <44D096BC.2030102@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44D096BC.2030102@freemail.hu>
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

G=E1sp=E1r Lajos wrote:
> Gerard Par=EDs Aixal=E0 wrote:
>> I tried this.
>> And this:
>> iptables -t mangle -I PREROUTING -d 225.0.0.4 -j DROP       #=20
>> 225.0.0.4 is the multicast address
>> iptables -t mangle -I PREROUTING -j DROP
>> But the multicast traffic still arrives at the destination computer.
> How do you know that the traffic arrives ??? :) If you see it with=20
> some sniffer programs (tetheral) then that is fake because those=20
> programs see the packets BEFORE they reach the filtering system.
> You can not tell a packet not to enter your network card... :D
>
> BTW.: What does the counters of the packets matching your rules says=20
> ??? (iptables -L -v -n -t mangle)
>
>

I was using a multicast traffic generator (source and receiver). The=20
receiver showed the packets as they arrived.
After sending 48 multicast packets the counters say the following:
Chain PREROUTING (policy ACCEPT 3 packets, 724 bytes)
 pkts bytes target     prot opt in     out     source              =20
destination
   48 56256 DROP       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0           MAC 00:06:5B:13:4A:69
It seems all the packets were dropped, but the receiver application sees=20
them (it maybe acts like a sniffer).

I changed the application and tried VLC. With those rules, multicast=20
traffic was blocked.

Thanks,
Gerard





