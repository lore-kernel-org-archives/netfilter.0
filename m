From: "linuxmc\@libero\.it" <linuxmc@libero.it>
Subject: Re:Setting up a proxy with iptables
Date: Sat,  2 Aug 2008 09:18:57 +0200
Message-ID: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sargon97 <sargon97@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


Hi, have you try with a rule like

$IPTABLES -t nat -A PREROUTING  -p tcp -m tcp   --dport 80 -j DNAT --to-destination 82.109.120.222:8080

?

Best regards !
Marco 


---------- Initial Header -----------

From      : netfilter-owner@vger.kernel.org
To          : netfilter@vger.kernel.org
Cc          : 
Date      : Fri, 1 Aug 2008 16:24:34 -0700
Subject : Setting up a proxy with iptables







> Hi,
> 
> I am trying to set up a proxy with iptables nothing seems to work. I  
> would like to forward outbound traffic destined to port 80 on an  
> external ip address to localhost port 8080.
> 
> Thanks in advance for the help.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

