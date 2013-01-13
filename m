From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Sun, 13 Jan 2013 12:30:48 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>
References: <1358067281.1669.27.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1358067281.1669.27.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Poehn <sebastian.poehn@googlemail.com>
Cc: netfilter@vger.kernel.org


On Sunday 2013-01-13 09:54, Sebastian Poehn wrote:

>I want to run a tcp transparent proxy ( with TPROXY ) processing only traffic outgoing a specific interface. That's what my setup looks like:
>                                                      
>                                                        
>                   lan1 ############                                
>    local net 1 <-------#  ROUTER  # wan                            
>                        #    +     #-------------> internet                       
>    local net 2 <-------#  TPROXY  #                            
>                   lan2 ############                                
>                                                        

-A PREROUTING -j foo
forall LAN subnets
	-A foo -d $lan -j RETURN
-A foo -j TPROXY
