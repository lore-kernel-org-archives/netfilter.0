From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: How to make a computer invisible
Date: Sun, 30 Nov 2003 16:32:29 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006301c3b778$b22259a0$8b00000a@casa>
References: <20031130181240.GD6930@zeus.tpfm.de>
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
To: Thomas Preissler <tomjohn@gmx.de>, netfilter-user Mailinglist <netfilter@lists.netfilter.org>


    AFAIK, iptables can use some 'layer 2' information such as MAC Address
for doing some filtering in some tables, but it CANT be used for filtering
those 'layer 2' packets. That means iptables CANNOT modify ARP/RARP
behavior.

    Sincerily,
    Leonardo Rodrigues

----- Original Message ----- 
From: "Thomas Preissler" <tomjohn@gmx.de>
To: "netfilter-user Mailinglist" <netfilter@lists.netfilter.org>
Sent: Sunday, November 30, 2003 3:12 PM
Subject: How to make a computer invisible


> Hello folks,
>
> how do I really make a computer totally invisibly as it would be
> when it does not exist?
>
> It is clear, that the simplest solution is to DROP all incoming
> packets, but what's about (R)ARP packets? Can they be blocked anyway?
>


