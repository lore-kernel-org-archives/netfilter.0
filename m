From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: bypassing a prerouting rule
Date: Thu, 24 Jun 2004 03:18:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088060134.24608.35.camel@localhost>
References: <BAY22-F8GvaIyuw4n4a0009ebc4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY22-F8GvaIyuw4n4a0009ebc4@hotmail.com>
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
To: Manestro Oliveira <manestro123@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-23 at 09:24, Manestro Oliveira wrote:
> Hi,
>       I am a begginer to Linux and I have a PREROUTING rule that makes port 
> redirection on incoming packages. But there is a server that don`t accept 
> that, and works only without that rule. How can I bypass the rule for that 
> server specifically?
> 
>      If iptables works by matching rules and leaving the other ones without 
> checking them, then I should insert a rule before that and the problem is 
> solved. Is this correct?
> 
>      Sorry if the question might be stupid, but I am taking the chance for 
> being stupid now (and maybe not forever). >)
<snip>
Yes, you can place an ACCEPT rule before the REDIRECT rule and that will
halt processing in the PREROUTING chain for that match.  Thanks for
asking :-) - John
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


