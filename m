From: Pandu Poluan <pandu@poluan.info>
Subject: Re: ipset ipporthash - need -p tcp|udp?
Date: Tue, 15 Mar 2011 10:02:33 +0700
Message-ID: <AANLkTi=HpKkCA3vXawfR+owqSb=VE-xOyZ+fC4W6hYyQ@mail.gmail.com>
References: <AANLkTikqUPBmwvGG3Lt5jVR1rdnwA+iOTi4ijfWbC0qs@mail.gmail.com>
	<alpine.DEB.2.00.1103142110580.20094@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103142110580.20094@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Mar 15, 2011 at 03:13, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 15 Mar 2011, Pandu Poluan wrote:
>
>> A question's been bugging me since this evening:
>>
>> Do I need to specify -p tcp|udp if I want to match against an IP set
>> of type ipporthash?
>>
>> Or, in other words, can I just write a rule like `iptables -A FORWARD
>> -m set --match-set SetName dst,dst -j ACCEPT` ?
>
> The port stored together with the protocol, so you should not specify the
> protocol in the iptables rules. Unless you want to match a subset of the
> set, selected by the protocol.
>
> Best regards,
> Jozsef
> -

Ahh, thanks for the explanation!

So, the ipporthash implicitly will only be applied to port-using
protocols, e.g., TCP and UDP.

What about SCTP's port? Will ipporthash also match against SCTP's ports?

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:    pepoluan
Y! messenger: pepoluan
MSN / Live:      pepoluan@hotmail.com (do not send email here)
Skype:            pepoluan
More on me:  My LinkedIn Account  My Facebook Account
