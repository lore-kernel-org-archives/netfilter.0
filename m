From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables problem
Date: Wed, 13 Aug 2003 19:36:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c361c1$6e70e260$0401000a@sterenborg.info>
References: <1060794597.2054.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060794597.2054.2.camel@localhost.localdomain>
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

> all my rules.  I can attach to the computer from outside so I 
> know that the incoming rules work, however, I can not perform 
> any outgoing tasks.  No pings, no ssh no nothing.
> 
> Can someone please explain why this is not working?
> 
> *filter
> -A INPUT -p tcp --dport 110 --syn -j ACCEPT
> -A INPUT -p tcp --dport 42 --syn -j ACCEPT
> -A INPUT -p tcp --dport 7777 --syn -j ACCEPT
> -A INPUT -p tcp --dport 7775 --syn -j ACCEPT
> -A INPUT -p tcp --dport 22 --syn -j ACCEPT
> -A INPUT -p tcp --dport 80 --syn -j ACCEPT
> -A INPUT -p udp --dport 53 -j ACCEPT
> -A INPUT -p udp --dport 42 -j ACCEPT
> -A INPUT -p tcp --syn -j REJECT
> -A INPUT -p udp -j REJECT
> COMMIT

Is this rule-set complete ?

If it is, I see no rule like :
# iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
Which might help to accept incoming packets that are a reply of an
outgoing packet.

If it isn't, it could be that you have set policy to DROP for the OUTPUT
chain and have to ACCEPT rules for the OUTPUT chain : netfilter will not
let any (locally generated) packets out.
To check : if you start the service, type :
# iptables -P OUTPUT ACCEPT
and then try to ping or something.


Gr,
Rob


