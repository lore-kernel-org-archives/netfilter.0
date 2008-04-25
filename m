From: Henrique Netfilter <henrique.netfilter@gmail.com>
Subject: Handling RoadWarrior VPN Traffic with IPtables
Date: Fri, 25 Apr 2008 12:05:58 -0300
Message-ID: <4811F356.9000404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
        bh=5WeFI44DomvSS56Zz1AI0EQEs6osG6thz+0wI/a0l+Q=;
        b=htfNFGGn8IYGeW7zRtK7t7EPK/iPJev0rohpasrdBgEs+g0nVwvkf9TmDIrtgFp6SPpWOXWJHN8hyb390vBM8bwdXPDj6sZri+X3FaXnvDs4YovDeTOFgO4NJVnLb8PZw4pciCci3AKia8IGk4yan747VSTshm4pvHtLk4doI3A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Good morning,

List, I've been trying now for some time to create a RoadWarrior VPN, 
and I finally did it.
Now I'm having some problems to tune my iptables rules to make it work 
correctly and safely.

The VPN is based on OpenSwan+l2tpd+pppd.
The distro is a Suse 10.1 kernel 2.6 (NETKEY).

The l2tpd is encaspuled inside the ESP traffic of the IPSec tunnel, and 
when it reaches my external interface, it must be redirected to my 
internal interface (where the l2tpd daemon listens) to continue the 
connection.
If I had a KLIPS kernel, I could easily just DNAT the incoming L2TP 
requisition on interface ipsec0 to my internal interface:

iptables -t nat -A PREROUTING -i ipsecX -p udp --sport 1701 --dport 1701 
-j DNAT --to-destination X.X.X.X <------ my internal interface IP

But since my kernel is NETKEY, I can't, since there is  no ipsec 
interface, and I can't just DNAT the incoming traffic from my external 
to my internal interface for security reasons (since I want that only 
traffic coming from the IPSec tunnel to access the l2tpd daemon).

At first I tought marking the ESP traffic would do the trick. I was 
wrong, since the packets marked are only those from the external peer to 
the external interface (SRC=Y.Y.Y.Y DST=Z.Z.Z.Z PROTO=ESP).

So far my last option is to apply the KLIPS patch and recompile my 
kernel, but I really would like to avoid to do so.
So I come to you, I hope that the netfilter list can help me out how to 
handle those connections using iptables.

Thank you, and so long

Henrique
