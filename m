From: Eric Joe <sysop@tje1.com>
Subject: Re: Tring to setup my firewall for my lan as a DNS server!
Date: Tue, 14 Jan 2003 18:52:01 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301141850580.15521-100000@ns2.tje1.com>
References: <20030114234004.59580.qmail@web40611.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114234004.59580.qmail@web40611.mail.yahoo.com>
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
To: Silkk <crystaldrinker@yahoo.com>
Cc: netfilter@lists.netfilter.org

Umm,
Why dont you just point the Windows machines DNS settings to your Redhat 
box's IP? No rules needed.


Eric


On Tue, 14 Jan 2003, Silkk wrote:

> Hi,
> 
> Ok i have a simple LAN. I have one machine connected to the INTERNET running Redhat
> 7.3(2.4.20) with iptables 1.2.7a (Firewall+Router) and 2 windows machines behind
> it(192.168.0.10 and 192.168.0.11)also with internet access. But the windows machines have
> there configuration set up soo that there DNS server is the ISP DNS servers
> 207.12.67.100
> 
> But i have the firewall machine set up as a DNS server. Sooo i want the windows machines
> to have the firewall machine as there DNS server.
> What would be an example rule set for iptables for this? Soo the DNS request go from the
> windows machines to the Firewall machine instead of directly going to the internet!
> 
> Thanks 
>  
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 


