From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 1 Dec 2005 07:44:25 +0100
Message-ID: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
References: <08d001c5f628$769fb530$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <08d001c5f628$769fb530$5e00800a@printserver>
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

> Thomas Kuiper said:
>> Jesse,
>> 
>> I think his problems has nothing to do with iptables but routing in
>> general. 
>> 
> 
> Thomas,
> 
> Ahh. I guess he did use the word "route" didn't he! I should pay more
> attention. 
> 
> I just figured that since packets were going to be going in
> one eth and out another, that iptables had to be involved. :-)

You are correct : if forwarding is not allowed between eth1 and eth2,
those networks can't communicate.
So this is Netfilter related.

>>>> eth0 - my WAN ip.
>>>> 
>>>> eth1 - 192.168.0.0  My kids network
>>>> eth2 - 192.168.1.0  My personal network
>>>> 
>>>> How can I route packets to and from my network of
>>>> 192.168.1.x (eth2)
>>>> to my kids network 192.168.0.x (eth1) so that we can all play
>>>> network games???
>>> 
>>> 
>>> You may get away with simply enabling forwarding between eth1 and
>>> eth2, something like this might allow both the *.1.x and the *.0.x
>>> networks to communicate with eachother:
>>> iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
>>> iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT

Make sure that these rules are among of the first of your FORWARD chain,
so there's nothing that can block it anyhow.


Gr,
Rob


