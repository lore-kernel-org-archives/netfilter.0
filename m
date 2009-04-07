From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Tue, 07 Apr 2009 07:26:08 +0300
Message-ID: <49DAD5E0.9020303@caf.com.tr>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DA0F49.4090802@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 06.04.2009 17:18, Dennis J. wrote:
> What does "deprecation of NAT filtering" entail exactly?

# /sbin/iptables -V
iptables v1.4.2
# /sbin/iptables -t nat -A OUTPUT -p tcp --dport 10000 -j DROP

The "nat" table is not intended for filtering, hence the use of DROP is
deprecated and will permanently be disabled in the next iptables
release. Please adjust your scripts.

# /sbin/iptables -L -nvx -t nat
[...]
Chain OUTPUT (policy ACCEPT 45827 packets, 3301166 bytes)
    pkts      bytes target     prot opt in     out     source
    destination
       0        0 DROP       tcp  --  *      *       0.0.0.0/0
  0.0.0.0/0           tcp dpt:10000
#

versus

# /sbin/iptables -V
iptables v1.4.3.1
# /sbin/iptables -t nat -A OUTPUT -p tcp --dport 10000 -j DROP
iptables v1.4.3.1:
The "nat" table is not intended for filtering, the use of DROP is
therefore inhibited.


Try `iptables -h' or 'iptables --help' for more information.
# /sbin/iptables -L -nvx -t nat
[...]
Chain OUTPUT (policy ACCEPT 5115 packets, 415189 bytes)
    pkts      bytes target     prot opt in     out     source
    destination
#

Do not filter in the nat table and you will be fine.

-- 
Eray
