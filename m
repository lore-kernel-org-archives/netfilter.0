From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables newbie
Date: Sat, 27 Dec 2003 09:50:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072536610.1868.41.camel@jasiiitosh.nexusmgmt.com>
References: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
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
To: Johan Cimen <c99jcn@cs.umu.se>
Cc: netfilter@lists.netfilter.org

On Sat, 2003-12-27 at 08:31, Johan Cimen wrote:
> Hi!
> 
> I am an iptables newbie and this is what I want do do with iptables:
> 1. I want to ulog incomming packets at PREROUTING, incomming at specific
> ports with UDP protocol.
> 2. I am going to generate UDP packets from my local station, from specific
> ports.
> 3. I want to set TOS and TTL fields of my packets matching specific ports
> at OUTPORT or POSTROUTING.
> 
> Problem that I have is:
> 1. I cannot use:
>    iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
> --set-tos 0x10
>    Using iptables -L shows nothing under OUTPUT headline.
>    I cannot use tables at all.
> 2. I cannot use (just an example, nothing to do with what i want to do):
>    iptables -A POSTROUTING -o $IFACE -p UDP --dport 7001
>    iptables says: No chain/target/match by that name
>    Above iptable command works for INPUT, FORWARD and OUTPUT chains.
> 
> Question is:
> 1. Have I missed something in my kernel configurations?
> 2. Have I missed something in building chains and targets?
> 3. I need help! <snip>

Are you remembering to specify the table with -t mangle or -t nat if you
are not using the filter table? You do this in rule #1 but not rule #2
and if you do iptables -L OUTPUT you will see the rules of the filter
table OUTPUT chain and not mangle or nat.  Good luck - John
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


