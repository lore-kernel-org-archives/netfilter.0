From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: quick syntax query
Date: Mon, 07 Jun 2004 07:54:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086609260.21179.4.camel@localhost>
References: <FDB52A0429DFD31196FB0008C7D972D51259E6CF@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D51259E6CF@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Mon, 2004-06-07 at 06:53, Knight, Steve wrote:
> Hi there
> 
> Can one use syntax other than CIDR notation when defining things like
> networks?
> 
> i.e. it's common to see
> 
> LAN_RANGE="192.168.0.0/24"
> 
> in rule bases, but I would like to use
> 
> DODGY_RANGE="192.168.0.1-5"
> GOOD_RANGE="192.168.0.6-30"
> BAD_BAD_RANGE="192.168.31-40"
> 
> 
> a la `nmap` syntax.
> 
> Is this something netfilter can handle?
> 
<snip>
Yes, besides using CIDR and Dotted Decimal notation, one can apply the
IPRange patch-o-matic patch and use a rule such as

iptables -A FORWARD -m iprange --src-range 192.168.1.10-192.168.1.20 -j
ACCEPT

We use it all the time in the ISCS project.

If you do not want to patch, you can use SubnetCreator
(http:subnetcreator.sourceforge.net) to turn a range into a list of
subnets and then make rules for each of the subnets.  If you are using
Qt, it also provides a series of routines to do this programatically.

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


