From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Add modules to iptables
Date: Thu, 27 May 2004 17:31:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085693488.11088.16.camel@localhost>
References: <00a801c44418$d9f6f1c0$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a801c44418$d9f6f1c0$0200a8c0@ale>
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
To: Alejandro Kurchis <sisdis@tournet.com.ar>
Cc: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Thu, 2004-05-27 at 14:31, Alejandro Kurchis wrote:
> Hi folks !!!
> 
> I have Red Hat 9 with Iptables 1.2.7. In iptables, I have all the default
> modules (ip_nat_irc, ip_nat_ftp, etc....) that came with this version af
> iptables.
> 
> If I want to add extra modules like ip_conntrack_h323, ip_string or any
> other.....Do I have to re-compile iptables or is there any easy way to do
> that ??? How can I do this pease ??? I'm not an expert so I like the simple
> way....
> 
> Special thanks,
> 
> Alejandro
I don't recall all the details since it has been a while since I patched
a system but I think you'll find all the information you need in the
patch-o-matic documents.  You can start with
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html
Good luck - John
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


