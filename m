From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: DNAT problem
Date: Tue, 03 Oct 2006 12:11:27 +0200
Message-ID: <BAY103-F2959DFC95676C9CA4F26F6B21C0@phx.gbl>
References: <4521C6A3.1040902@mail.nankai.edu.cn>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4521C6A3.1040902@mail.nankai.edu.cn>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: struggle@mail.nankai.edu.cn
Cc: netfilter@lists.netfilter.org

Bo Yang wrote:

>How to do the balance using nth match , can you give an example ?
>For example , I have a gateway 111.111.111.111 which connected to my
>own LAN .
>And in LAN , I have four machines 10.0.0.1 - 10.0.0.4 to share the ssh
>connection .
>Could you tell me how to balance the ssh flow ?

I haven't exactly understood your question. However this is
an example:

$IPTABLES -t nat -A PREROUTING -d 111.111.111.111 --protocol tcp --dport 22 
-m statistic --mode nth --every 4 -j DNAT --to 10.0.0.1
$IPTABLES -t nat -A PREROUTING -d 111.111.111.111 --protocol tcp --dport 22 
-m statistic --mode nth --every 4 -j DNAT --to 10.0.0.2
$IPTABLES -t nat -A PREROUTING -d 111.111.111.111 --protocol tcp --dport 22 
-m statistic --mode nth --every 4 -j DNAT --to 10.0.0.3
$IPTABLES -t nat -A PREROUTING -d 111.111.111.111 --protocol tcp --dport 22 
-j DNAT --to 10.0.0.4



