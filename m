From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: problem with documentation
Date: Fri, 14 May 2004 18:28:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084573719.3383.12.camel@localhost>
References: <000001c439c0$a5ee79f0$28c8a8c0@polm.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c439c0$a5ee79f0$28c8a8c0@polm.dyndns.org>
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
To: Benjamin Case <benjamin_case@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-05-14 at 10:34, Benjamin Case wrote:
> I have just completed the the installation of IPTABLES in Debian based on
> Russel's "Packet Filter" documentation.
> 
> I am now attempting to create the rules that Russel has provided in the
> "Rusty's Really Quick Guide To Filtering".
> 
> Unfortunately I am receiving an errror.
> 
> polm:/etc# iptables -N block
> polm:/etc# iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables: No chain/target/match by that name
> 
> When I do an iptables -L , I can see the "block" chain.
> 
> Why does the second command return an error ?
> <snip>
Strange, it works fine for me.  Is there any chance that you do not have
connection tracking enabled? What happens if you try to create the same
rule but for the FORWARD chain? - John
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


