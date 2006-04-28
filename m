From: Daniel Ivanov <sertys@supportivo.org>
Subject: Re: Login load balancing
Date: Fri, 28 Apr 2006 13:36:50 +0300
Message-ID: <4451F042.70103@supportivo.org>
References: <444FAEFF.1040100@uvic.ca> <444FB608.10009@netzwerk.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FB608.10009@netzwerk.cc>
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
Cc: netfilter@lists.netfilter.org

The last one is not the best solution, because of the fact that you rely 
on randomness. I would suggest you take a more comprehensive approach. 
As the machines are snmp enabled, you just have to write a custom 
daemon, receiving on port 22 (ssh) as a front-end and check which 
machine is most idle and dnat the user there, for the DNAT to be able to 
work, you would have to send an RST packet back to the ssh client and 
wait for it to reconnect to the already DNAT-ted machine. That would be 
a working solution. As long as you don't wanna have millions of rules on 
the redirecting machine, you just have to "count" the active logins(use 
pam_script for example) and remove the rules as long as the last shell 
quits. You would like to have all simultaneous logins on the same 
machine, so you'll have to check on a new login if the user is still 
there and put it on the same machine. Just think about the RST packet, 
cause i think it's not the most elegant solution as long as the user 
will get a "Connection closed by remote site" msg.

Mailings'AT'netzwerk.cc wrote:

> Drew Leske wrote:
>
>> Hi all,
>>
>> I'm looking for a solution (and I'm not afraid of devving one if 
>> necessary)
>> to load-balance SSH logins over several mostly identical systems.  So 
>> far
>> the closest I have come is a solution using iptables, but I'm not 
>> sure it
>> will work, and I may well be overlooking some other solution.  Any ideas
>> would be appreciated.  My research has so far turned up little.
>>
>> We have several systems that are, from a user's perspective, identical.
>> Their home directories are network mounted, libraries are 
>> synchronised, and
>> so on, so they don't really care which system they log in to.  Their 
>> work on
>> these systems can be quite intensive and may consume quite a few 
>> resources,
>> but must remain interactive (so a batch system running on a cluster 
>> won't do
>> it).
>>
>> For the users it's a guessing game as to which of the machines they 
>> should
>> log in to at any point.  They may log in to the first and find it's 
>> heavily
>> loaded, and so log in to another, until they find the best.  A second
>> difficulty with this is the users have be aware of which machines are
>> available--and they are named, due to historical reasons, using a
>> non-contiguous numbering scheme.
>>
>> So instead of the users logging in to bob3, bob6 or bob8, I'd like 
>> for them
>> to be able to simply log in to "bob" and be directed to the least-loaded
>> machine.
>>
>> Round-robining on the switch won't do it, because if one of the 
>> systems is
>> absolutely pinned, every Nth login will still wind up there.
>>
>> Determining which machines are least loaded will not be a problem.  The
>> metrics may be gathered using SNMP or some other means from the
>> participating hosts.  The problem is entirely in the redirection from 
>> 'bob'
>> to 'bob3', 'bob6', 'bob8'.
>>
>> Logins are exclusively through SSH.  There is no need, and I don't
>> anticipate one (which means there will be some fantastic new request 
>> coming
>> in tomorrow) to support other protocols in this manner.
>>
>> The only half-solution I have come up with so far is to define a 
>> 'director'
>> box with the 'bob' alias, and then periodically grab load metrics 
>> from the
>> participating hosts, determine of the 'bob's which is the least 
>> loaded, and
>> then *cough* update a DNAT rule to redirect requests coming in for 
>> 'bob' to
>> the least-loaded 'bobX'.
>>
>> The last part feels horky, and I'm not even sure it will work, since 
>> later
>> packets coming in may be DNAT'ed to a different machine.  Also, the 
>> director
>> then routes all the packets for logins to all the boxes.  I can't see 
>> any
>> way to redirect the initial connection that won't cause all sorts of
>> problems with the client's firewalls.
>>
>> Any ideas?
>>
>> Thanks,
>> Drew.
>>
> Hi Drew,
>
> maybe you should take a look on "iptables random" - target.
>
> Something like
>
> iptables -t nat -A PREROUTING -p tcp --dport 22 -i $whatever \
>      -m random --average $[100/$howmuchserveryouvegot] \
>      -j DNAT --to $server1
>
> iptables -t nat -A PREROUTING -p tcp --dport 22 -i $whatever \
>      -m random --average $[100/$howmuchserveryouvegot] \
>      -j DNAT --to $server2
>
> ...
>
> Only one idea, but remember "the last rule should realy match" ;-)
>
> Hope this is the right syntax.
>
> Best
>
> Sven
>

