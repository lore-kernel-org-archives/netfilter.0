From: Jackfritt <jackfritt@boh.de>
Subject: length match problem
Date: Wed, 08 Jan 2003 23:14:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1CA2BF.6050707@boh.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ok I have the following problem.

iptables -A OUTPUT -o ppp0 -p tcp -m length --length :40 -j MARK 
--set-mark 10

That should mark all ACK's or not ?

When I try to do this I get the error:

iptables: Invalid argument

I found out that this has something to do with the length match.
Because not used I don't get an error message. I looked around and found 
an example in netfilter-extensions-HOWTO with icmp:

iptables -A INPUT -p icmp --icmp-type echo-request -m length --length 
86:0xffff -j DROP

When I try to do something like this it doesn't work too :(

So now my question is what am I doin wrong ?

Sorry I'm not an iptables guy an I only tried a script from somewhere 
else. But this one line doesn't work.

anyone can help me ?


Thx


Joerg Esser


