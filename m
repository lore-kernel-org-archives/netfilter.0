From: Alexis <alexis@attla.net.ar>
Subject: Re: vpn and pptp
Date: Fri, 20 Feb 2004 21:47:46 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <304347110.20040220214746@attla.net.ar>
References: <Pine.LNX.4.58.0402201702020.23080@most.gfos.hr>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0402201702020.23080@most.gfos.hr>
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
To: Dino Dragovic <dragovic@gfos.hr>
Cc: netfilter@lists.netfilter.org

this is because ip gre tunnel (ip protocol 47) could not be
established.
You neet to apply pptp patch to iptables source and then use it.

please read

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html



Hello Dino,

Friday, February 20, 2004, 1:17:37 PM, you wrote:

DD> Hi,

DD> I have linux Debian (2.4.24 kernel) firewall with nat and iptables.On my
DD> private network there is MS w2000 pptp server. I can connect to it using pptp
DD> from Internet (PPTP) but from only one client at the time.Is it
DD> possible and how to connect through firewall several clients
DD> simultaneously to vpn server? Iptables verison is 1.2.6a-5
DD> When I try to connect while there is already one connection I get
DD> "Verifying username and password" until connection times out.

DD> tx




-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar


