From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: anti-dos
Date: Wed, 28 Jan 2004 12:14:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040128111453.485DA7EAE@sterenborg.info>
References: <20040128104243.49272.qmail@web13208.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040128104243.49272.qmail@web13208.mail.yahoo.com>
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

> Will you help on this i have installed Iptables
> firewall on my mail server with two eth cards eth0
> for internet and eth1 for lan 
> how can i protect from the attacks on 1st feb 
> please help me can i use same rules  if yes 
> $IFACE_INET --????
> $IFACE_DMZ ---???
> can u tell me about this 

The attacks come from MS workstations that are infected by the virus, not
from servers - if all is well.
Assuming for the virus to succesfully start the attack, it has to have
direct access (like NAT) to the internet (thus assuming that these viruses
are not able to find out IE's proxy settings and use it..)

So, do you use a proxy server or NAT for your clients to access the internet
?

If my assumption above is true (I think it is, please correct me if I'm
wrong) and your clients can only use the proxy server then you don't need
any rules as the virus can't reach the internet directly anyway. The attack
will then stop at your default gateway.


Gr,
Rob


