From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: propper logging and dropping
Date: Fri, 16 Oct 2009 09:33:15 +0200
Message-ID: <4AD821BB.6060205@chello.at>
References: <4AD7E857.6020100@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD7E857.6020100@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: rcblach@gmail.com

netfilter-owner@vger.kernel.org wrote:
> Good evening,
>
> I currently have the following macro.
>
> /sbin/iptables -N LOGDROP
> /sbin/iptables -A LOGDROP    -i wlan0 ! -s 10.0.0.2 -j LOG --log-level 
> info
> /sbin/iptables -A LOGDROP -j DROP
> /sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
> LOGDROP
>
> What I really wan to do is log address and excluding certain subnets, 
> and address, but drop others on offending networks.
> So I want to log addresses to wlan0 whose source address is not 
> 10.0.0.2, but drop subnets which I exclude.
>
> What is the best way to do this
>
>  Thanks
>
> Chip
>

If I get your question right:

$IPT -N LOGDROP
$IPT -A LOGDROP -s 10.0.0.2 -j RETURN
$IPT -A LOGDROP -j LOG --log-level INFO
$IPT -A LOGDROP -j DROP

$IPT -A INPUT -i wlan0 -s 10.0.0.0/24 -j LOGDROP
$IPT -A INPUT -i wlan0 -s 58.102.198.29/24 -j LOGDROP
...

Regards

Mart

