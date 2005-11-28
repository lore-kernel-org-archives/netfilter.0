From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: Re: Forward Ipset and Clear DNAT entry
Date: Mon, 28 Nov 2005 16:28:17 -0500
Message-ID: <438B7671.3070300@kitchenandassociates.com>
References: <437E02A4.40407@kitchenandassociates.com>
	<Pine.LNX.4.58.0511241130310.20155@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511241130310.20155@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef and group--

Jozsef Kadlecsik wrote:
<snip>
>>I would like to be able to forward an ipset tied
>>to certain ports to a different machine. 
<snip>
> I'm not completely sure I understand what you want to achieve, but
> anyway...

The idea is (in the long term) to be able to send 
port 25 traffic from hotmail to a test mail 
server, where the spam could be discarded and we 
could forward legitimate mail that comes from 
clients who still use hotmail...  Since 95% of 
hotmail is trash, it would make our populace here 
happy.

In the short term (in order to test our 
postfix/procmail configuration) I want to be able 
to ssh to my home machine and mail to myself at 
work (with the hope that the mail will be routed 
AWAY from our primary mailserver to the test mail 
server).

Here is where I stand now:

ipset -N disc nethash
ipset -A dischash xxx.xxx.xxx.xxx/xx
ipset -N discports portmap --from 1 --to 1024
ipset -A discports 25
ipset -B dischash :default: -b discports
<snip>
> 
> The ipset is bound to the port, but you did not instruct the set matching
> to follow the bindings up to the level you want. You should have typed
> 
(I typed the following)

iptables -t nat  -A PREROUTING -m set --set \
>   dischash dst,dst -j DNAT --to-destination -yyy.yyy.yyy.yyy

That didn't take, mail still goes to the main 
server, so I figured the cause was
an existing PREROUTING chain forwarding to the 
primary mail server, so I
inserted the chain at the beginning:

iptables -t nat  -I PREROUTING -m set --set \
    dischash dst,dst -j DNAT --to-destination 
-yyy.yyy.yyy.yyy

So, I'm right now, I can ssh to my home machine, 
but any mail I send still goes
to the primary server.

iptables output:

root@firewall:~# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source      destination
DNAT     all  --  anywhere     anywhere    set 
dischash dst,dst to:yyy.yyy.yyy.yyy

----
DNAT       tcp  --  anywhere        anywhere 
tcp dpt:smtp to:yyy.yyyy.yyy.xxx:25

(where yyy.yyyy.yyy.xxx is the primary mail server)

and then many more entries, that all route properly...

Thanks for the help so far and any more...

-- 
Rob





