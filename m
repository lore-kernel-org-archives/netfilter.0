From: John Miller <johnmill@brandeis.edu>
Subject: Re: One to One port range forwarding to different port range
Date: Thu, 6 Aug 2015 12:51:44 -0400
Message-ID: <CAGYMsbtQtxmxYXDiTJ+wvB2Fq-OTmvn0R=9Geg=p__Wcr6SRGw@mail.gmail.com>
References: <55C23EA8.8020905@cradlepoint.com>
	<CAA5aLPitegnUtMX1F8==_Fw9MKLnJmRNkF16B66Xjasg-9OZ8g@mail.gmail.com>
	<55C37D49.6010108@cradlepoint.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55C37D49.6010108@cradlepoint.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

When I saw this thread yesterday, I tried to pull this off using the
NETMAP target--obviously no dice.  To netfilter devs: could the NETMAP
target be extended to work with port numbers as well as IP addresses?

John
-- 
John Miller
Systems Engineer
Brandeis University
johnmill@brandeis.edu


On Thu, Aug 6, 2015 at 11:29 AM, Doug Applegate
<dapplegate@cradlepoint.com> wrote:
> Akshat,
>
> Thanks for clarifying the behaviour. I'm assuming then, that the only way to
> get 1:1 port mappings with different end point ports is to create a separate
> rule for each port?
>
> Doug
>
> On 08/06/2015 01:26 AM, Akshat Kakkar wrote:
>>
>>
>> Firstly assuming that 2000 is a typo. It should be 20000.
>>
>> This will probably do a one-to-one port mapping but that mapping will
>> be dynamic, depending on which port comes first.
>> so it could be
>> 100.0.0.1:30003 > 192.168.0.5 : 10000
>> 100.0.0.1:30001 > 192.168.0.5 : 10001
>> 100.0.0.1:33567 > 192.168.0.5 : 10002
>>
>> Just depending on what order the traffic comes and what is the next
>> free port (Probably?)!
>>
>> -Akshat
>>
>> On Wed, Aug 5, 2015 at 10:19 PM, Doug Applegate
>> <dapplegate@cradlepoint.com> wrote:
>>>
>>> Hello,
>>>
>>> After testing and looking at the kernel source, I realize that this
>>> mapping:
>>>
>>> iptables -t nat -I PREROUTING -p tcp -m tcp --dport 30000:40000 -j DNAT
>>> --to
>>> [local_ip]:10000-2000
>>>
>>> Doesn't do a one-to-one port mapping
>>> e.g.:
>>> 100.0.0.1:30000 > 192.168.0.5:10000
>>> 100.0.0.1.30001 > 192.168.0.5:10001
>>> 100.0.0.1.30002 > 192.168.0.5:10002
>>>
>>> I was wondering if it was possible to do the 1:1 port range forwarding to
>>> different port ranges or if you have to use individual rules.
>>>
