From: Marcelus Trojahn <trojahn@alternativa.com.br>
Subject: Re[2]: bridge and FORWARD chain
Date: Tue, 24 Jan 2006 17:43:39 -0300
Message-ID: <1741128300.20060124174339@alternativa.com.br>
References: <536155680.20060124162302@alternativa.com.br>
	<1138129976.4854.8.camel@localhost.localdomain>
Reply-To: Marcelus Trojahn <trojahn@alternativa.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138129976.4854.8.camel@localhost.localdomain>
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
To: netfilter@lists.netfilter.org

Delron,

  I understand that but my experience differs...

  When  I was researching about linux bridges, before I installed the first one,
  I  read  that I'd need to use ebtables to filter the traffic but I still tried
  iptables and, for my surprise, it worked...

  That's  why  I can't understand why this won't work in this new bridge... What
  would explain it working in the old one? The only difference on the old one is
  that I have an interface out of the bridge...

-- 
Marcelus Trojahn


Tuesday, January 24, 2006, 4:12:56 PM, voce escreveu:

> Hi Marcelus

> You would not see any packets at Layer 3 - Its a bridge, bridging at
> Layer 2.

> You would need to route in order to see packets entering the chains.

> Cheers

> Delron

>> Friends,
>> 
>>   I  have  a linux bridge, using bridge-utils... I've worked with bridges before
>>   and never had the problem I'm having now...
>> 
>>   The  packets go from interface to interface, but never reach the FORWARD chain
>>   on iptables... How is that possible?
>> 
>>   Here's  an  example...  The  bridge  has  an  uptime of 17hrs, working with no
>>   problems at all, yet, no packets on FORWARD chain...
>> 
>> # uptime
>>  17:54:46 up 17:54, load average: 0.00, 0.00, 0.00
>> # iptables -L -vn
>> Chain INPUT (policy ACCEPT 5262 packets, 1012K bytes)
>>  pkts bytes target     prot opt in     out     source               destination
>> 
>> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>>  pkts bytes target     prot opt in     out     source               destination
>> 
>> Chain OUTPUT (policy ACCEPT 2953 packets, 940K bytes)
>>  pkts bytes target     prot opt in     out     source               destination
>> 
>>  The  main  reason of this bridge is to filter some unwanted traffic coming from
>>  the network behind it... So, I need the FORWARD chain for that...
>> 
>>  Anything on /proc or something that can disable it?
>> 




