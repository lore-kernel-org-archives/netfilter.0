From: "David Busby" <busby@pnts.com>
Subject: Re: filter p2p
Date: Mon, 16 Jun 2003 14:11:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <056701c3344b$efeeebf0$1100000a@busbydev>
References: <E19Ricd-0004kA-00@kashyyyk.netfilter.org>
Reply-To: "David Busby" <busby@pnts.com>
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
Content-Type: text/plain; charset="us-ascii"
To: gbj <gbj@glc.cn.net>, netfilter@lists.netfilter.org

I'd set my iptables to something like:

# Drop _all_ packets
iptables -t filter -P FORWARD DROP
# Allow http
iptables -t filter -A FORWARD -p tcp -m tcp --dport 80 -j ACCEPT
# Many more rules here to allow all the other s41t.



----- Original Message ----- 
From: "gbj" <gbj@glc.cn.net>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, June 15, 2003 18:16
Subject: filter p2p


> hello everyone,I have a lan with a gateway iptables firewall,and I don't
want the user on the lan use P2P software like e-donkey ,because I think
it's will led to some administration  proplem.but I don't know how to setup
iptables rules to archieves this goal,does anybody has the same experience?
>
>
>
>
>
>                   sword
>
>
>


