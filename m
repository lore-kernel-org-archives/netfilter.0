From: Philip Craig <philipc@snapgear.com>
Subject: Re: Not quite understanding DNAT
Date: Fri, 25 Jul 2003 10:14:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F207664.1000109@snapgear.com>
References: <3F1F9900.4080401@snapgear.com> <3F1FA56E.28480.E59161E@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1FA56E.28480.E59161E@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Coutts, Ashe (Testing Account)" <ATest@sbsdk12.org>
Cc: netfilter@lists.netfilter.org

Coutts, Ashe (Testing Account) wrote:
> It is working almost as I expected except for the following. The DNAT 
> connections come into the system fine but are seen as originating from the 
> eth0 interface rather than their eth0:x interface. So, when attaching to a linux 
> cpu with ssh I am needing to place the ip# for the eth0 interface in the 
> hosts.allow file rather than the much more restrictive eth0:x ip#. Can it be set 
> up so the connection is between the external eth0:x ip# and its linked internal 
> ip#?

If all you are doing is DNATing, then the source address should be
the real external source address, not eth0 *or* eth0:x.

> ## Setup NAT from entire WAN to the outside world
> /sbin/iptables --table nat  --append POSTROUTING --source 0.0.0.0/0          \
>                --jump SNAT --to 204.48.178.2

But here we see that you are SNATing everything.  This is probably
not what you want.  I expect you only want to SNAT outgoing traffic:

## Setup NAT from entire WAN to the outside world
/sbin/iptables --table nat  --append POSTROUTING --out-interface eth0          \
                  --jump SNAT --to 204.48.178.2

With this rule, you should now place the real external hosts in
your hosts.allow, rather than any IP address that belongs to the
firewall.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


