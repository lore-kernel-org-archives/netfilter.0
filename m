From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 17:57:16 +0300
Message-ID: <200502111757.16352.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello everybody,

I have written an iptables script to protect a machine/LAN
and I'd like to clarify an issue about RELATED ICMP packets
of type 3 (actually, mostly 3/1).

As far as I understand, it is safe to ACCEPT incoming
packets of this sort.
Is it safe to allow _outgoing_ packets of this kind?
Can an attacker make my machine generate such packets
in order to obtain information about it?  (All new
incoming packets are just DROPped.)


TIA,

Mikhail


