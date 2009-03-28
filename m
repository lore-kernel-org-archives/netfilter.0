From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: NAT and openvpn
Date: Sat, 28 Mar 2009 09:22:43 +0100
Message-ID: <49CDDE53.9040305@chello.at>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>  <1238207986.285131659@192.168.1.202>  <20090328025132.56657521.g@imagination.eu.org> <1238220237.911422960@192.168.1.202>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1238220237.911422960@192.168.1.202>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

% iptables -t nat -A PREROUTING -s $VPNIP -j SNAT --to-source $PUBIP
> % iptables -t nat -A POSTROUTING -s $PUBIP -j DNAT --to-destination $VPNIP 


>hanks for the reply ... when I try that I get:

>	mothership:~# iptables -t nat -A PREROUTING -s 10.8.0.2 -j SNAT --to-source <ip omitted>
>	iptables: Invalid argument



jason.faulkner@mailtrust.com wrote:
>> iptables: Invalid argument
>>     
>
> Perhaps this? http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.20
>
> --
> Jason Faulkner 
> Linux Systems Engineer
> Mailtrust, a division of Rackspace
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
good morning guys:
   DNAT
       This  target  is  only  valid  in the nat table, in the 
PREROUTING and OUTPUT chains

   SNAT
       This  target  is  only  valid  in the nat table, in the 
POSTROUTING chain.

not the kernel suddenly breaking.
RTFM! :)

everybody sleeping? ;-)

greets

Mart
