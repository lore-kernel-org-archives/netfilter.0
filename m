From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Wol Magic Packets
Date: Thu, 24 Aug 2006 14:48:48 +0200 (CEST)
Message-ID: <57237.193.173.147.3.1156423728.squirrel@webmail.sterenborg.info>
References: <J4I52P$07AD17049DE455463CE6BF9E6D425F69@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J4I52P$07AD17049DE455463CE6BF9E6D425F69@libero.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Would you please be so kind to keep this discussion on the list by replyi=
ng to
it, not to me directly.
Thanks.



On Thu, August 24, 2006 14:23, claudio987\@libero\.it wrote:
>> Yes. Well, I also received an email from Sietske van Zanen who thought
>> more thoroughly than I did, but he hit the wrong butten and it was not=
 sent
>> to the list. This was his answer and I have to agree with him:
>>
>>
>> [quote]
>> I do not see what use it is, to block this on your firewall. WoL is a
>> broadcast, hence it will already never traverse a firewall if it's con=
figured
>> correctly. On the local LAN segment they will never pass a firewall be=
fore
>> reaching a LAN station. That's the whole idea of broadcasting.
>>
>> The best thing to do is disable WoL on the workstations.
>>
>>
>> -Sietse
>> [/quote]
>>
>> Gr,
>> Rob
>>
> how can I block wol packets? I must disable broadcasting? In what way? =
I wont
> to use wol only in my lan. I have a linux box router: 192.168.0.1 and 4=
 pc on
> lan 192.168.0.2 192.168.0.3 192.168.0.4 192.168.0.5. I must disable it =
with
> iptables on 192.168.0.1 (router). Thanks

Did you read Sietse's comment?
- WOL is a broadcast and broadcasts typically *do not pass* a router, in =
this
case your Linux firewall.
- If the WOL packet is coming from your LAN you *cannot* block it using y=
our
Linux firewall, because the packets *do not pass through* it.

Disable the WOL feature on your clients, as Sietse suggested.


Gr,
Rob



