From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 15:53:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404151553.36634.Antony@Soft-Solutions.co.uk>
References: <004601c422f1$9162a3c0$ce00a8c0@xppro1> <1082038036.23863.41.camel@raylinux.internal> <33770.212.251.31.59.1082039282.squirrel@newmail.gnet.gr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33770.212.251.31.59.1082039282.squirrel@newmail.gnet.gr>
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

On Thursday 15 April 2004 3:28 pm, Alexander Economou wrote:

> If i understood well , you have a linux firewall with a dmz ip and you
> want to redirect traffic from a real ip to lan ip of your network.If i am
> correct then you should do :
>
> iptables -t nat -F
> iptables -t nat -A POSTROUTING -o dmzinterface -j MASQUERADE

I disagree with this rule.   It will make all connections to servers in the 
DMZ network appear to come from the firewall, which will destroy any useful 
logging on the services which are running.

> iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6181 -j DNAT --to
> lanip:6181
> iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6182 -j DNAT --to
> lanip:6182
> etc etc

It's important to remember that in addition to the PREROUTING rules to do the 
address translation, you need FORWARDign rules to allow the now-translated 
packets through the firewall.   It was the FORWARDing rules which were the 
problem in Nick's script.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


