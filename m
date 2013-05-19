From: julioarr@fisica.uh.cu
Subject: It is correct to write: iptables -A INPUT -i ppp+,eth0+,tap+   . .
 .
Date: Sun, 19 May 2013 11:39:25 -0400
Message-ID: <8d3c593ab7094d244e32a6788a950355.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello again

It is correct to write:

iptables -A INPUT -i ppp+,eth0+,tap+ ...

or it is need to write:

iptables -A INPUT -i ppp+ ...
iptables -A INPUT -i eth+ ...
iptables -A INPUT -i tap+ ...

thanks,
julio

