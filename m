From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: How to change DNS with iptables rules ?
Date: Thu, 27 May 2004 04:11:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085645336.10065.7.camel@localhost>
References: <BAY16-F67ZBNCogiwHs000430ac@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F67ZBNCogiwHs000430ac@hotmail.com>
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
To: Mark Alzino <tirixil@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-25 at 09:23, Mark Alzino wrote:
> Hello,
> 
> I have two DNS server : one at 10.0.0.254 and one at 192.168.10.254.
> I just want to dynamically change the DNS for a user (at 10.0.0.1 for 
> example), but there is a time for the iptables rules to be activate.
> Here is more explanation.
> 
> 
> I use two DNS servers (bind 9), in the same host, with two interfaces. Each 
> one ONLY listens on one interface (So, must not answer to a request related 
> to an other one !).
> 
> At the begining, the user has the 10.0.0.254 server. Then I add rules in 
> order to change the DNS for 192.168.10.254.
> I use this the following rules :
> iptables -A PREROUTING -s 10.0.0.1 -d 10.0.0.254 -t nat -p UDP --dport 53 -j 
> DNAT --to-destination 192.168.10.254
> iptables -A PREROUTING -s 10.0.0.1 -d 10.0.0.254 -t nat -p UDP --sport 53 -j 
> DNAT --to-destination 192.168.10.254
> 
> ** BUT **  : during a period (between 0 and 3 minutes), the user is ALWAYS 
> CONNECTED TO the
> 10.0.0.254 server !!
> In others words, I always have what I should have, but I have to wait for a 
> minute to have this...
> 
> How it is possible ??
> 
> 
> - Are the rules rights ??
> - Is there really a time for the PREROUTING target to be activate (Is that 
> it seem to be, but generally speaking rules are immediate...) ?
> - DNS (bind) listen at the begining only on one interface and listen on all 
> interface if it recognize a user he has served ? (!!!)
> - Anyone has the answer ? :-)
<snip>
How are you determining which DNS the user is using? Is it by seeing
which address it uses for a previously used query? Could it be that the
client is caching a previous DNS response? If you put a protocol
analyzer on the wire, is the client actually making a DNS request when
you think it is or is it not putting a DNS packet on the wire at all, in
other words, using some cached information? Hope this helps - John
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


