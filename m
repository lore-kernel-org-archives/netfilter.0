From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: ipv6 tproxy / transparent proxy support?
Date: Wed, 27 Oct 2010 22:48:05 +1300
Message-ID: <4CC7F555.2080807@treenet.co.nz>
References: <4CC71459.5020809@wpkg.org> <4CC7BEF9.6010906@treenet.co.nz> <4CC7DED3.2090701@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC7DED3.2090701@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

On 27/10/10 21:12, Tomasz Chmielewski wrote:
> On 27.10.2010 07:56, Amos Jeffries wrote:
>> On 27/10/10 06:48, Tomasz Chmielewski wrote:
>>> What is the state of tproxy / transparent proxying (i.e. with Squid)
>>> with ipv6?
>>
>> The state?
>>
>> * kernel - pending release
>> * iptables - patches queued for audit.
>> * squid - supported in 3.1 production releases.
>>
>> I've just updated the squid wiki tproxy4 page with details and links to
>> the bits you need as of today.
>
> I see the page[1] contains command line iptables examples, but no
> ip6tables ones. Do you know the syntax for ip6tables, and if so, could
> you add an example to the squid wiki tproxy4 page as well?

 From what I've seen of the patches the demo config should be identical 
save for the "6" in ip6tables command.

AYJ
