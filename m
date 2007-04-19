From: =?ISO-8859-1?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Re: Setup of different types of NAT
Date: Thu, 19 Apr 2007 15:02:19 +0100
Message-ID: <4627766B.3010809@gmail.com>
References: <235535.26076.qm@web56203.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <235535.26076.qm@web56203.mail.re3.yahoo.com>
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
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hi Elvir

Sorry if the terms I used are not familiar to everyone.
The types of NAT I am talking about are defined by STUN RFC 3489=20
(http://www.faqs.org/rfcs/rfc3489.html, section 5):
(...)

Full Cone: A full cone NAT is one where all requests from the
      same internal IP address and port are mapped to the same external
      IP address and port.  Furthermore, any external host can send a
      packet to the internal host, by sending a packet to the mapped
      external address.

   Restricted Cone: A restricted cone NAT is one where all requests
      from the same internal IP address and port are mapped to the same
      external IP address and port.  Unlike a full cone NAT, an external
      host (with IP address X) can send a packet to the internal host
      only if the internal host had previously sent a packet to IP
      address X.

   Port Restricted Cone: A port restricted cone NAT is like a
      restricted cone NAT, but the restriction includes port numbers.
      Specifically, an external host can send a packet, with source IP
      address X and source port P, to the internal host only if the
      internal host had previously sent a packet to IP address X and
      port P.

   Symmetric: A symmetric NAT is one where all requests from the
      same internal IP address and port, to a specific destination IP
      address and port, are mapped to the same external IP address and
      port.  If the same host sends a packet with the same source
      address and port, but to a different destination, a different
      mapping is used.  Furthermore, only the external host that
      receives a packet can send a UDP packet back to the internal host.

(...)

I just want to know how to setup Symmetric NAT

Thanks in advance
Pedro


Elvir Kuric wrote:
> Hi Pedro,=20
> what is Cone? Some abbervation or what else ?
> Please for clearability describe what you want achieve
> using NAT?
>
> Regards=20
>
> Elvir Kuric=20
>
> --- Pedro Gon=E7alves <pedro.pandre@gmail.com> wrote:
>
>  =20
>> Hello everyone
>>
>> I want to know *how to* setup this types of NAT:
>> /-Full Cone NAT/
>> /-Restricted Cone NAT/
>> /-Port Restricted Cone NAT/
>> /-Symmetric NAT/
>>
>> Using iptables, I set all policies to "ACCEPT" and I
>> was able to setup=20
>> two kinds of NAT:
>> (192.168.2.170 is my "public" address and 10.0.0.1
>> is my "private" address
>>
>> /-"Full Cone NAT", with the following rules:/
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT
>> --to-source 192.168.2.170
>> iptables -t nat -A PREROUTING -i eth0 -j DNAT
>> --to-destination 10.0.0.1
>>
>>
>> /-"Port Restricted Cone NAT", with just a single
>> rule:/
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT
>> --to-source 192.168.2.170/
>>
>> /
>> Now does anyone know how to setup Restricted Cone
>> NAT and Symmetric NAT?
>>
>> Thanks in advance
>> Pedro
>> //
>>
>>
>>    =20
>
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around=20
> http://mail.yahoo.com=20
>
>  =20


