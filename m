From: Abdul-Wahid Paterson <abdulwahid@gmail.com>
Subject: Re: Multiple iptables exceptions?
Date: Thu, 23 Sep 2004 16:59:52 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <995fcdb0040923085916643d3a@mail.gmail.com>
References: <bc9fb38004092308087dc97b87@mail.gmail.com>
	<4152EA7B.3010802@pbl.ca>
Reply-To: Abdul-Wahid Paterson <abdulwahid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4152EA7B.3010802@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

I think it is better to do it this way incase there are other rules
that need to be traversed in the PREROUTING chain.

iptables -t nat -N MS
iptables -t nat -A MS -d 207.46.0.0/16 -j RETURN
iptables -t nat -A MS -d 64,4,0,0/16 -j RETURN
iptables -t nat -A MS -j DNAT --to-destination 10.1.1.3:80
iptables -t nat -A PREROUTING -j MS

Regards,

Abdul-Wahid


On Thu, 23 Sep 2004 10:23:39 -0500, Aleksandar Milivojevic
<amilivojevic@pbl.ca> wrote:
> Jaret wrote:
> > conceptually what im looking for is something like this...
> >
> > IPTABLES -t nat -A PREROUTING -s 10.1.1.2 -d ! 207.46.0.0/16,
> > 64.4.0.0/16 --proto tcp --dport 80 -j DNAT --to-destination
> > 10.1.1.3:80
> 
> You can try using user defined chain.  Add source, protocol and port
> options back into three PREROUTING rules, I left them out for clarity:
> 
> iptables -t nat -N MS
> iptables -t nat -A MS -j ACCEPT
> iptables -t nat -A PREROUTING -d 207.46.0.0/16 -j MS
> iptables -t nat -A PREROUTING -d 64.4.0.0/16 -j MS
> iptables -t nat -A PREROUTING -j DNAT --to-destination 10.1.1.3:80
> 
> --
> Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
> Systems Administrator                           1499 Buffalo Place
> Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
> 
>

