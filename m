From: "Vasantha Kumar Puttappa" <vasanthakumar@iitb.ac.in>
Subject: Re: Packets lost
Date: Thu, 17 May 2007 12:24:43 +0530 (IST)
Message-ID: <1845.10.107.26.27.1179384883.squirrel@gpo.iitb.ac.in>
References: <3388.10.107.26.27.1179320821.squirrel@gpo.iitb.ac.in>
	<464B19A9.700@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464B19A9.700@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Vasantha Kumar Puttappa <vasanthakumar@iitb.ac.in>, netfilter@lists.netfilter.org

Hi Lajos,
 Thanks for responding so fast. I did try adding the forward rule, but
still packets are missing.
 Let me give you more insight into what I am trying do.
 I have a vitrual network interface and 2 physical network interface (one
Ethernet based, and other 802.11 based). The virtual network interface
dynamically binds to any one of the above physical interfaces for packet
transmission. The issue of packet loss occurs **only** during link
switching.

I feel that the following issues might be the possible reasons for the
packet loss.

1. Due to missing soft_IRQ interrupt for packets and hence packet loss ( i
have no proof to back this)
2. Due to incompatible wireless device driver.


Any thoughts on this ?








> Vasantha Kumar Puttappa =EDrta:
>> Hi All,
>>  Please somebody guide me here.
>>
>> I am tracking all udp packets (in particular, SIP based UDP packets)that
>> goes through iptables using LOG mechanism.
>> I use the following command,
>>     iptables -A INPUT -p udp -j LOG --log-level-4.
>>
> Maybe you also need the following rule:
> iptables -A FORWARD -p udp -j LOG --log-level-4
>> In addition, i also run 'Ethereal' to make sure that all the packets
>> captured goes through iptables as well.
>>
> Ethereal sees the packets BEFORE iptables.
> So maybe some of your rules drops the packet.
>> Here is the problem,
>>   Sometimes, a random number of packets doesnot go through IPtables and
>> they are completely lost. Although, I can see those packets in Ethereal.
>>
>>  I tried increasing the backlog queue and ip_queue length, but still no
>> use.
>>  I am using Netgear's wireless network card (WG511, made in taiwan).
>>
>>
>>  Somebody please guide me. How do I findout the cause of this.
>>
>>  Regards
>>  Vasanth
>>
> Swifty
>
>



