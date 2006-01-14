From: Davis Sylvester <dsylvesteriii@yahoo.com>
Subject: EMAIL and NAT HELP
Date: Fri, 13 Jan 2006 23:27:46 -0800 (PST)
Message-ID: <20060114072747.48053.qmail@web54705.mail.yahoo.com>
Reply-To: dsylvesteriii@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I am trying to run our qmail E-Mail server behind our
firewall.  Our firewall is a linux box running
iptables.  The current configuration is as following:

Firewall
Eth0:  10.10.10.1  --- Internal LAN
Eth1:  208.10.10.1 --- Primary Internet
Eth1:0: 208.10.10.2 --- Alias for web (listed in DNS)
Eth1:1  208.10.10.3 --- Alias for E-mail (listed in
DNS)

Email Server
Eth0:   10.10.10.100

Web Server
Eth0:   10.10.10.200

Basically I need every packet that arrives on
Ethernet1:1 using ports 110,25,143 forwarded to
10.10.10.100.  10.10.10.100 then needs to reference
all it packets to 208.10.10.1 when send back to
internet community.

Thanks in advance for all the HELP and ASSISTANCE!!!




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

