From: Tomasz Czapiewski <xeros@telesat.eu.org>
Subject: iptables 1.2.9 + kernel 2.6.7 NAT problem
Date: Wed, 23 Jun 2004 16:04:43 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58L0.0406231604010.6996@debian.telesat.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've got a problem with the new kernel.
On 2.6.6 kernel there were no problems with NAT (SNAT/MASQUERADE) in
iptables, but since I've upgraded my kernel to 2.6.7-rc3 and later 2.6.7
I've got 'Target problem' when I try to add an iptables Masquerade rule
(ex. iptables -t nat -I POSTROUTING -s 192.168.1.1/32 -o eth0 -j
MASQUERADE).
I've tried without '-o eth0', without prefix and with prefix /24, -d
x.y.z.q parameter...
Everything is the same.
When I user -A POSTROUTING then iptables prints: 'iptables: Invalid
argument'.
ipt_MASQUERADE and conntrack modules are loaded without problems.
Since 2.6.7 I've used the same rules for kernels: 2.6.1-2.6.6 without
problems with iptables 1.2.9.

Could you help me to solve this problem?

-- 
:  `Yg. ,P' ,gP""Yg. gP""Yg. ,gP""Yg. ,gP""Yg   :     Tomasz Czapiewski       :
:   `Y$B'   $P   ,$' $$   YP d'   `Y$ `Y._      :        xeros@irc.pl         :
:    ,PY$.  Y$.-"`   Y$ _,P' $b.   ,P   `""Yg.  :       ICQ: 109320380        :
:  ,P'  `Y$.`Yg._.:' :$ `s._ `Yb._,P' `Y.__,P"  :        GG: 1578983          :

