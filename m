From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Load balancing.
Date: Sun, 03 Apr 2005 22:23:25 -0500
Message-ID: <4250B32D.6040703@riverviewtech.net>
References: <004e01c53881$c1adb2d0$88161753@szpaq>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004e01c53881$c1adb2d0$88161753@szpaq>
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
To: szpak <xperience@interia.pl>
Cc: netfilter@lists.netfilter.org

You are wanting something like Equal Cost Multi Path routing and it's corresponding "ip route" commands.



Grant. . . .

szpak wrote:
> Hello.
> 
> I need help with I think something very easy to do with Iptables.
> 
> I need to have load balancing via nat for two or more ISP as in chart:
> 
>                            ------ ISP1
>                           |          128.0.0.0/30        
> <MY NET>---->[Linux NAT]-------- ISP2
> 192.168.0.0/24     |      80.0.0.0/30
>                            ------ ISP3
>                                    85.0.0.0/30
> 
> I have some users on my side and I want them to simply load balance trafic
> from them via those three ISP's.  How to do that, is there a way to have three default static routes?
> 
> Thank You for any help it will be very usefull.
> 
> Xperience
> 
> 
> 

