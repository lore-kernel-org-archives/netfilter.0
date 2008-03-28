From: Noino <mg8c1zu02@sneakemail.com>
Subject: RE: simple port translation on the localhost / local loopback
Date: Fri, 28 Mar 2008 11:21:18 +0100
Message-ID: <20080328102118.E4B7CB872@sem.mel.teaser.net>
References: <20080327211643.B37CA78C86@gam.mel.teaser.net>
            <B48CB61665A101419E226D4D141D540E03035231CC@mail-server.inside.eclyptic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B48CB61665A101419E226D4D141D540E03035231CC@mail-server.inside.eclyptic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, Ryan... 

Ryan Kruse wrote : 

> This is how I redirect 10443 to 443.  You have to NAT it back to another host, which will just be your machines IP.  You should be able to sub in your server IP and DNS ports. 

Thank you for your help. I did as you said, /mutatis mutandis/, 
unfortunately it didn't work. Here're my iptables commands (starting from 
clear tabes) :
___________________________________________________________________________
# /usr/sbin/iptables -t nat -A OUTPUT -d localhost -p udp --dport 53 -j 
REDIRECT --to-ports 10053
# host=10.0.0.1
# /usr/sbin/iptables -t nat -A OUTPUT -d $host -p udp --dport 53 -j REDIRECT 
 --to-ports 10053
# /usr/sbin/iptables -t nat -A PREROUTING -d $host -p udp --dport 53 -j 
REDIRECT --to-ports 10053
___________________________________________________________________________ 

Here 10.0.0.1 is my local host's IP on eth0 (the LAN) 

Now here's what happened when trying to contact my local DNS listener 
(Tor-alpha) :
______________________________________________________________________
# host www.grc.com 10.0.0.1
;; reply from unexpected source: 127.0.0.1#10053, expected 10.0.0.1#53
;; reply from unexpected source: 127.0.0.1#10053, expected 10.0.0.1#53
;; connection timed out; no servers could be reached
_______________________________________________________________________ 

You see, it appears just like per my previous question, replies weren't 
NATTed back ! 

Maybe a version problem ?
_____________________________
#iptables --version
iptables v1.2.9
_____________________________ 

-- 
Noino

