From: =?ISO-8859-1?Q?Remzi_AKY=DCZ?= <linuxliste@gmail.com>
Subject: Re: how to access port forwarded server through internet ?
Date: Tue, 15 Mar 2011 15:16:18 +0200
Message-ID: <4D7F66A2.1080804@gmail.com>
References: <20110315175928.4dbbe83c@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=aA10yregWdI/lXSiXdhj3I2JxZXdvzOeAjA3tvbsIW0=;
        b=g0bU9Rl9xVGVgybk3QJ8U0GWA4Hb34OJLYL/nGWNVDX2cm9oE09Zv6xeCBD9+34zXq
         pXTja9WSJFSm/7Vk8U0hp/2D+E/S30JsW7wtvEjgBPV24Kza7bpiEjfeafrn5GryvjsA
         ma4TkqOKZcaHKJETU4xfdd9af/3JKA31WVAyo=
In-Reply-To: <20110315175928.4dbbe83c@debian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hello,
forwarding is enable?
can you try this;

#sysctl -w net.ipv4.ip_forward=1
#iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dport 81 
-i ${LAN_IFACE} -j ACCEPT


On 03/15/2011 02:29 PM, J. Bakshi wrote:
> Dear list,
>
> Here is a port forwarding issue.  I have a linux router which have two NIC; one facing WAN and the other facing LAN. IP forwarding is active and this box is working as a gateway. This box has LAN IP 192.168.1.1
>
> There is another box (webserver) 192.168.1.2 within the internal network and the router box has port forwarding to access the webserver.
>
> ```````````````````````````
> iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
> iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j DNAT --to 192.168.1.2:8080
> iptables -A FORWARD -p tcp -m state --state NEW --dport 81 -i ${LAN_IFACE} -j ACCEPT
> ````````````````````````````
>
> So within LAN I can access the 192.168.1.2 web server through  192.168.1.1:81 as port forwarding is there. But I can not access the same through internet. If I point at<domain-name>:81 throught internet ; the browser simply reports it can't connect to the service; though the other services running at that very server are quite accessible through internet. Have I missed something in my firewall rule ? Could anyone give any clue please ?
>
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

