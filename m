From: "marko" <minimal@mail.ee>
Subject: REDIRECT ports in forward chain
Date: Wed, 10 Jan 2007 20:59:47 +0200
Message-ID: <001201c734e9$8052c1c0$cf00000a@maku>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org


is it possible to change the --dport on a packet that is forwarded through?

for example, two pc's and internet in between. both pc's have linux as 
gateways. both gateways do NAT. now, i'd like to access port 8080 on machine 
A from machine B. for example telnet X.X.X.X 8080. normally i'd have to do a 
DNAT on machine A's gateway for that port, right? but i would like the port 
to change during internet. like i type telnet to port 8080, but linux 
redirects it to port 18080 on machine B's network and on machine A's gateway 
i'd have to a DNAT from 18080 to 8080. so i'd telnet to 8080 seemingly, the 
linux B redirects it to 18080 and it travels over the net to linux A to port 
18080 and the it is DNAT'ed to 8080 to machine B. but the redirection 
doesn't work. as i understood if i redirect on nat table's prerouting chain 
the packet the travels to INPUT chain instead on FORWARD chain.

marko. 


