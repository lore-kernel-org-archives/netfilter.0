From: Jason Cook <jg0327@yahoo.com>
Subject: Port Redirection with iptables
Date: Tue, 16 Dec 2003 07:21:52 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031216152152.37192.qmail@web41114.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: cookj@dennis.capemayschools.com

I am trying to install Linux as a firewall and caching
server with iptables and Linux.  I 
need to do this transparently.

I installed Red Hat Linux 9.  Ran all of the updates
nice and smooth.  Turned on ip forwarding.  
Configured Squid...and tested it by specifying the
servers ip address and port 3128 from the 
browser.  Works great.  Here the options I had changed
in the config file.

http_port 3128
http_access deny to_localhost
acl our_networks src 10.0.0.0/8
http_access allow our_networks
httpd_accel_host virtual
httpd_accel_port 80
httpd_accel_with_proxy on
httpd_accel_uses_host_header on

For iptables I used 
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport
80 -j REDIRECT --to-port 3128

I then try to browse the internet from a client
through the firewall and nothing.

When I run iptables -t nat -nv -L

Chain PREROUTING (policy ACCEPT 31254 packets, 3971K
bytes)
 pkts bytes target     prot opt in     out     source 
             destination
    0     0 REDIRECT   tcp  --  eth1   *      
0.0.0.0/0            0.0.0.0/0          tcp dpt:80
redir ports 3128

PREROUTING is accepting packets...but none are
processes by the redirect rule.


I've been pulling my hair out for about a week.  Can
anyone help?  

__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/

