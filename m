From: Alfredo Rezinovsky <alfrenovsky@gmail.com>
Subject: Problem with arp and brouting
Date: Wed, 17 Aug 2016 13:13:14 -0300
Message-ID: <CAMXC=WtL_ELrLTh5adh_HF9zu4_KogYGFiCkrEgWrbVZTuGKmA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=54rAAZBO2X6LAu4f8CvRjksrqVMIujL7vGnBWARjVKU=;
        b=punA6lrL9ZhH+YNXJi8ftbmyh9UIGpX7RSDdh+wtD+gpjJt0/WLQkbIHZkTTGW5ki3
         RWVAeSr+jVP6LV+MWeThdsI+O4//fKDPzhlfCyS5PVS4pgBm6oPHA/17UpidgNtElsFw
         siYjUZWmAfvVwpli9I5ffMfy8qfqzs0lf7H5+VzLm4cI92aoLlRMlpJJCQYKdqWqdKQg
         R44/LozOcyFJDrxEn96KFduX5OCZLJUBkQtLo6xQjRJ8BantonZwMyQN3So6Vjg0I9Ap
         a7V5X+6ijG3oXu9nSZO1F3al/XS8uGHDVrRwqpEVINC6VG1HeudCoKfvB8lZ0daWPEJA
         RiqA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a bridge for transparent http proxying

with:
  ebtables -t broute -A BROUTING -p IPv4 --ip-proto tcp --ip-sport 80
-j redirect --redirect-target DROP
  ebtables -t broute -A BROUTING -p IPv4 --ip-proto tcp --ip-dport 80
-j redirect --redirect-target DROP
I can turn traffic in port 80 from bridged to routed. That way I can
use tproxy iptables rules.

Default Gateway (G) --- Brouter (B) --- Other Router (R) -- LAN Network PCs (L)

In bridge mode (Without any ebtables rule) the bridge just works
In brouter mode (With the two ebtables rules shown above) packets
from/to port 80 are routed. So the brouter needs to know how to route
them.

It will work if I add some routes to the brouter

G dev br0
default via G
R dev br0
Lan Network via R

This seems to be simple, but sometimes there are a lots of "Other
Routers" with different networks. And the need for routes makes this
transparent proxy less transparent.

Those routes could be avoided if ebtables could load the original
destination IP and MAC address (before the redirect) to the neigh
table. Thus sending the packets to the same MAC as if the broute was a
bridge. At least for the traffic going in (G-B-R).
Question 1: Is that possible?

The other problem is that usually G has lots of IPs (G1, G2...) in
many networks, each one with one router (R1, R2...) and the bridge has
only one IP

Lets suppose the Bridge has and IP in the first network (B1).

When a package comes in from internet to some IP in LAN Network 2.

1. G knows the route for LAN 2 via R2
2. Asks for a MAC
3. G2, answers the ARP
4. G Sents a packet to IP L2, MAC G2
5. The brouter intercepts if using the redirect in ebtables.
6. The brouter knows the route for LAN 2 via R2
7. Brouter asks for a MAC for IP R2, using IP source B1.

Because B1 is in subnet 1 and R2 is in other subnet, some routers wont
answer the ARP request (CISCO for example)

Any solution without the need to add a permanent neigh entry for R2?




-- 
Alfrenovsky
