From: Michael <mutk@iprimus.com.au>
Subject: Re: bandwidth again maybe O T
Date: Thu, 05 Sep 2002 18:44:27 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D77196B.7090301@iprimus.com.au>
References: <200209041908.49707@.> <200209041527.g84FRpv31480@vulcan.rissington.net> <200209051228.03102@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: IPtables Users <netfilter@lists.samba.org>

PayalR wrote:

>Hi,
>Thanks a lot for mails. Well, I think I get the general idea.
>  
>
>>However, to measure the amount of http traffic going to/from a specific IP
>>address, put a couple of rules such as this in your FORWARD chain:
>>iptables -I FORWARD -d a.b.c.d -p tcp --dport 80
>>iptables -I FORWARD -s a.b.c.d -p tcp --sport 80
>>    
>>
>
>I wanted for all protocol and not just http so I modified your rule a bit 
>like,
>iptables -I FORWARD -d 192.168.0.1 -p tcp
>iptables -I FORWARD -s 192.168.0.1 -p tcp
>
>These are the only two rules I have.
>
>I tried to test it using 
>#iptables -L FORWARD -x -v
>Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>    pkts      bytes target     prot opt in     out     source               
>destination
>       0        0            tcp  --  any    any     localhost.localdomain  
>anywhere
>
>       0        0            tcp  --  any    any     anywhere             
>localhost.localdomain
>
>I tried pinging it few times, connecting to port 25, telnet, 80 etc. fom the 
>local machine. But the number of bytes above do not change.
>What must be wrong?
>


Since you are pinging from localhost, I don't think the FORWARD chain is 
traversed. The packets go straight to OUTPUT chain. If the packets came 
from somewhere else, and are to be forwarded by the host on which 
iptabls is running, then the packets will be seen and counted by FORWARD.

Place the rules in the OUTPUT chain, you should see things from 
localhost being counted..

Cheers,
Michael


