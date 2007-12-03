From: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Subject: Problem with address forwarding
Date: Mon, 3 Dec 2007 13:52:38 +0100
Message-ID: <20071203125238.GN4452@jnamobiled.ite.pl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I try to do simple address:port forwarding and I can not get it
working. I want to have all traffic send to some.internet.address:some_port 
to be forwarded to 192.168.155.123:80.

So I guess following rule should work fine:
iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport 1234 -j DNAT --to 192.168.155.123:80

But when afterthat I enter some.internet.address:1234 in firefox I can
not see webpage which is located at 192.168.155.123. It tries to connect
but there is no result.

What could be the reason of that?

Thanks in advance!
Jakub
