From: "John A. Sullivan III" <John.Sullivan@nexusmgmt.com>
Subject: Re: SNAT
Date: Fri, 09 Jul 2004 00:58:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EE25F9.2010806@nexusmgmt.com>
References: <f51b72bc04070820577fd223df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc04070820577fd223df@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payalrathod@gmail.com>
Cc: netfilter@lists.netfilter.org



Payal Rathod wrote:
> Hi,
> While reading man page of iptables I stumbled in MASQUERADE section,
> 
> | This  target  is only valid in the nat table, in the POSTROUTING chain.
> |  It should only be used with dynamically assigned  IP  (dialup)  connec-
> |  tions: if you have a static IP address, you should use the SNAT target.
> 
> Can someone explain please why this is not valid when I am using a
> permanent conneciton terminating at say eth0 and also a small example
> on how SNAT can be used in the place?
> 
> Thanks a lot in advance.
> With warm regards,
> Payal
It is indeed valid, it is just slower than SNAT.  MASQUERADE must look 
up the address for each packet it alters (or so I believe).  That is why 
it can be used on connections which do not have a static IP address.  If 
one has a static IP address, one can save the overhead by using SNAT.

You'll find an excellent tutorial by Oskar Andreasson at 
http://www.netfilter.org in the tutorials section.  You can also find a 
training slide show in the training section at 
http://iscs.sourceforge.net.  Good luck - John
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

