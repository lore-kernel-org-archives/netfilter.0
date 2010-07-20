From: Simon Ditner <sditner@gmail.com>
Subject: NAT appears to be unaware of ports in use on router
Date: Tue, 20 Jul 2010 13:00:16 -0400
Message-ID: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=1/LjgKYvxkbo6eY4Ub4tGXtBCDOjZa72dCq35/x1pjM=;
        b=ejM6BKPDshdhJJHRlIsBCFvW4yahyigAKxzKcIUbZLxi4zQvyMe0qYW6h2YmZN0jwD
         BDr/j4QfUz6L6x8oazZk7sGO0t0UYeLLepLa8AZ/ehe84N23Qz477EibhuVAs1P7ZEL/
         Oa3kx5d0ukrI0i9D3LE/WCqholZ72souT1WS4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have asterisk running SIP on a router using UDP port 5060 that's
also handling NAT for a network. I'm often doing testing behind NAT
with other SIP devices using UDP port 5060 talking to the internet,
and have run into a problem where NAT is able to claim 5060. I have
witnessed this occurring both when the asterisk service is stopped
(the obvious case), but I have also run into it when asterisk was up
and running fine.

When this occurs, either the device under test works, or the asterisk
service continues to operate but the NAT mapping for the device under
test ends up sending return traffic to the asterisk service.

Are there some extra options I should be enabling so that iptables is
aware of services running on the system which use ports > 1024? Or
some way to inform iptables of port ranges to not allocate from so
that it does not interfere?

Here is my existing configuration:

iptables v1.4.7
eth0 - internet
br0 - internal network

*nat
-A POSTROUTING -o eth0 -j MASQUERADE
COMMIT
*filter
:FORWARD DROP
:INPUT DROP
:OUTPUT ACCEPT
-A INPUT ! -i eth0 -j ACCEPT
-A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -p gre -j ACCEPT
-A INPUT -i eth0 -p udp --dport sip -j ACCEPT
-A INPUT -i eth0 -p udp --dport 10000:20000 -j ACCEPT
-A INPUT -i eth0 -p tcp -j REJECT --reject-with tcp-reset
-A INPUT -i eth0 -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i br0 -j ACCEPT
COMMIT

Cheers,
spd
