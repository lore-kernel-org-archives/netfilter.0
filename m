From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: CONNMARK, OUTPUT, sid-owner and marking closed connections
Date: Fri, 18 Feb 2005 04:51:25 -0500
Message-ID: <20050218095123.GB31190@elm.home.idallen.ca>
References: <20050218034429.GA14099@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050218034429.GA14099@elm.home.idallen.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ian! D. Allen wrote:
> How do I arrange that *all* the packets get marked, even the "FIN" ones?

I couldn't get CONNMARK working (save-mark and restore-mark don't
appear to work for me); but, the kludge rule set below did get the final
post-connection FIN packets marked and routed correctly:

# This rule and table sends marked packets out eth1 instead of eth0:
#
ip rule from all fwmark 5 lookup 2

# Mark anything that tries to go out eth0 owned by session ID $PID:
#
iptables -t mangle -A OUTPUT -o $IF0 -m owner --sid-owner $PID \
        -j MARK --set-mark 5

# Find the real source address of eth1 and SNAT all marked packets to it:
#
inet1=$( ifconfig $IF1 | grep 'inet addr:' | tr ':' ' ' | awk '{print $3}' )
iptables -t nat -A POSTROUTING -m mark --mark 5 \
        -j SNAT --to-source $inet1

# All SNATd packets destined for eth0 must also be marked:
#
iptables -t mangle -A OUTPUT -o $IF0 -m conntrack --ctstate SNAT \
        -j MARK --set-mark 5

That last conntrack entry is the kludge that sets the mark for anything
that uses SNAT.  The SNAT is started by anything in the given $PID
session ID.  When the connection closes, the session ID stops marking
packets; but, the SNAT keeps going and keeps marking the FIN packets
properly.  Ugly.

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

