From: Pablo Allietti <pablo@lacnic.net>
Subject: Re2: How to block all ports except port 21,22,80,8080 ???
Date: Tue, 18 Feb 2003 15:19:19 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218121919.GA11554@omega.lacnic.net.uy>
References: <1045555939.94722.jacob_chan@so-net.net.tw> <1045558628.1967.29.camel@kermit.spenneberg.de> <1045560648.1913.39.camel@kermit.spenneberg.de> <3E5207B9.7C2BEDFA@patrick.at> <20030218160348.GA23914@ynfonatic.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030218160348.GA23914@ynfonatic.de>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> On Tue, Feb 18, 2003 at 11:15:21AM +0100, Patrick Maartense wrote:
> > it would be MUCH better to
> > 
> > iptables -p INPUT DROP # default drop
> > then allow only these ports
> > iptables -A INPUT -p tcp -m multiport  --dport 21,22,80,8080 -j ACCEPT
> > 
> > safe thinking: Default : drop, allow only what needed.
> 
> And it's allways a good idea to allow traffic from loopback:
> 
 iptables -A INPUT -i lo -j ACCEPT

Another Question when i put this line in iptables -L say

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere


whit this i do open all ports for any connection of outside?????


who is the line to permit all inside to outside??



> 
> I heard people telling that ssh is using 22/udp as well. I'm not sure if
> that's true, though i haven't found any sshd which ever bind()ed to 22/udp.
> Anyone more information?
> 
> Allowing ICMP should be mandatory as well, otherwise you'll create another
> PMTU blackhole and you'll miss almost all error messages. And sending real
> errormessages like tcp-reset and ICMP port unreachable is a good thing, too.
> You can limit them, if you like.
> 
> iptables -A INPUT -p icmp -m limit --limit 5/s -j ACCEPT
> iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset # limit if you like
> iptables -A INPUT -j REJECT     # and that one as well
> # implicit DROP due to default policy should happen here
> 
> Alex.
>  
> 
> -- 
> "Mr Data, when I said 'Fire at Will', I didn't mean for you to be so literal."
> Instructions for use of this post: Insert tounge in cheek. Read as normal.


---end quoted text---

-- 

Pablo Allietti

LACNIC 

Registro de Direcciones de Internet para America Latina y el Caribe
Registro de Enderecamento de Internet para America Latina e Caribe
Latin American and Caribbean Internet Addresses Registry



