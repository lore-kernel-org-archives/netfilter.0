From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Log every package incoming and outcoming.
Date: Mon, 23 Aug 2004 09:53:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <412A04E6.2080701@pbl.ca>
References: <44585.80.164.248.134.1092997944.squirrel@krank.darknet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <44585.80.164.248.134.1092997944.squirrel@krank.darknet.dk>
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

Thomas Kristensen wrote:
> How can i log every package coming on INPUT, OUTPUT and FORWARD chains.
> 
> I want to log every package to lateron collect the data and make stats
> over the use from every ip inside the firewall. The reason why i need to
> log, is i need to check every ip to se if its inside denmark, or outside
> denmark (i got the list for dk ips).
> 
> i dont want a full system setup, i just need somekind og modul for
> iptables, or a conf for iptables to log every thing.
> The problem is if i set a rule, iptables will stop at a matching rule, and
> therefor i cant set a log rule in the end for alle chains.

That is why you would set log rule at the beggining of all chains.  LOG 
target is non-terminating, and Netfilter will continue with the next 
rule in the chain (until it finds the one that matches and is 
terminating, like ACCEPT or DROP):

-A FORWARD -j LOG --log-prefix "something "
... rest of your FORWARD rules go here ...

BTW, you are aware that this is going to generate tremendeous amount of 
logs?  You might be better off by creating rules that you will use only 
as counters.  Assuming eth0 is your external interface, and that no 
traffic is to be to/from firewall (or you don't care about it, seems you 
are interested only in clients, right?):

-N DK_CNT
-A DK_CNT -o eth0 -d range1 -j RETURN
-A DK_CNT -i eth0 -s range1 -j RETURN
-A DK_CNT -o eth0 -d range2 -j RETURN
-A DK_CNT -i eth0 -s range2 -j RETURN
-A DK_CNT -o eth0 -d range3 -j RETURN
-A DK_CNT -i eth0 -s range3 -j RETURN
-A DK_CNT -j RETURN

# This one should be first rule in FORWARD chain
-A FORWARD -j DK_CNT
...  rest of your FORWARD rules go here ...

RangeN are IP ranges from your list.  iptables -L DK_CNT -nvx will  give 
you packet and byte counters for each Danish IP range you have, with 
side effect that last line will give you summary for all non-Danish 
traffic, and DK_CNT chain counter will have total traffic.  Note that 
this counters are (I believe) 32-bit unsigned integers.  So after they 
reach 2^32, they are going to start counting from zero (which will 
happen on the firewall after some time).  You'll need to detect this and 
act accordingly.  Or alternatively use iptables -L DK_CNT -nvxZ which 
will zero the counter after reading it (doing this regullary from cron, 
often enough so that they can not theoretically overflow).  It should be 
trivial to write script to parse output of iptables -L, and do all 
statistics that you might need...

Not to mention that second approach will be much gentler on the firewall 
from performance perspective.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

