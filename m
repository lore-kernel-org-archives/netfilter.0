From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding packets to another private gateway.
Date: Thu, 24 Jun 2004 15:51:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406241551.22322.Antony@Soft-Solutions.co.uk>
References: <s0daa508.020@mail.toolsnottoys.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0daa508.020@mail.toolsnottoys.com>
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

On Thursday 24 June 2004 3:08 pm, Reginald NALLARATNAM wrote:

> Hello,
>
> I have Linux box @ 192.168.3.1 with acts as a firewall, there is another
> firewall @ 192.168.1.1 which acts as a vpn to another network 192.168.2.0
>
> I have a citrix server on 192.168.3.11 with a default gateway of
> 192.168.3.1. I need to access other machines in the 192.168.2.0 subnet
> remotely from this citirx server. My question is what rule must I add in
> the 192.168.3.1 Linux firewall to forward any trafic going to 192.168.2.0
> network to 192.168.1.1.

route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.1.1

Regards,

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.


