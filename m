From: Enrique Augusto Tobis <etobis@dc.uba.ar>
Subject: Squid +iptables + apache
Date: Tue, 20 Sep 2005 01:57:11 -0300
Message-ID: <200509200157.11810.etobis@dc.uba.ar>
Reply-To: Enrique Augusto Tobis <etobis@dc.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-disposition: inline
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

Hi!

I've been looking for a solution to this problem, but I haven't been able to 
find one. Any ideas?

I have a small home network. I recently set up an old pc as out gateway. I 
have

192.168.0.3 connecting to the internet, running squid, and acting as the 
firewall/gateway (using nat).
192.168.0.1 running apache.

I want to use squid in 192.168.0.3 as a transparent proxy. So far, that works. 
That is, traffic from the 192.168.0.0 network is processed transparently 
by .0.3 

I also forwarded connections to port 80 on .0.3 to .0.1, which is running the 
web server. I can successfully access that web server from outside the 
network.

To sum it up, almost everything is working as it should. But, if I try to 
access 192.168.0.3 from INSIDE the network, I get an error from squid...

I activate the transparent proxy with
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 
8080   

and forward the port 80 connections with 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.0.1:80     

in that order.

Any ideas?
Thanks!
Enrique

