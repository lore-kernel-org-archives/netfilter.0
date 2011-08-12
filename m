From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Sat, 13 Aug 2011 00:40:11 +0200
Message-ID: <4E45ABCB.8040902@gmx.de>
References: <4E44F1DC.3090605@gmx.de> <4E450A97.8070303@wildgooses.com> <D36EB610-DA57-4882-8560-8EF7FD6B8F09@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D36EB610-DA57-4882-8560-8EF7FD6B8F09@mac.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



> First of all, can you post the ssh tunnel syntax you are using?  In ssh you can specify which ip address will be used to bind the port tunnel. E.g: -L<local ip>:<local port>:<remote ip>:<remote port>.
I use ssh not in the terminal. i use putty for the connection. there is 
a setting "ssh-->tunnels-->Add forwarded port" There i set the 
sourceport e.g. at 9999 and as destination the ssh-server. i made it 
also dynamic. so i can use it as proxyserver e.g. in  firefox this way: 
(SOCKS: localhost:9999)
> Secondly, can you tell us the type of traffic you want transport over the tunnel? You can pass as many -L syntax as needed to ssh.
I think its tcp-packages from one programm on my computer which shell be 
sent to a server outside. The reason for using the ssh-tunnel is, that 
the firewall does not allow the port, the programm needs.

i hope it is clear
