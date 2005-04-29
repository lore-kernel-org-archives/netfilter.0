From: jonathan <support-squid@bfinance.fr>
Subject: squid + fwmark problem
Date: Fri, 29 Apr 2005 12:24:28 +0200
Message-ID: <1114770268.2852.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi, 
I am running a squid transparent proxy on the same server than a
iptables firewall. 

I have two internet connections on the server and of course another one
for th local network. 
I use meta-data marking (netfilter / fwmark) to route the packets to
ISP1 or ISP2 according the destination port. 

It works very well if the proxy is inactive, but when I activate squid
(with port redirection), packets are going to any output interface
ignoring the packet marking rules. 

But now I am "terrify" because I have just read in this mailing list
that squid doesn't support the meta-data marking. 

Is that right and why ? does anybody have used both successfully ? Is
there another solution for my problem ? 

thanks a lot for helping a squid newbie...

PS: sorry for my poor english.




