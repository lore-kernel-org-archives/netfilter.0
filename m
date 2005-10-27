From: Jon Heese <netfilter@jonheese.com>
Subject: Re: Forward internal packets as though they're external
Date: Thu, 27 Oct 2005 08:50:42 -0400
Message-ID: <4360CD22.5050408@jonheese.com>
References: <436051E9.2050701@jonheese.com>
	<43a0cdcb0510262117v3cd4835p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510262117v3cd4835p@mail.gmail.com>
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

Nope, that's the first thing I tried.  From what I can tell, the DNAT 
jump target is not valid in the INPUT chain (which makes sense).

Regards,
Jon Heese

Buddy wu wrote:
> Try "/sbin/iptables -A INPUT -d 65.9.134.4 -s 192.168.0.0/24 -p tcp
> --dport 6969 -j DNAT 192.168.0.100:6969"
> It maybe work, I don't ensure
> 
> 2005/10/27, Jon Heese <netfilter@jonheese.com>:
> 
>>List,
>>
>>I have a seemingly simple situation here that I have yet to find a
>>straightforward answer to, so here goes.  I have my router/firewall
>>running iptables:
>>
>>eth0 - 65.9.134.4
>>eth1 - 192.168.0.1
>>
>>Then, say an internal machine, "castor":
>>
>>eth0 - 192.168.0.100
>>
>>I'm running a BitTorrent tracker on castor's TCP port 6969, and I'm
>>using iptables to forward traffic coming in router's eth0's port 6969 to
>>castor's 6969 (nat table, PREROUTING chain).  No problem coming in from
>>outside.
>>
>>The problem arises when I want to connect to castor's BitTorrent tracker
>>from another machine behind the router (on the 192.168.0.0/24 subnet).
>>It's matching the INPUT rule and sending the packet directly to router's
>>port 6969, instead of following the FORWARD rule to castor's 6969, and
>>while this makes sense to me, I don't want it to do it.
>>
>>So, the simple solution, I say to myself, is to tell iptables to take
>>all packets with destination address of 65.9.134.4 and source address of
>>192.168.0.0/24 and dport 6969 to go to castor's 6969.  In English I
>>think I have it fine.  Finding the right syntax/logic in iptablesish is
>>where I get tripped up.  I can match the rule fine, I just don't know
>>what action/jump I need to specify to make it redirect.
>>
>>The rule is:
>>
>>/sbin/iptables -A INPUT -d 65.9.134.4 -s 192.168.0.0/24 -p tcp --dport 6969
>>
>>And if I add "-j DROP" or "-j ACCEPT", I get the appropriate action in
>>my testing situation.  Now, the question:
>>
>>What do I have to specify after the above rule definition to either a)
>>get iptables to redirect this packet to my existing nat/PREROUTING chain
>>(which may not be possible), or b) forward it directly to a specified
>>IP:port?
>>
>>If you need any more specifics or code or if I posted this to the wrong
>>list, just let me know.  Thanks in advance.
>>
>>Regards,
>>Jon Heese
>>
>>

