From: "Lumberjack" <lumberjack@lumberjackvillage.com>
Subject: Re: DNAT, Is it possible to find the original destination?
Date: Tue, 2 Nov 2004 01:11:19 -0500
Message-ID: <001d01c4c0a2$c61a3de0$2e01a8c0@minka>
References: <1099323026.41865692986d5@email.ixwebhosting.com>
	<20041101161041.GA18269@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org


>> Is there any way that my application can look in the table and see the 
>> real
>> destination?  I've seen several things in patch-o-matic that do things 
>> with
>> conntrack but there doesn't seem to be any command, /proc or /dev entry
>> available to query "i have a connection from host foo, iptables, who was 
>> foo
>> really wanting to speak too?".
>
> well, in the case of you example port (80), if you're talking about an
> HTTP request, the original destination of the request is preserved in the
> "Host: " header.  this is how transparent proxying works.
>
> in the general case, i don't suppose there's anything stopping you from
> performing a lookup against /proc/net/ip_conntrack within your app to
> find the original dst ip (although it's been pointed out here recently
> that lookups against /proc/net/ip_conntrack are a bad idea--check the
> archives).
>
> -j
>

Couple follow ups.  I searched back the last two or three months and didn't 
find any "no nos" on using /proc/net/ip_conntrack.  All I can figure is that 
it could be a hit to read through if very large.  Not sure yet how /proc fs 
might lock things either (if that might be an issue).  So any reason for 
using this to be a "bad thing" please provide some sort of hint if possible.

Another.  If I do something to read in the contents of 
/proc/net/ip_conntrack and then do something to send some output to stdin of 
iptables-restore/iptables does my app need to be GPL based?  Boarders here 
seem rather grey.  I am not modifying any GPL code nor extending it so it 
doesn't seem to me be something that "modifies" and thus requires to be 
released under the GPL.

Thanks,
Jason




