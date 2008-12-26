From: Aleksei Bebinov <alex@gipi.kg>
Subject: multiple exclusive DNAT does not work
Date: Sat, 27 Dec 2008 00:45:38 +0600
Message-ID: <49552652.1040705@gipi.kg>
References: <S1751268AbYLZSRi/20081226181738Z+155@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <S1751268AbYLZSRi/20081226181738Z+155@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
tinkering with OpenWRT router ( Kamikaze 7.09) and need so finctionality :
1. all the web traffic thet flow throw router and masquerading have to
be forwarded to external proxy
2.but i have 22 subnets of my local ISPs that have to flow directly
without proxyng.

I do so :
---------------
cat /etc/config/kg-nets | while read LINE
do
#iptables -t nat -A PREROUTING -i br-lan -d  !  $LINE -p tcp -m
multiport --dports  80 -j DNAT --to-destination pr.oxy.ip:3128

done
--------------------------------------------

My script cat the file line by line and add excluding rules ( with ! )
of nets that i dont need to redirect.
BUT!
if only one rule ( for one subnet) persist in table - it works fine, and
if i ll add second  - with second net -  all the traffic redirecting to
proxy - without any  exclusions.

i cant understand  why ?
Could somebody help me please ?

Thanks in advance,
Aleksei

