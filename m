From: Victor Julien <lists@inliniac.net>
Subject: Re: DCERPC - does an add-on exist for netfilter
Date: Mon, 31 Jan 2011 12:56:29 +0100
Message-ID: <4D46A36D.4070605@inliniac.net>
References: <AANLkTimMiM=NWeDvhPn_wKfab_sta89wxffMPcX2hMSO@mail.gmail.com>	<4D459926.5080801@trash.net> <AANLkTinAawfFBZ+=7giqUsOdzGd5d5avjUW9aaG_dA9h@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinAawfFBZ+=7giqUsOdzGd5d5avjUW9aaG_dA9h@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Webster <jwebster@ilstechnology.com>
Cc: netfilter@vger.kernel.org

On 01/31/2011 12:52 PM, Jim Webster wrote:
> netfilter@vger.kernel.org
> 
> On Sun, Jan 30, 2011 at 6:00 PM, Patrick McHardy <kaber@trash.net> wrote:
>> On 30.01.2011 12:07, Jim Webster wrote:
>>> Hi.  I am new to the list and also fairly new to iptables and
>>> netfilter.  Linux and programming - am familiar with.
>>> Have been tasked to provide a way to move MSMQ (DCERPC?) traffic thru
>>> our firewall.
>>> The firewall is a CentOS iptables based box.
>>>
>>> Unfortunately, I do not zet have the customer Wireshark trace showing
>>> the traffic, specificallz where the  address (and port) is supposedlz
>>> sent in the pazload.
>>>
>>> A knowledgeable iptables/firewall person on our team has suggested we
>>> require a netfilter helper routine (ala the ftp connection tracking).
>>>
>>> It seems to me however that instead, some tzpe of adaptive firewall
>>> technique is required to do this - opening a new NAT for the IP/port
>>> sent in the pazload and closing it when done.
>>>
>>> If so, can this be done by a simple user app - perhaps a proxy, or
>>> should it be in the loadable kernel modules as the ftp connection
>>> tracker is?
>>
>> Yes, you'll need a connection tracking helper that is able to
>> parse the DCERPC traffic in order to integrate this with netfilter
>> and NAT. I've looked into this a while ago, but due to the
>> complexity of the protocol it is non trivial.
>>
> 
> Thanks for replz.  Scares me a bit when a member of Netfilter team
> sazs non trivial :-).
> My next step will be to dissect the ftp_conntrack (or other conntrack
> routine) to see how it works.  Also, think I must dive into the
> iptables source code to see how to dznamicallz add/remove the NAT
> rules for the protocol.
> 
> At first, after reading this
> http://www.faqs.org/docs/gazette/firewalls.html thought I might be
> able to do it with a simple proxy in userspace.
> 
> I have much to discover and appreciate anz guidance.  Hopefullz, when
> (no option for if) this is successful, it will be made available to
> others.  I am half-time so will take me a while.
> 
> Thank zou,

You could have a look at the Suricata IDS or Snort. Both have DCERPC
parsers written in GPL C-code.

Cheers,
Victor

-- 
---------------------------------------------
Victor Julien
http://www.inliniac.net/
PGP: http://www.inliniac.net/victorjulien.asc
---------------------------------------------

