From: Ian McBeth <imcbeth@telus.net>
Subject: Re: port forwarding problem
Date: 28 Jan 2003 17:56:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043801767.3685.47.camel@blackice.telco.ca>
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
To: netfilter@lists.netfilter.org

Hello.....

I think you must have the SNAT in there as well


-A PREROUTING -p tcp -m tcp -d (external IP) -i eth1 --dport 25 -j DNAT
--to-destination 192.168.0.2:25
-A POSTROUTING -p tcp -m tcp -s 192.168.0.2 -o eth1 -j SNAT --to-source
62.194.25.2:25


-A FORWARD -p tcp -m tcp -d 192.168.0.2 -i eth1 -o eth0 --dport 25

let me know if this helps

Ian

On Tue, 2003-01-28 at 01:14, oarojo@intermediacorp.com wrote:
> hello guys!!! Can someone help me on my problem regarding iptables???
> 
> This has been my problem a month now.. I'm running a redhat 7.3
firewall
> server with two NICs; eth0 facing the internal network (192.168.0.x)
and
> eth1 facing the internet (external network). Now I wish to forward all
> traffic on eth1, port 25 to another to my mail server (say,
192.168.0.2). I
> did something like:
> 
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
> iptables -A FORWARD -p tcp --dport 25 -d 192.168.0.2 -j ACCEPT
> iptables -A PREROUTING -t nat -p tcp --dport 25 -d x.x.x.x -j DNAT
>  --to 192.168.0.2
> 
> Now when i used to test SMTP connection thru telnetting from another
> server... say:
> 
> #telnet xxx.xxx.xxx.xxx 25
> 
> It just stucked in there doesn't continue...
> 
> using nmap on my firewall:
> 
> #nmap xxx.xxx.xxx.xxx -p 25
> 
> it says that port 25 is filtered...
> 
> 
> Is there anything wrong with my iptable rules? I would really
appreciate if
> you can send me your help... thanks!
> 
> 
> Oliver
> 
> 
> 


