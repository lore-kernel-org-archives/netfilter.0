From: Guilherme Cesar Soares Ruppert <ruppert@las.ic.unicamp.br>
Subject: How to drop ping silently??
Date: Thu, 27 Jan 2005 10:14:47 -0200 (BRST)
Message-ID: <Pine.LNX.4.61.0501270958520.18509@quasar.las.ic.unicamp.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


When I filter echo requests (pings) in the OUTPUT chain, the ping program 
says "sendmsg: Operation not permitted".

% iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
% ping 10.1.1.2
PING 10.1.1.2 (10.1.1.2) 56(84) bytes of data.
ping: sendmsg: Operation not permitted
ping: sendmsg: Operation not permitted
...

Is there any whay to drop these packet silently, without let the ping know 
that he was blocked. I am programamming an application and I need this 
behavior. I want that ping believes that his packets were sent, but in 
fact, they were dropped.

Is it necessary to write a netfilter module to do that? Or is that 
impossible to do in the netfilter architecture?

Tks

Guilherme Ruppert


