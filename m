From: Jeff White <jaw171@pitt.edu>
Subject: Re: why scapy packet no effected by ip tables
Date: Mon, 21 Jul 2014 08:38:26 -0400
Message-ID: <53CD09C2.2090604@pitt.edu>
References: <CAPpnho=+jciiQzpa9gnihrJsBRnRkniQtfWHPcrr7s4-3KHSDw@mail.gmail.com>
 <20140717152350.GA4553@home>
 <CAPJdpdA7JGd6g9G99sxFUhMTX4-KWkYdnwLjcoxA26C47BPOrw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAPJdpdA7JGd6g9G99sxFUhMTX4-KWkYdnwLjcoxA26C47BPOrw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Paul Robert Marino <prmarino1@gmail.com>, Phil Oester <kernel@linuxace.com>
Cc: Abogholo A <abogholo@gmail.com>, netfilter@vger.kernel.org

Obviously you are doing this for DNS, you need TCP too.  If a DNS 
request or response is larger than 512 bytes it will use TCP.

Jeff White - GNU+Linux Systems Administrator
University of Pittsburgh - CSSD

On 07/20/2014 12:27 PM, Paul Robert Marino wrote:
> look at ebtables instead.
>
>
> On Thu, Jul 17, 2014 at 11:23 AM, Phil Oester <kernel@linuxace.com> wrote:
>> On Wed, Jul 16, 2014 at 05:16:21PM +0430, Abogholo A wrote:
>>> i wrote this rule for change all udp destination ip address to 8.8.8.8
>>> when dport is 53:
>>>
>>> iptables -t nat -A OUTPUT -p udp -m udp --dport 53 -j DNAT
>>> --to-destination 8.8.8.8
>>>
>>> but when send this packet
>>>
>>> sr1(IP(dst="4.2.2.4")/UDP()/DNS(rd=1,qd=DNSQR(qname="iranled.com")))
>>>
>>> iptables no effected to them
>>>
>>> why?
>>
>> Scapy uses raw sockets, which don't go through iptables.
>>
>> Phil
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
