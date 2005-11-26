From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: Port DNATting
Date: Sat, 26 Nov 2005 12:20:09 +0200
Message-ID: <438836D9.5050204@gmail.com>
References: <814141710.20051126124425@progtech.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <814141710.20051126124425@progtech.ru>
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

Oleg A. Arkhangelsky wrote:

>Hello All,
>
>  When I'm trying to do something like this:
>
>  iptables -t nat -I POSTROUTING -p tcp --dport 8080 -j DNAT --to :80
>
>  I get: "iptables: Invalid argument".
>
>  What I want is only to translate destination port of all TCP-packets
>  going to some_ip:8080 into some_ip:80. I don't want to change IP. It
>  seems that syntax of this command is corrent, but... What is wrong?
>
>  Thanks!
>
>  P.S.: Kernel 2.4.31, iptables v1.3.2
>
>  
>
If you want to do that you should read the 
iptables-tutorial.frozentux.net, then use the REDIRECT target:
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to 80

regards,
Georgi Alexandrov

