From: Sudheer Divakaran <sudheer@svw.com>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Thu, 08 Jul 2004 20:00:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ED5A89.1040002@svw.com>
References: <Pine.LNX.4.44.0407081537580.3962-100000@Megathlon.ESI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407081537580.3962-100000@Megathlon.ESI>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
    If I'have mislead anyone, I'm Sorry.  I was talking about NATing.

Thanks,
Sudheer



Marco Colombo wrote:

>On Thu, 8 Jul 2004, Sudheer Divakaran wrote:
>
>  
>
>>Hi,
>>
>>I've a local LAN consisting of about 150 machines.  I'm using a machine 
>>with Linux + IPTables  as the gateway machine which inturn connects to 
>>two different ISPs.  My question is can a Linux based machine match the 
>>performance of a hardware based routers provided by Cisco,... OR is my 
>>decision to go for a Linux based solution is a wrong one?.
>>
>>Is there so much difference between these two solutions?
>>
>>Can I achieve the same performance using a high end PC and Linux?
>>
>>I'm asking this because one guy told me that my decision to go for a 
>>Linux based solution is a wrong one and it can never match the 
>>performance of hardware based Routers.
>>    
>>
>
>iptables is not concerned with routing. If you're comparing 
>a Cisco _routing_ solution with a linux-based one, this is the wrong
>list I think. There are many things to consider: raw performances,
>routing software (are you running EIGRP?) and so on, all off topic here.
>
>Despite, ask that guy to show you a real 'hardware based router'.
>That is, remove any software (IOS) from a Cisco piece of hardware
>and see how it performs. Ciscos (but high end ones only) do have
>specialized hardware, so you may refer to it as "hardware-assisted
>routing", no more. But they're software-based routers, too.
>Again, this is quite off topic.
>
>iptables is about filtering, NATing, mangling IP packets (am I missing
>anything?). Yeah, Ciscos can do that too. But, please correct me
>if I'm wrong, I'm not aware of _any_ hardware that assists them in
>that. So it's not hardware-based filtering anyway. It's all in software.
>
>The following rule:
>
>iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>which may make sense in simple setups, takes _global_ decisions,
>hardly it can be "distributed" to interface processors (think of
>packets belonging to the same flow that may arrive from two different
>interfaces).
>
>In the end, the right question is: how do iptables compare to IOS
>access-lists? I'll leave the comparison to others. All I know is
>that there's no UNIX shell running on a Cisco. There's no UNIX-like
>environment. Put two lines in crontab, and have them invoke a script
>that sets iptables up, passing it a parameter (night/day), in order
>to implement less permissive rules at night and during weekends.
>Now do the same with a Cisco. You get the idea.
>
>.TM.
>  
>

