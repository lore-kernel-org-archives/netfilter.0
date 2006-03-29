From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Wed, 29 Mar 2006 10:17:07 -0500
Message-ID: <442AA4F3.1000903@SCampbell.net>
References: <cc4fcc140603290545q1cfb7c82t6e91ca1801d2dad2@mail.gmail.com>	<442A9103.10908@SCampbell.net>
	<d72fc30c0603290711t12927540o61a6eb7f74f6ef4d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d72fc30c0603290711t12927540o61a6eb7f74f6ef4d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roger Hamilton <roger123@gmail.com>
Cc: netfilter@lists.netfilter.org

Roger Hamilton wrote:
> On 29/03/06, Steven M Campbell <Netfilter@scampbell.net> wrote:
>> Carlos Pastorino wrote:
>>> Hi everyone,
>>>
>>> I always wondered why conntrack blocked some packets that were
>>> supposed to pass through my ESTABLISHED,RELATED rule. Now it seems
>>> that I've found the answer.
>>>
>>> Bear with me, because there will be questions in the end.
>>>
>>> So, what happens is: from time to time, I see my firewall blocking a
>>> packet like this:
>>>
>>> Mar 28 14:48:21 SRVA kernel: FORWARD blocked: IN=eth1 OUT=eth0
>>> SRC=webserverip DST=customerip LEN=48 TOS=0x00 PREC=0x00 TTL=63 ID=0
>>> DF PROTO=TCP SPT=80 DPT=10458 WINDOW=5840 RES=0x00 ACK SYN URGP=0
>>>
>>> Well, it does call my attention because it's a blocked packet FROM my
>>> webserver. In any case, it shouldn't be blocked, because the
>>> connection is not even 2 minutes old.
>>>
>>> But, on the webserver, I was running tcpdump this time, so I could see
>>> what really happened:
>>>
>>> 14:46:47.573738 customerip.10458 > webserverip.80: S [tcp sum ok]
>>> 23512000:23512000(0) win 65535 <mss 1460,nop,nop,sackOK> (DF) (ttl
>>> 120, id 41065, len 48)
>>> 14:46:47.573747 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>> 14:46:51.327629 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>> 14:46:57.327623 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>> 14:47:09.327609 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>> 14:47:33.527575 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>> 14:47:34.216642 customerip.10458 > webserverip.80: R [tcp sum ok]
>>> 0:0(0) ack 0 win 0 (ttl 26, id 1, len 40)
>>> 14:48:21.727515 webserverip.80 > customerip.10458: S [tcp sum ok]
>>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
>>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>>>
>>> As you can see, the customer connected with a SYN packet, and my
>>> webserver responded with 6 ACK/SYN packets. BUT, before the 6th
>>> ACK/SYN response, the customer sent an ACK/RST packet, resetting the
>>> connection, and thus the 6th ACK/SYN packet was blocked by the
>>> firewall because the connection was no longer in the conntrack. Yes,
>>> clocks in the firewall and webserver are synchronized.
>>>
>>> Questions are:
>>>
>>> 1) Does anyone have seen this happening too?
>>>
>>> 2) How can I silently drop that package, without compromising the on
>>> going connections? I would like to get rid of those "false positives".
>>>
>>> Thanks,
>>>
>>> Carlos
>>>
>> The real question here is what bad thing happened in the the data stream that the customer sent the reset packet?  The answer is not to ignore the reset but to find out why it is being sent, the client believes this connection should be aborted for some reason.
>>
>>
>>
> Doesn't this happen if the customer closes the browser/stops the web
> page loading before the page has completely loaded? If so then one way
> to ignore these packets is to silently drop ACK/SYN packets
> originating from port 80.

The original arguement is that conntrack was blocking packets that it's not supposed to block.  It certainly should block packets that are arriving on a terminated connection.  I don't believe the issue here has anything to do with connection tracking being faulty and workarounds to that effect are only hidng the real issue.  Why did the customer not see the ack packets and finally send a rst?   

