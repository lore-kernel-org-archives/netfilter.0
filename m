From: Kristofer <kristofer@cybernetik.net>
Subject: Port forwarding (non-NAT)
Date: Mon, 18 Feb 2008 17:18:07 -0600 (CST)
Message-ID: <16791323.9561203376688071.JavaMail.SYSTEM@tater>
References: <1664820.9541203376664790.JavaMail.SYSTEM@tater>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1664820.9541203376664790.JavaMail.SYSTEM@tater>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've googled and done some searches, and the only information I can find is for port forwarding with NAT. Perhaps that's what I need to accomplish what I am trying to do. If I missed an obvious link or source with this information, I apologize and please slap me. 

I currently have an SMTP server listening on port 25, and the machine has its own static IP address, no NAT is being used. 

I want to use iptables to forward inbound traffic on port 587 to port 25 of that same machine, so basically making SMTP listen on both ports. I do not wish to configure the SMTP software to listen on multiple ports, since I may want to open up several more ports in the future and that would be a lot of idle daemons listening on ports they may or may not use. 

So, my questions is: how can I have incoming traffic on port 587 go to port 25 of the localhost? 

Thanks, 
Kristofer 
