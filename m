From: Michael Gale <mgale@utilitran.com>
Subject: Re: default policies for the NAT chains
Date: Tue, 2 Dec 2003 18:29:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202182957.02067f1f.mgale@utilitran.com>
References: <20031202180302.32601c1d.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202180302.32601c1d.mgale@utilitran.com>
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

Hello,

	Let me explain how my firewall rules work -- it most likely will help in the answer to my question.

When the firewall starts it sets up some basic target and a large amount of user chains.

I have 24 chains -- ok not that many

Here are the following chains (not all):

tablerule-ext : this is a chain rule setup the filters incoming packets regardless of destination, here I weed out any unwanted packets or connections. Any matching packets are logged then drop.

tablerule-extpri : this chain is only for packets destination to the heartbeat address. Here only heartbeat packets are matched and everything else dropped.

tablerule-extVIP : I have one chain for every virtual IP, depending on the destination IP of the packet. will depend on what chain it is forwarded to.

So the main filter table has rules that most forward packets to other chains.

Any example is if a packet wants to come in, go out or be forwarded for 172.16.15.56:
1. It goes to the tablerule-ext and checked to make sure the packet is in good standing (TCP flags, port range, from - to ...) if accept it is returned

2. Then it goes to the tablerule-56 chain where it is either dropped or accept depending on the traffic I want for the .56 address.

This way I can easily administer any IP address with out affecting any other connection. Since almost everything is chain based I have flush and change chain rules for block them very easily.

So do I still need to have a default policy for the NAT table chains ?

Michael.


On Tue, 2 Dec 2003 18:03:02 -0700
Michael Gale <mgale@utilitran.com> wrote:

> Hello,
> 
> 	Ok -- I had my firewall working perfectly with a default policy in affect:
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> It was also working great for the 22 virtual IP addresses.
> 
> I then though about the NAT chains (PREROUTING,OUTPUT and POSTROUTING) and figured they should have a default policy as well.
> 
> I added that to the list and not I can not start a out going connection from the firewall.
> 
> So my question is do I need default policies for the NAT chains ? If so it would seem like I need some rules added twice ? 
> 
> Any suggestions would be appreciated :)
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

