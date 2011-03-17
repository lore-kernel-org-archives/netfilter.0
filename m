From: Pandu Poluan <pandu@poluan.info>
Subject: Re: When does NAT processing actually takes place?
Date: Thu, 17 Mar 2011 09:08:03 +0700
Message-ID: <AANLkTikiX3Kd2Kq31TkoppiZvip82cB26dEWVfcPXELD@mail.gmail.com>
References: <AANLkTi=8aYepwRCxcCpo+syL4xjX6HkEFtPVbepZDf05@mail.gmail.com>
	<4D815A44.9040103@goliathdns.no>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D815A44.9040103@goliathdns.no>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Atle Solbakken <atle@goliathdns.no>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Mar 17, 2011 at 07:48, Atle Solbakken <atle@goliathdns.no> wrote:
> Den 17. mars 2011 01:20, skrev Pandu Poluan:
>>
>> When does the actual NAT process (i.e., swapping addresses) take place
>> for DNAT and SNAT/MASQUERADE? And when does the reciprocal NAT (i.e.,
>> reverse NAT, that should happen for instance to process a reply to a
>> packet that's been SNAT-ed) take place?
>
> Take a look at this diagram. Explains iptables packet flow (simplified).
>
> http://www.linuxhomenetworking.com/wiki/images/f/f0/Iptables.gif.pagespeed.ce.WDSY-MDA4o.gif
>
>
> Atle.
>

It explains the flow alright, but that's not really my question.

I'll try to explain in more detail.

## Scenario 1: External address DNAT to internal server ##

A packet comes in:
[1] To: 11.22.33.44:80
From: 55.66.77.88:34567

It got DNATed:
[2] To: 192.168.1.22:12080
From: 55.66.77.88:34567

The server replied:
[3] To: 55.66.77.88:34567
From: 192.168.1.22:12080

It got "inverse NAT"ed:
[4] To: 55.66.77.88:34567
From: 11.22.33.44:80

## Scenario 2: Internal host accesses outside world ##

A packet comes in from the LAN:
[5] To: 75.64.53.42:80
From: 192.168.5.66:45678

It got SNATed:
[6] To: 75.64.53.42:80
From: 88.77.66.55:45678

The remote side replied:
[7] To: 88.77.66.55:45678
From: 75.64.53.42:80

It got "inverse NAT"ed:
[8] To: 192.168.5.66:45678
From: 75.64.53.42:80


Now, based on the discussions:

* [1]-->[2] happens as packet exits nat/PREROUTING
* [5]-->[6] happens as packet exits nat/POSTROUTING

When do [3]-->[4] and [7]-->[8] happen?


Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
