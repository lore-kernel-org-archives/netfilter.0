From: Vladimir <ml@foomx.de>
Subject: ipset - understanding hash size and maxelem
Date: Wed, 10 Apr 2013 14:19:55 +0200
Message-ID: <20130410141955.590b9ef8@vd.bk.hosteurope.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everybody,

at the momemt I'm setting up iptables/ip6tables rule sets based on
ipset (on Ubuntu 12.04, using repo packages). As set type I use hash:net
to handle networks and single IPs.

Is there a direct relation between the hash size and maxelem parameter?

When using maxelem on creation of a set this value simply limits the
number of entries that can be added, right?

maxelem parameter does not depend on the netmask used for a certain
entry, right?

Should I only specify hash size parameter if I know that my set will
hold few entries? If I understood man page correctly, the hash
size grows dynamically by doubling its size (somehow) if needed.

Best regards
Vladimir 

