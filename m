From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: iptables rules
Date: Thu, 15 Sep 2005 17:33:44 +0200
Message-ID: <43299458.1000205@mnemon.de>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>	<Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>	<1123704837.3708.1.camel@ndspc131.p.n-dsi.com>	<1126649450.4790.5.camel@ndspc131.p.n-dsi.com>	<1126797736.4790.24.camel@ndspc131.p.n-dsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1126797736.4790.24.camel@ndspc131.p.n-dsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

For the sake of completeness :)

Peggy Kam wrote:
> Hi,
> 
> I have defined the following firewall rule in iptables:
> 
> iptables -I FORWARD -s 192.168.22.102 -d 192.168.1.112 -p tcp -m tcp -m
> multiport --ports 22,23,24,25 -j ACCEPT
> 
> why were the packets able to get to 192.168.1.112 on port 22 when the
> packets does not even come from ports 22,23,24 or 25?

man iptables:

multiport

...

       --ports [!] port[,port[,port:port...]]
               Match if either the source or destination
               ports are equal to one
               of the given ports.

So, this is expected behavior, provided that there are no other rules
in the way.

HTH,

Joerg



!DSPAM:43299390313231087616080!

