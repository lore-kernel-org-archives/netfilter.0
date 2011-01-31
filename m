From: Jim Webster <jwebster@ilstechnology.com>
Subject: Re: DCERPC - does an add-on exist for netfilter
Date: Mon, 31 Jan 2011 18:10:03 +0100
Message-ID: <AANLkTimWDqrgVquyxsS5t-2B1xxqYYoEioi35d3hFr_W@mail.gmail.com>
References: <AANLkTimMiM=NWeDvhPn_wKfab_sta89wxffMPcX2hMSO@mail.gmail.com>
	<4D459926.5080801@trash.net>
	<AANLkTinAawfFBZ+=7giqUsOdzGd5d5avjUW9aaG_dA9h@mail.gmail.com>
	<4D46A36D.4070605@inliniac.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D46A36D.4070605@inliniac.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thanks, will look at those.

Jim

On Mon, Jan 31, 2011 at 12:56 PM, Victor Julien <lists@inliniac.net> wr=
ote:
> On 01/31/2011 12:52 PM, Jim Webster wrote:
>> netfilter@vger.kernel.org
>>
>> On Sun, Jan 30, 2011 at 6:00 PM, Patrick McHardy <kaber@trash.net> w=
rote:
>>> On 30.01.2011 12:07, Jim Webster wrote:
>>>> Hi. =A0I am new to the list and also fairly new to iptables and
>>>> netfilter. =A0Linux and programming - am familiar with.
>>>> Have been tasked to provide a way to move MSMQ (DCERPC?) traffic t=
hru
>>>> our firewall.
>>>> The firewall is a CentOS iptables based box.
>>>>
>>>> Unfortunately, I do not zet have the customer Wireshark trace show=
ing
>>>> the traffic, specificallz where the =A0address (and port) is suppo=
sedlz
>>>> sent in the pazload.
>>>>
>>>> A knowledgeable iptables/firewall person on our team has suggested=
 we
>>>> require a netfilter helper routine (ala the ftp connection trackin=
g).
>>>>
>>>> It seems to me however that instead, some tzpe of adaptive firewal=
l
>>>> technique is required to do this - opening a new NAT for the IP/po=
rt
>>>> sent in the pazload and closing it when done.
>>>>
>>>> If so, can this be done by a simple user app - perhaps a proxy, or
>>>> should it be in the loadable kernel modules as the ftp connection
>>>> tracker is?
>>>
>>> Yes, you'll need a connection tracking helper that is able to
>>> parse the DCERPC traffic in order to integrate this with netfilter
>>> and NAT. I've looked into this a while ago, but due to the
>>> complexity of the protocol it is non trivial.
>>>
>>
>> Thanks for replz. =A0Scares me a bit when a member of Netfilter team
>> sazs non trivial :-).
>> My next step will be to dissect the ftp_conntrack (or other conntrac=
k
>> routine) to see how it works. =A0Also, think I must dive into the
>> iptables source code to see how to dznamicallz add/remove the NAT
>> rules for the protocol.
>>
>> At first, after reading this
>> http://www.faqs.org/docs/gazette/firewalls.html thought I might be
>> able to do it with a simple proxy in userspace.
>>
>> I have much to discover and appreciate anz guidance. =A0Hopefullz, w=
hen
>> (no option for if) this is successful, it will be made available to
>> others. =A0I am half-time so will take me a while.
>>
>> Thank zou,
>
> You could have a look at the Suricata IDS or Snort. Both have DCERPC
> parsers written in GPL C-code.
>
> Cheers,
> Victor
>
> --
> ---------------------------------------------
> Victor Julien
> http://www.inliniac.net/
> PGP: http://www.inliniac.net/victorjulien.asc
> ---------------------------------------------
>
>



--=20
Jim
