From: Jeremy Hansen <jeremy@skidrow.la>
Subject: Re: Routing LAN to external IP from behind NAT
Date: Fri, 13 Jan 2017 14:13:11 -0800
Message-ID: <9D4BC192-04C4-4ADA-B4E4-68F6DCA1E728@skidrow.la>
References: <F7FF15A4-8565-43D9-985B-5F66DCC224B6@skidrow.la>
 <28e62ab70eb5ea675eaca3a1fa08e52b@killock.net>
 <675323d5f1ce20d6205e49b0bc784663@killock.net>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skidrow.la; h=
        x-mailer:references:message-id:content-transfer-encoding:date
        :date:in-reply-to:from:from:subject:subject:mime-version
        :content-type:content-type:received:received; s=foo; t=
        1484345594; x=1486159995; bh=RbHdw5LOtTS6KSAQYyQ7p3K6ezha1SaUaLp
        yhtcyg1I=; b=QxbGWZoveFwpI2paca9B8xjlXZuxVuPXZotdlDCOOFJiY0+GLKI
        IJHnC5lSMc4Xa+JggVK8z3qLTKuyyk97KANVjjYGePfjwUKGZJ+I9mkGvO1Y0jcz
        yRYn2tXNVfs5VO+ikM46udc/JY8OzyC0RGp1pUqLb1lSrN3qIsOyIlX4=
In-Reply-To: <675323d5f1ce20d6205e49b0bc784663@killock.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Matt Killock <lists@killock.net>

This works perfectly.  Thank you very much!

-jeremy

> On Jan 13, 2017, at 2:25 AM, Matt Killock <lists@killock.net> wrote:
> 
> On 2017-01-13 10:25, Matt Killock wrote:
>> On 2017-01-13 09:14, Jeremy Hansen wrote:
>>> What do I have to
>>> do with iptables so I can access these things from within the LAN
>>> without having to do something like fake dns so it uses internal IPs
>>> to access these hosts and ports?
>> You'd need to do some careful NAT'ing.
>> First you'd need to direct traffic arriving on the internal interface
>> from the LAN hosts to each of those IP address, and DNAT to the
>> relevant internal host IP. Something like
>> iptables -t nat -A PREROUTING -i $LANIF -s $LANSUBNET -d
>> 111.114.34.128 -p tcp --dport 80 -j DNAT --to $LANSERVER
>> You need to narrow down the interface/destination host/port as much as
>> possible to stop this interfering with any general NAT rules you have
>> got. Next you'd need to SNAT the traffic that you've just DNAT'd so
>> that it appears to come from the firewall host
>> iptables -t nat -A POSTROUTING -o $LANIF -s $LANSUBNET -d $LANSERVER
>> -p tcp --dport 80 -j SNAT --to $FWLANIP
>> These rules would need to come before any general NAT rules.
>> $LANIF = your internal LAN interface
>> $LANSUBNET = internal subnet
>> $LANSERVER = internal LAN IP of your server
>> $FWLANIP = the LAN IP on your firwall
>> Matt
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

