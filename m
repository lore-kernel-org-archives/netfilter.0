From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: VPN and iptables rules
Date: Tue, 04 Nov 2003 21:41:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068000113.7813.43.camel@tarkus>
References: <3FA7BE9D.1000202@aiqa.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3FA7BE9D.1000202@aiqa.com>
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
To: Ozgur AKAN <akan@aiqa.com>
Cc: netfilter@lists.netfilter.org

Try pinging from a machine behind the server the tunnel is terminated
on.

Ted
On Tue, 2003-11-04 at 09:58, Ozgur AKAN wrote:
> Hi,
> I have a installed pptpd, mppe to my RedHat 9.0. 
> 
> real ip`s
> 
> 212.2.212.1 --------------- 195.111.111.1
> 
> vpn ip`s
> 
> 192.168.77.11 ------------ 192.168.77.1
> 
> I open protocol gre, and tcp port 1721 at my firewall to establish a
> connection between client and linux firewall. Client is a windows xp.
> 
> After dialing my isp my winxp connects to internet and gets
> 212.2.212.1. I establish the vpn connection to linux firewall.
> Everything is ok until this point.
> 
> My problem is I can not ping the server from client or vice versa.
> 
> What shall i do?
> 
> thanks,
> Ozgur AKAN


