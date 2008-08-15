From: Philipp Periventas <coin3d@gmail.com>
Subject: Re: "NAT redirection", or NAT from inside to inside?
Date: Fri, 15 Aug 2008 12:31:38 +0200
Message-ID: <91417772-9FB8-4F64-88A4-80F2F84B35D2@gmail.com>
References: <bcc0d0530808140217y37de308cj5bee8c0b64971a4c@mail.gmail.com> <48A4D815.2050708@riverviewtech.net>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :in-reply-to:content-type:content-transfer-encoding:mime-version
         :subject:date:references:x-mailer;
        bh=bXHxFxkBiMJs7CnajmhdZl+3vXLVXoz792NFHwGipIQ=;
        b=KVHxnFFq0OtM1JX5E8OPxQFNl7Iia9ba9rOlLusCgv75ehjk3X3RVlxrwHjOIcsEe+
         k7vFPvWifbLOwszXBdZp7VvUu9ZPjgl53YOEElt4GieSH9PufUBEhj/smVNQpejJSfc6
         tFrSDjUWY/e8qjzsK6c01//0Pr/glL5XUZKsY=
In-Reply-To: <48A4D815.2050708@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hello Grant,

thank you very much for your mail and your effort! I finally solved  
the problem with exactly the commands you wrote in your mail, plus a  
command for letting the firewall itself getting access to the  
webserver by manipulating the NAT output chain. I found this advice on  
the website http://iptables-tutorial.frozentux.net/chunkyhtml/ 
x4033.html - unfortunately, I found it a bit too late!

The website also addresses the problem with "manipulated logs" - but I  
guess by defining a source LAN address (like you did) I can live with  
this constraint...

Damn! There should be special term for this kind of stupid - yet easy  
to solve problem, because I was looking and asking for about a whole  
week in forums, irc channels and so on...

So, over again, thanks!


On Aug 15, 2008, at 3:12 AM, Grant Taylor wrote:

> On 8/14/2008 4:17 AM, Philipp Periventas wrote:
>> I've got a server, running two virtual machines on it. The server  
>> itself serves as router. I forwarded some ports, among port 80 to  
>> one of the machines. The port forwarding works fine from the  
>> outside (from the WAN, e.g. my computer at home) - but what doesn't  
>> work is the access to the forwarded port 80 from INSIDE using my  
>> external IP. That means, when I try to use lynx from my webserver,  
>> and enter the external IP, it says connection refused.
>
> *nod*  I (loosely) refer to this a "looping through its self" type  
> of problem.
>
> /Usually/ port forwarding is associated with the incoming interface  
> and the destination IP.  So, when you have traffic coming in (to the  
> NATing config) from the WAN the external interface is matched  
> everything works fine.  However when you have traffic coming in (to  
> the NATing config) from the LAN the external interface is not  
> matched and as such NATing is not done.  Thus you end up with  
> traffic coming in to your router that is not DNATed any where and  
> thus coming directly in to the router which does not have any thing  
> listening on it.
>
> To work around this, you will need to either not care about the  
> incoming interface, or handle each incoming interface  
> appropriately.  You can not care by removing the interface portion  
> of your DNAT rule.  However when you do this, you will DNAT any  
> traffic destined to your external IP over to an internal system.   
> The problem is that when you are DNATing internal traffic to an  
> internal host, the internal host will reply directly back to the  
> original internal client.  This may seem ok, but the internal host  
> will reply with it's internal IP as its the source IP of the packet,  
> which is not what the original client is expecting.
>
> You can get around this "TCP Triangle" (as I and others call it) by  
> SNATing traffic before it is DNATed to the internal host.  However  
> I'm betting that you do not want to SNAT your external requests.   
> So, this is why I say handle your internal and external DNATing  
> separately.  Have the external requests DNATed to the internal host  
> as they are and have your internal requests DNATed to the internal  
> host and SNATed to the internal IP of the NATing router.  By SNATing  
> your internal traffic the internal host will see the traffic as  
> coming from the router and will reply there which will allow the  
> router to unDNAT the traffic and send it back to the original  
> internal client.
>
> You may be able to get away using a common DNATing rule (in the  
> PREROUTING chain) that does not match any interfaces while using a  
> SNATing rule (in the POSTROUTING chain) that will SNAT any traffic  
> that is both from and to the internal network.  This way any traffic  
> that comes into the router from the local LAN that is redirected  
> back out to the local LAN will pass back through the router on its  
> return trip back to the original client.
>
>> I tried to rebuild the problem with my own home linksys router, but  
>> it worked! Then I found an option called "Filter Internet NAT  
>> Redirection" in my linksys webinterface, and after activating that,  
>> it didnt work any longer.
>
> I wonder if the Linksys router is SNATing / MASQUERADing any traffic  
> from the LAN that is being DNATed back to the LAN.  This rule would  
> be based on source and destination IP.  If this rule is not based on  
> the interface, it would be trivial to spoof IPs on traffic coming in  
> the external interface and thus potentially be an exploit vector,  
> thus we would want to have the option to filter this type of  
> spoofing.  I'm not quite sure how they came up with the name "Filter  
> Internet NAT Redirection", unless it means to apply the NAT rules in  
> such a way as they do care what interface they come in on.
>
>> Finally, I'm looking for the iptables command(s) which offer  
>> exactly the same features as my linksys router does - permitting  
>> LAN-clients to access LAN-services by using the EXTERNAL ip of the  
>> router.
>
> I don't have a way to test this at the moment, but I believe the  
> following two types of rules would do what you are wanting to do.
>
>   iptables -t nat -A PREROUTING -d $WAN_IP -p TCP --dport 80 -j DNAT  
> --to-destination $Internal_Server:80
>
> and
>
>   iptables -t nat -A POSTROUTING -s $LAN -d $LAN -j SNAT --to-source  
> $LAN_IP
>
> or
>
>   iptables -t nat -A POSTROUTING -s $LAN -d $LAN -j MASQUERADE
>
>> Has anyone an idea how to resolve this "problem"?
>
> Again, I /think/ I understand what the problem is but I'm not 100%  
> positive.  Also I don't currently have a way to test this.  (Do to  
> "Life Happening" I'm currently using $hit-sco routers for my NATing  
> needs. Yes I'm sorry for it too.)
>
>> Thanks in advance
>
> *nod*
>
> You are welcome.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

