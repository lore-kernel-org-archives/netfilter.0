From: Bill Chappell <bill.chappell@critical.com>
Subject: [Fwd: Newbie question about iptables an gateway boxes]
Date: Fri, 01 Aug 2003 21:11:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2B0FBB.3A2295A7@critical.com>
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
To: nflist <netfilter@lists.netfilter.org>

 
Paul Baxter wrote:

> Hi I have a small net at home with linux box as gateway hopefully. I
> can
> ping the net from my windows box and get email...,but web pages
> don't
> open, the DNS numbers are correct in /etc/resolv.conf and it will
> resolve when I  "ping  -c 5 www.atomicmpc.com.au ".
> I am thinking it is todo with my iptables script...here it is;
> Thanks
> for all help Paul


I see one thing you should change and a possible problem.


> # Set proc values for TCP/IP. In order:
> #
> # Disable IP spoofing attacks
>     echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter

I would change the above line to echo "1": I found
a thread in lists.debian.org that says that "2" is not
recognized in the 2.4 kernel,
so as long as we are looking at things.


> ## -- Transparent proxy to Squid --- ##
> #
>
>     $IPTABLES -t nat -A PREROUTING -i $INT_IF -p tcp --dport 80 -j
> REDIRECT --to-port 3128

I looked up linux+Squid on Google, as I have not used Squid yet in my
work, and found the following page that tells how to edit squid.conf for
RedHat:
 
http://www.doc.eng.cmu.ac.th/ldp/solrhe/Securing-Optimizing-Linux-RH-Edition-v1.3/chap28sec231.html
 
It talks about setting Squid to listen on ports 81 and 80.

More to the point here is that if Squid is not listening on port 3128,
either not configured to do so or not running/listening, then
your requests for web pages are just going into the bit bucket (what I
once knew as data heaven, which shows my age), and you
won't get web pages.
email works because it uses port 25, so is not getting REDIRECTed,
so is getting through.

One way to check on your traffic is to run tcpdump, as in
"tcpdump -n -i eth0" (quotes only for emphasis, don't type them)
and see what is traversing your interfaces.


Hope this helps.


--
William Chappell,     Software Engineer,     Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY
13501
315-793-0248  x148  < bill.chappell@critical.com >  www.critical.com

