From: Silkk <crystaldrinker@yahoo.com>
Subject: Tring to setup my firewall for my lan as a DNS server!
Date: Tue, 14 Jan 2003 15:40:04 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114234004.59580.qmail@web40611.mail.yahoo.com>
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

Hi,

Ok i have a simple LAN. I have one machine connected to the INTERNET running Redhat
7.3(2.4.20) with iptables 1.2.7a (Firewall+Router) and 2 windows machines behind
it(192.168.0.10 and 192.168.0.11)also with internet access. But the windows machines have
there configuration set up soo that there DNS server is the ISP DNS servers
207.12.67.100

But i have the firewall machine set up as a DNS server. Sooo i want the windows machines
to have the firewall machine as there DNS server.
What would be an example rule set for iptables for this? Soo the DNS request go from the
windows machines to the Firewall machine instead of directly going to the internet!

Thanks 
 

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

