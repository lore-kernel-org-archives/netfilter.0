From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: How to "catch" FORWARD packets in POSTROUTING chain?
Date: Mon, 16 Aug 2004 05:25:28 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e504081519253f1a7b1f@mail.gmail.com>
References: <1515101522.20040816035759@op.pl>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1515101522.20040816035759@op.pl>
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

As long as you can "catch" it in FORWARD, i see no reason to catch it
in POSTROUTING, but if you still want this, try that
iptables -t mangle -A FORWARD -j MARK --set-mark 0x1
iptables -t nat -A POSTROUTING -m mark --mark 0x1 .... do stuff


On Mon, 16 Aug 2004 03:57:59 +0200, Marcin Sura <slacklist@op.pl> wrote:
> Hello
> 
>      I have lan (10.0.0.0/8) and server (10.1.1.1 for lan, dynamic ip
>      from my ISP). I use MASQUERADE to allow lan computer connects to
>      internet. eth0 connects to lan, ppp0 for internet.
> 
>      All traffic lan <--> internet passes through FORWARD chain. How
>      can I "catch" this traffic in POSTROUTING chain?
> 
> --
> Pozdrawiam
>  Marcin                         mailto:slacklist@op.pl
> 
> 


-- 
Bla bla

