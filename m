From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Firewall & Dynamic IP
Date: Fri, 21 Feb 2003 14:03:50 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302211355550.20166-100000@shortcircuit.dyndns.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok. I've seen a lot of stuff on the web about Dynamic IP address 
firewalls. Here's what I'm trying to accomplish. I hope someone can help 
me. And please Copy me as I am not on the list.

I have two interfaces:
eth0 - Internal: Static at 192.168.0.1
eth1 - External: Dynamic

What I want is to enable IP Masquerading (so that machines on the 
192.168.0.0/24 network can see the internet), and to specifically foward 
inbound traffic on port 5000 to machine 192.168.0.2. Plus I want decent 
security so that any traffic that comes in that is not something I 
typically expect (see list below) it gets dropped.

Thanks!
--- Dan

Services I expect to send/recieve for:
FTP, SSH, Telnet, SMTP, Printer*, Mysql*, Samba*, pgpKeyserver, squid, 
rndc, daytime, pop3, imap4, http, domain, X11

Note: services marked with a * are internal only. Traffic on eth1 for 
those services should be dropped.



