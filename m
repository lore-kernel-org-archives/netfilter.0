From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 11:04:39 +0100 (WEST)
Message-ID: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there,
I use to do nat filtering with the PREROUTE chain, but in the latest
version i see that is no longer possible.
After trying to ajust my scripts i did:


#allow TCP PORT 22
iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT # ssh
#block everything else
iptables -t filter -A FORWARD -j DROP


Am i doing it in the correct way?
The problem is, i cannot access the 22 port to the outside world when the
DROP rule is applied.

Jorge,

