From: lst_hoe01@kwsoft.de
Subject: Re: ICMP types to allow
Date: Thu, 22 Dec 2005 09:50:57 +0100
Message-ID: <20051222095057.drpeqwuvcnk8k0kg@webmail.kwsoft.de>
References: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
	<20051222002905.GI25728@nightfall.luchs.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051222002905.GI25728@nightfall.luchs.at>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Zitat von Ren=C3=A9 Pfeiffer <lynx@luchs.at>:

> On Dec 21, 2005 at 1336 -0500, Derick Anderson appeared and said:
>>
>> After reading the ICMP state machine section of the Netfilter tutorial
>> [http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCONNE
>> CTIONS] it appears that ICMP traffic related to existing TCP and UDP
>> connections falls under the RELATED,ESTABLISHED rules.
>
> This is true. However you need some inbound ICMP in order to support
> things like Path MTU discovery. I often allow the inbound ICMP message ty=
pes
> time-exceeded, destination-unreachable and parameter-problem. This
> covers messages that deal with packet fragmentation. You might want to
> disallow some of the destination-unreachable messages.

As far as i know path MTU discovery works by setting up the connection 
with DF set and raise the packet size until a ICMP error comes back. 
This case is covered fine by the RELATED stuff. Time-exceeded and 
destination unreachable are also only valid as reply to some IP traffic.
So as the tutorial discribe there are only 4 types which could be really ne=
w :
"Echo request, Timestamp request, Information request and finally 
Address mask request". For me only the first one makes sense to allow. 
All the really critical stuff can be handeled by the ICMP state machine.

Regards

Andreas




