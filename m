From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Destination Nat
Date: Fri, 04 Jun 2004 12:44:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086367484.15357.53.camel@localhost>
References: <40c09fdd.53.2397.470918728@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40c09fdd.53.2397.470918728@arbbs.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: black@arbbs.net
Cc: netfilter@lists.netfilter.org

On Fri, 2004-06-04 at 12:14, black@arbbs.net wrote:
> > What are the other rules?
> 
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
>  --dport 22 -j DNAT --to 192.168.1.81:22
> 
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
>  --dport 22 -j DNAT --to 192.168.1.82:22
> 
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
>  --dport 22 -j DNAT --to 192.168.1.83:22
> 
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
>  --dport 22 -j DNAT --to 192.168.1.88:22
> 
> john
Well that does explain it! It will always choose the first matched
rule.  You cannot do what you have outlined here. Well . . . you can but
it will behave exactly as you observed.  There must be some
distinguishing trait in the match portion of the rule to differentiate
the rules -- a different public address, a different port, a different
interface.  You matches are all the same!
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


