From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Redirect-pop3
Date: Fri, 30 Jun 2006 21:56:56 +0300
Message-ID: <44A573F8.4050308@zoomnet.ro>
References: <002701c69c69$445db990$0200640a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002701c69c69$445db990$0200640a@casa>
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
To: Andrea Bencini <andrea.bencini@tin.it>
Cc: netfilter@lists.netfilter.org

Andrea Bencini wrote:

>I have firewall (iptables) in my network (10.100.0.0/24) with iface eth0 in
>local network and eth1 in external network (Internet).
>eth0-->10.100.0.1-->default gateway for my local network.
>My clients download mail (pop3).
>I would like install p3scan into linux server (10.100.0.250) in my network
>. This package listens on 8110 port and scans e-mails with clamav.
>Without changing any configuration on my clients, the firewall should
>redirect all mail download requests (pop3) to p3scan (port 8110); after
>p3scan will download mails, will controll them and will deliver them to the
>clients.
>Other info:
>Kernel-2.6
>iptables-1.3.0
>Which are the rules that I must implement on the firewall?
>Thanks
>Andrea
>
>
>  
>
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 110 -s
10.100.0.250 -j  ACCEPT
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 110 -s
10.100.0.0/24 -j DNAT --to 10.100.0.250:8110
#iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 8110 -s !
10.100.0.1 -d 10.100.0.250 -j SNAT --to 10.100.0.1

The problem with pop3 is that it is not like HTTP. Requests to pop3
servers does not contain the remote address. The rules above just
redirect requests to 10.100.0.250, but p3scan will probably have a
static setup for wich pop3 server to use to make the user/pass checks.
If you change port 110 to port 80 to some squid machine, it will work
for sure for any HTTP request.

