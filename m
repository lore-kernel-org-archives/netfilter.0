From: Drew Leske <dleske@uvic.ca>
Subject: Re: Login load balancing
Date: Fri, 28 Apr 2006 09:54:33 -0700
Message-ID: <445248C9.5010402@uvic.ca>
References: <444FAEFF.1040100@uvic.ca> <444FB608.10009@netzwerk.cc>
	<4451F042.70103@supportivo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4451F042.70103@supportivo.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Daniel Ivanov <sertys@supportivo.org>
Cc: netfilter@lists.netfilter.org

Hi Daniel,

> The last one is not the best solution, because of the fact that you rely
> on randomness. I would suggest you take a more comprehensive approach.

Agreed.  If I had enough users and enough nodes, randomness would approach
other methods for effectiveness, but that's not the case here.

> As the machines are snmp enabled, you just have to write a custom
> daemon, receiving on port 22 (ssh) as a front-end and check which
> machine is most idle and dnat the user there, for the DNAT to be able to

Slight aside: I don't want to check the load at time of login, because that
would significantly slow down the login process.  The load checking would be
done periodically--say every 5 or 15 minutes or so--and the results would
force a change to the DNAT rule.

> work, you would have to send an RST packet back to the ssh client and
> wait for it to reconnect to the already DNAT-ted machine. That would be
> a working solution. As long as you don't wanna have millions of rules on
> the redirecting machine, you just have to "count" the active logins(use
> pam_script for example) and remove the rules as long as the last shell
> quits. You would like to have all simultaneous logins on the same
> machine, so you'll have to check on a new login if the user is still
> there and put it on the same machine. Just think about the RST packet,
> cause i think it's not the most elegant solution as long as the user
> will get a "Connection closed by remote site" msg.

I've considered that (keeping all logins together on the same head node).
My feelings on that are:

(0) The users should not actually need to have multiple logins on the same
real host.  If their environment is not consistent across the hosts, there
is another problem.

(1) Once the user logs in and is redirected, they have the option to
'manually' log in to that node for subsequent sessions.

(2) Tracking user logins so I can make this automatic for them is desirable,
however, it would be non-trivial to implement robustly.

(3) So, that would be 'version 2'! :)

>> Hi Drew,
>>
>> maybe you should take a look on "iptables random" - target.
>>
>> Something like
>>
>> iptables -t nat -A PREROUTING -p tcp --dport 22 -i $whatever \
>>      -m random --average $[100/$howmuchserveryouvegot] \
>>      -j DNAT --to $server1
>>
>> iptables -t nat -A PREROUTING -p tcp --dport 22 -i $whatever \
>>      -m random --average $[100/$howmuchserveryouvegot] \
>>      -j DNAT --to $server2
>>
>> ...
>>
>> Only one idea, but remember "the last rule should realy match" ;-)
>>
>> Hope this is the right syntax.
>>
>> Best
>>
>> Sven

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

