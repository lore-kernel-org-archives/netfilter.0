From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: port 25 & 110 forward
Date: Tue, 15 Jul 2003 10:17:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C528973C@MS_LEU1>
References: <091A6DF13847F44395B31658ED61C19C63A449@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <091A6DF13847F44395B31658ED61C19C63A449@yellowstone.medclaim.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I'm trying to forward smtp and pop3 from my router to my mail 
> server at 10.13.110.1.  I've tried both of the following 
> iptables commands, neither has worked.
> 
> $IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j 
> DNAT --to 10.13.110.1 $IPTABLES -t nat -A PREROUTING -i eth1 
> -p tcp --dport 110 -j DNAT --to 10.13.110.1 $IPTABLES -A 
> FORWARD -p tcp -d 10.13.110.1 --dport 25 -j ACCEPT $IPTABLES 
> -A FORWARD -p tcp -d 10.13.110.1 --dport 110 -j ACCEPT
> 
> 
> $IPTABLES -t nat -A PREROUTING -d <public_ip> -p tcp --dport 
> 25 -j DNAT --to 10.13.110.1:25 $IPTABLES -A FORWARD -p tcp 
> --dport 25 -j ACCEPT $IPTABLES -t nat -A PREROUTING -d 
> <public_ip> -p tcp --dport 110 -j DNAT --to 10.13.110.1:110 
> $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT

Do you also have the rule :

$IPTABLES -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

It might help.


Gr,
Rob


