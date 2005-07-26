From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Rules for localhost, help needed.
Date: Tue, 26 Jul 2005 09:38:22 +0200
Message-ID: <42E5E86E.80206@mnemon.de>
References: <B80488675062364A909EE60F4A66603807E15FDE@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B80488675062364A909EE60F4A66603807E15FDE@usilms23.ca.com>
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

Ginter, Jeff A schrieb:
> On occasion, I configure iptables via webmin.  I am having a strange
> problem where when I apply the rules from that GUI that it never comes
> back.  If I close the web browser and restart, I can see everything
> again, but it looks like I get cut off.  Also, I occasionally get some
> redhat GUI issues as well and I think it's because of my rulebase.
> These issues do not happen when I am connected remotely.
> 
>  
> 
> I have my ruleset below...am I missing anything for local that anyone
> can see.
...
> [root@mae-fw ~]# iptables -L

Please provide at least the output of "iptables -nvL", only -L isn't
enough. Or you may send the output of "iptables-save ...".

> Chain INPUT (policy DROP)
> 
> target     prot opt source               destination
> 
> DROP       all  --  192.168.222.0/24     anywhere
> 
> DROP       all  --  138.42.156.0/24      anywhere
> 
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> 
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> multiport dports ssh,10000 state NEW
> 
> DROP       all  --  anywhere             anywhere

Although no interfaces are shown, I can't see any rule, that could allow
lo. Seems to me that you are missing rules like these:

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

Have a nice time,

Joerg


