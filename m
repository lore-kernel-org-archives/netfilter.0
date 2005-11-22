From: Keith Whyte <keith@media-solutions.ie>
Subject: Re: coming in through the outgoing hole?
Date: Tue, 22 Nov 2005 13:51:06 -0600
Message-ID: <438376AA.5050507@media-solutions.ie>
References: <200511220507.jAM57qZu019084@mx.media-solutions.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511220507.jAM57qZu019084@mx.media-solutions.ie>
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

/dev/rob0 wrote:

> no, i am trying to prevent a remote root user from making a
> connection to my machine.


>I don't see the value in this, myself. Whilst it certainly would seem 
>odd to have a privileged port on the client end of your httpd, how is 
>that a threat to you?
>
>  
>
1. i have a web based admin service running on port 7775, (for example)
2. I want to use iptables to restrict access to this web based admin 
service to certain hosts.
3. but i have added rules to iptables to allow outgoing web traffic by 
allowing all outgoing tcp packets to port 80 from ports > 1024
4. i have also added a rule to allow incoming tcp packets from port 80 
to ports > 1024
5. If a packet arrives from port 80 to port 7775 it gets through, that 
is (was) the threat, but using conntrack is better, my approach using 
ports was flawed.

>Sometimes, I will admit, targeted OUTPUT filtering makes sense. But to 
>rein in shell users, I am not sure. If you cannot trust these users to 
>abide by your ToS and AUP, you don't want them in on shell accounts. :) 
>
>  
>
and their php enabled web account? it should be locked down by other 
methods, i imagine you say.. but we irish like to be sure, to be sure, 
to be sure....

>>I'm also using the rules for traffic counters, so I don't want to do
>>that, but yes, it would simplify things as lot.
>>    
>>
>
>I'm not sure what you mean, but I think I have a good suggestion 
>nonetheless. :) Put your --state RELATED,ESTABLISHED rule in a chain 
>all by itself, and call that as a target after your counter rules.
>
>  
>
Derick suggested using one rule to allow related, established.. i was 
just pointing out that then i wouldn't have the traffic information 
divided by service.. but that's easily enabled again, like either you or 
Derick said.

>like file sharing, I can see where the presence of a hostile root user 
>behind your firewall might be cause for worry. But I guess you have 
>
>  
>
he he, seems like everyone here is thinking in terms of firewalls.. This 
is a co-lo box 100% exposed on the internet. there's no firewall to be 
behind. every other host on the entire internet is a potential hostile 
root user!

I want iptables to reject as much as is possible at the INPUT stage.

thanks!



