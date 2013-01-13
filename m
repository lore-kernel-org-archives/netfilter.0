From: Sebastian Poehn <sebastian.poehn@googlemail.com>
Subject: How to use TROXY target only for specific outgoing interface
Date: Sun, 13 Jan 2013 09:54:41 +0100
Message-ID: <1358067281.1669.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:date:content-type:x-mailer
         :mime-version:content-transfer-encoding;
        bh=4MOJBv7cIvsDa2P8t5ifWcyWscG0403LrNgaroLEkgg=;
        b=pPDnOyS9kXcv1NQx2fh7I791QUVuaiOkSP4+Kh0DnetqwJOlb6bwU9kElM0xa25/Vw
         L9wIHCQ4fBIa9AW5Ly5e//hdi4hlfxrO9bYlnYDtd3iDUtidxUa9MY/feeBCqyBkfcmx
         Aa27cxIziLgZhhrstcKEHslNI2xZ3FplzA+rL5vfTd4wFjjTxQTjhKTcDPgWELL9lICc
         jsZ8pHXNrP8BXC7PzhNZSKvRNrJioKVwH83EOYvaG065Z/iZzSnGlOjnBHR7qGUBXlym
         BKzNeFw/1S3SNyYy9zKoZLo9fzO+RTrx5fOcQHuVDNTgVSMT6VcbtrVumFL3KpMFUvOA
         WQ8Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I want to run a tcp transparent proxy ( with TPROXY ) processing only traffic outgoing a specific interface. That's what my setup looks like:
                                                      
                                                        
                   lan1 ############                                
    local net 1 <-------#  ROUTER  # wan                            
                        #    +     #-------------> internet                       
    local net 2 <-------#  TPROXY  #                            
                   lan2 ############                                
                                                        
Local traffic to lan1 and lan2 shall not be proxied, traffic to wan shall be proxied.
Other routers may be connected to the local networks, so we can not match for any destination netmasks.

The TPROXY target requires being entered in PREROUTING chain. Naturally the outgoing interface is only known after routing (POSTROUTING),
but then it's to late for TPROXY.

I was already thinking of possible solutions but all look more or less quirky to me (just pseudo calls, please do not insist on correctness ;-)

Solution 1 (run the stack twice):
ip link add dev loopback name tprox
iptables -A POSTROUTING -o wan -j ROUTE -oif tprox
iptables -A PREROUTING -i tprox -j TPROXY

Solution 2 (do it on your own):
iptables -A PREROUTING -j NFQUEUE
Use a small homebrew program using destination address and performing route lookup. If outgoing interface is wan mark packet and NF_REPEAT.
iptables -A PREROUTING --match-mark X -j PROXY

Solution 3 (just another idea):
TPROXY requires a ip route add local 0.0.0.0/0 (deliver everything locally).
If you'd jump to a the regular routing table traffic will not be proxied.
Unfortunately policy routing (ip rule *) can not 'match' for an outgoing interface (because the route lookup has not happened yet).

It would be great if you could give me any hints.

Greetings
Sebastian Poehn
---

