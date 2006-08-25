From: Matt Singerman <msingerman@ncemch.org>
Subject: Re: creating one rule for both tcp and udp?
Date: Fri, 25 Aug 2006 14:05:47 -0400
Message-ID: <44EF3BFB.9040308@ncemch.org>
References: <44EF3A8C.6000004@ncemch.org> <265CD2F3F15DEDF58A73A320@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <265CD2F3F15DEDF58A73A320@localhost>
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
To: David Lang <david.lang@digitalinsight.com>
Cc: netfilter@lists.netfilter.org

Hi David,

That still gives the same error.  From the manpage, it seems that -p is 
needed if using --dport, am I wrong about this?

David Lang wrote:
> just leave out the -p entirely
>
> David Lang
>
> --On Friday, August 25, 2006 01:59:40 PM -0400 Matt Singerman 
> <msingerman@ncemch.org> wrote:
>
>> Hi all,
>>
>> I was wondering, if I wanted to fliter packets on a specific port, can I
>> write a single rule to work on both tcp and udp traffic, or will I have
>> to write one rule for each?
>>
>> Support, for instance, that I want to allow TCP and UDP packets from any
>> host on port 548 to a machine with IP address 192.168.1.4, could I write
>> a rule like:
>>
>> -A FORWARD -s 0/0 -d 141.161.111.203  -p all --dport 548 -j ACCEPT
>>
>> (please note, I am just using port 548 as an example.)
>>
>> Now, I know that this doesn't work, because I tried it :)  I can back 
>> the
>> error:
>>
>> iptables v1.3.5: Unknown arg `--dport'
>>
>> I am guessing that is because "-p all" include ICMP, which doesn't take
>> the --dport argument.  Am I wrong about that?
>>
>> So, to do this, I would have to do two rules:
>>
>> -A FORWARD -s 0/0 -d 141.161.111.203  -p tcp --dport 548 -j ACCEPT
>> -A FORWARD -s 0/0 -d 141.161.111.203  -p udp --dport 548 -j ACCEPT
>>
>> Now, I would prefer not to do this, because in a lot of places, I would
>> have to add a whole lot of rules.  So, I ask, is there a way to comine
>> TCP and UDP into a single rule?
>>
>> Thanks!
>>
>
>
>
>

