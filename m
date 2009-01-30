From: Payam Chychi <pchychi@gmail.com>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 00:53:54 -0800
Message-ID: <96BE7007-F2F8-45BE-BB1D-6A924A8877DA@gmail.com>
References: <4982B7F3.4020603@cetrtapot.si> <4982BB4D.5020708@unipex.it>
Mime-Version: 1.0 (iPhone Mail 5H11)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:references:message-id:from:to
         :in-reply-to:content-type:content-transfer-encoding:x-mailer
         :mime-version:subject:date:cc;
        bh=hiGKelTHFW/PD7lzPzOLAQwx38rIYZEgky0tBMOHSno=;
        b=nWoQg57UxUg0onV2t0x+TbOiLcsfxxWdXqURZ4ZJLKooLixMJ56any8ABqTyIhXpGD
         naG9D27N1jGPlGXlGRTL7T2WlQWCIdfvmptFGiOSS13zIKkgAZJD3OqBg4QGdkNHEzLo
         cCFNSql6NEswBvEoY55lqDlhFetgZRNLel+FQ=
In-Reply-To: <4982BB4D.5020708@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: Hinko Kocevar <hinko.kocevar@cetrtapot.si>, netfilter@vger.kernel.org

what michele said is correct...this would work since you are utilizing  
the prerouting / nat


Sent from my iPhone

On 30-Jan-09, at 12:33 AM, Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it 
 > wrote:

> Hinko Kocevar wrote:
>> Hi all,
>> I'm an absolute beginner on the netfilter stuff, so please bear  
>> with me here.
>> We have a device running linux 2.6.19 kernel with iptables  
>> installed. It acts
>> a a gateway for a another mobile device that connects to linux  
>> device via irda
>> port - ppp connection. I've managed to port forward telnet port to  
>> mobile device
>> with the help of this page http://kreiger.linuxgods.com/kiki/?Port+forwarding+with+netfilter 
>> .
>> Our customers want to be able to ping the mobile device behind the  
>> linux firewall
>> and IMHO it is not possible for ICMP packets to be forwarded since  
>> it is a protocol
>> by itself (not a TCP/UDP style service).
>> Is it possible to 'port forward' ICMP requests?
>
> Sure? Looking at firsts google reply, you can find
>
> iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p icmp DNAT --to-destination  
> 10.2.1.1
>
> end so on...
>
> Or I miss something?
>
>> Thank you,
>> HK
>
> Michele
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
