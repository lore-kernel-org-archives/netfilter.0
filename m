From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: MAC SOURCE
Date: Mon, 11 Jul 2005 17:00:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507111659170.11302@yvahk01.tjqt.qr>
References: <BAY5-F14B5C5AE15C81A1871A8ABADC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY5-F14B5C5AE15C81A1871A8ABADC0@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: azeem ahmad <azeem81@msn.com>
Cc: netfilter@lists.netfilter.org

> hi list
> here is a script that i want to use to block unauthorized MACs on my network.
> but the problem is that  its not blocking all other MACs that r not specified
> in the script. plz help me out n telll wots the reaon of this

you did not tell iptables to drop "all others". 11:22:33:44:55:66 is just 
_one_ MAC. Note, that it's enough to say

iptables -P INPUT DROP
iptables -A INPUT -j ACCEPT -m mac --mac-source $MAC
(and the same for FORWARD)



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/


