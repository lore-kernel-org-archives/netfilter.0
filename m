From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: need for stateful packet inspection
Date: Thu, 27 May 2004 04:04:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085645044.10045.3.camel@localhost>
References: <40B126AA.3050106@qwest.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40B126AA.3050106@qwest.net>
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
To: Randolph Jones <jonesrf1@qwest.net>
Cc: netfilter@lists.netfilter.org

On Sun, 2004-05-23 at 18:33, Randolph Jones wrote:
> I am ignorant re iptables.
> 
> I am considering buying a linksys router. It seems to have statefull 
> packet inspection that blocks nonmatching incoming packets.
> 
> If I do not have a server exposed to the internet, do I need any
> packet inspection other than checking that all incoming packets match an 
> earlier outgoing request?
> 
> TIA
> rfjones
In short, no.  If your needs are minimal and you do not need to managed
multiple devices a linksys may be fine for you.  I cannot speak to the
quality of Linksys; I have not used them.  However, not all stateful
inspection engines are created equal.  Consider what functionality you
may need in the future.  Consider how important reliability is, i.e., 
if the device occasionally fails and needs to be reset, is that a
problem. However, for very simple needs, a Linksys will probably be
fine.
Does anyone else have any thoughts, comments or insults?
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


