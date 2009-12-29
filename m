From: Roman Fiedler <roman.fiedler@ait.ac.at>
Subject: Re: Understanding conntrack: Delete and manual readd of same entry
 possible?
Date: Tue, 29 Dec 2009 11:42:05 +0100
Message-ID: <4B39DCFD.8070808@ait.ac.at>
References: <4AC9A668.3050009@ait.ac.at> <4B32A248.9070403@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B32A248.9070403@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo Neira Ayuso wrote:
> Roman Fiedler wrote:
>> Hi list,
>>
>> The failure to conduct a simple test with conntrack makes me believe,
>> that I misunderstood some part of the concept.
>>
>> The testcase ....
>
> I seem to have overlooked this email, sorry. You need this patch in
> order to make it work, I'm going to apply it to git.netfilter.org now so
> it will be available in the next release.

Thanks for the patch. When I've played with the same problem at home I've
guessed that it is something with sequence numbers and that setting tcp-liberal
in a netlink test application is a workaround for the DROP. But I did not
bring it to that point that I could create a clean patch because there were
still some loose ends. Perhaps someone could help me to fix some of these:

a) When conntrackd inserts the entries, does it set the liberal also? If yes,
is it correct, that a failover via conntrackd would disable sequence number
tracking for all existing entries?

b) Does the netlink api support sequence number parameters? If not, should it?

c) If the sequence numbers are not set by the conntrack utility, where do the
values in the kernel space come from? Are they all 0 or is it uninitialized
memory from user or kernel space?
