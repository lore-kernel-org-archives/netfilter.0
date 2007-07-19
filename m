From: Konstantin Svist <kostya@relevad.com>
Subject: Re: need advice for high traffic network
Date: Thu, 19 Jul 2007 15:40:27 -0700
Message-ID: <469FE85B.3010502@relevad.com>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
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
To: netfilter@lists.netfilter.org

# cat /proc/sys/net/netfilter/nf_conntrack_max
65536

somehow I doubt I have THAT many connections :)

highest load right now is around 600 requests per second, and ~60% 
complete within 10ms - the rest complete within 200ms (unless the 
firewall is turned on - then some start timing out 3s and up)



David Lang wrote:
> I'll bet you are hitting your max connections
>
> check the value of net.ipv4.netfilter.ip_conntrack_max
>
> David Lang
>
> On Thu, 19 Jul 2007, Konstantin Svist wrote:
>
>> Date: Thu, 19 Jul 2007 15:17:00 -0700
>> From: Konstantin Svist <kostya@relevad.com>
>> To: netfilter@lists.netfilter.org
>> Subject: need advice for high traffic network
>>
>> Hi,
>>
>> I have a network (LAN) consisting of (mostly) gigabit ethernet on a 
>> few switches. Most of the traffic is taken up by small HTTP reqests. 
>> All computers are running Fedora (all are core 4 through 7).
>>
>> I've been having some problems with servers not being accessible and 
>> just last night noticed that the problems disappear when I turn off 
>> the firewall.
>> What happens is that there are lots of small HTTP requests and 
>> apparently at some point the firewall starts dropping or disallowing 
>> new connections. This has been verified with both ab (apache 
>> benchmark) and plain SSH - a lot of times the connections time out or 
>> take a long time to get established.
>> There are ~25 rules total (as listed by 'iptables -L')
>>
>> As a temporary measure, I've turned off firewalls on more of the 
>> servers until I can figure out a better solution - I'd like to have a 
>> firewall on each server, but performance is more important.
>>
>> I'l looking at nf-HiPAC right now - will probably try it some time 
>> soon. Beyond that, I'm out of ideas for the moment.
>>
>> Is there anything else I can do?
>> Any other firewalls? Tricks with rearranging the rules?
>> etc...
>>
>>
>> Thanks!
>>
>>
>>
>> Notes:
>> * Problems do not seem to be limited to any specific Fedora version 
>> or hardware.
>> * external firewalls are out of the question, unless they're really 
>> small & cheap: there are >40 servers in the internal network and the 
>> number is growing
>>
>>
>>
>>
>>
>
>

