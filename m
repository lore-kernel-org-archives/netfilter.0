From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: Re: nat no traffic returns
Date: Wed, 21 May 2003 23:33:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.0.0.25.0.20030521231242.04120e20@pop.atz-hosting.nl>
References: <5.0.0.25.0.20030521161513.04adceb0@pop.atz-hosting.nl>
 <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
 <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
 <5.0.0.25.0.20030521161513.04adceb0@pop.atz-hosting.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053544772.1913.28.camel@kermit.spenneberg.de>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


> > iptables -P FORWARD DROP
> >
>You are only allowing packets through the forward chain in the direction
>eth1->eth0.
>There is no packet allowed in the other direction.
>iptables -A FORWARD -i eth0 -o eth1 -d 10.0.0.112 -m multiport --dport
>3389,21,80 -m state --state NEW -j ACCEPT
>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Thank you for your reply, you are right.. but it didn't help..

Been looking a bit further.. again.. iptables -v -L tells that packets are 
forwarded to eth1, on eth1 I notice that the TX bytes is increasing but the 
RX are stable at the same value.
Would it be correct to assume this is not an iptables issue but an issue of 
the box behind the Linux box?

TIA,

B.


