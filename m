From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Rounf-Robin NAT
Date: Tue, 16 Mar 2004 06:57:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079438239.2012.1.camel@localhost>
References: <WorldClient-F200403161445.AA45470054@exsir.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <WorldClient-F200403161445.AA45470054@exsir.net>
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
To: AFShin <FreeBSD@exsir.net>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-03-16 at 06:15, AFShin wrote:
> Dear Friends,
> Can iptables do the real Round-Robin SNAT --to ?
> Is there any patch or it is available ?
> Thank you all in advance,
> AFShin A.
I do not know the actual code but somewhere in the back of my mind I
recall something about iptables using a rudimentary load balancing
algorithm, i.e., rather than strict round robin, it distributes the next
NAT to the least used address.  Can anyone confirm that? - John
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


