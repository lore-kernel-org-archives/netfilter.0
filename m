From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: netfilter and proxies
Date: Thu, 14 Oct 2004 17:02:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410141702.00033.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey All,

I'm trying to help a guy on another list with his network configuration but 
he's thrown me a curve. He has a firewall/server on the perimeter with one 
NIC facing an ADSL router and one facing his LAN. Here's his description of 
the problem:

"to internet: no problem, but i have problem to connect with any vhost  
(some virtual domain running in the server) or for send email through my 
email server, using internal pc lan. 
if I try to connect from outside (cybercafe) i don't have any kind of  
problems (i can check my email and i can relay through my server )
Thats why i think the problem start whith the forward rules  define at 
the firewall."

I asked him to give me iptables -L -t nat and -t filter. Here's the output of 
his nat chain:

# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
dpt:http redir ports 3128
REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
dpt:smtp redir ports 3128
REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
dpt:pop3 redir ports 3128
REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
dpt:imap redir ports 3128

I don't use proxies or REDIRECT myself and I'm not sure what he means when he 
says he has a "virtual domain", but this doesn't look right to me. Can he 
have multiple services forwarded to the same port like this?

Jeff

