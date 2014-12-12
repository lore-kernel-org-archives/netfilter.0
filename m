From: Tim Nelson <tnelson@rockbochs.com>
Subject: Bridging / VLANs / ebtables
Date: Fri, 12 Dec 2014 14:03:12 -0600 (CST)
Message-ID: <12631645.301499.1418414592170.JavaMail.root@rockbochs.com>
References: <4829673.301498.1418414563731.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4829673.301498.1418414563731.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings-

I have an interesting situation that requires bridging some VLAN enabled interfaces together on a Debian 7.x x86 system. On the host, there is a single physical interface passing traffic natively (eth0), and two tagged VLANs also passing traffic (eth0.2 and eth0.3).

The use case is that I need to bridge eth0 with eth0.2, allowing layer two traffic to pass seamlessly between interfaces, and still leave eth0.3 in a usable state. The switch this system is connected to is outside of my control, which is the reason for the odd network setup.

What I'm finding by simply creating a new bridge br0 with members eth0 and eth0.2 is no connectivity on eth0.2, and slow/quirky connectivity on eth0 (native connectivity to Debian 7.x host). In doing research, I've found suggestions of adding the VLAN interfaces to the bridge direct, resulting in a br0, br0.2, and br0.3, but the results were the same.

It has been suggested to use ebtables to filter the VLANs from the eth0 interface on the bridge, yet allow operation to the system interface eth0.2/eth0.3. I found a very specific reference on the ebtables site for this scenario [1], usage suggested (modified to fit my environment):

ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 3 -j DROP
ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 2 -j DROP

If my understanding of the ebtables usage as a brouter, and the kernel's interaction between all components involved, this should work. However, as noted, no change in operation is observed.

I'm hoping someone can shed light on what needs to be done for a successful bridge of eth0/eth0.2, with an intact eth0.3 (point to point link between Debian 7.x host and another device). I posted this to the debian-users list but given the wide audience, was not successful in getting relevant content.

All tips/tricks/suggestions welcome.

Thank you,

--Tim

[1] http://ebtables.netfilter.org/misc/brnf-faq.html#quiz2
