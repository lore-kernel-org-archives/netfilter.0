From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Allow only certain ip addresses
Date: Thu, 10 Jun 2004 15:11:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086894666.2007.189.camel@localhost>
References: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
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
To: Jonathan Villa <jvilla@e37.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-06-10 at 13:39, Jonathan Villa wrote:
> I have a machine running mysql only.
> 
> I want to allow connections on ports 3306, 22, and 80 for a group of ip
> address.
> 
> Some will be from the block, others are dispersed.
> 
> Will I know how to allow block of ips, and how to allow a single ip, how
> would I combine the 2?
> 
> My assumption is this
> 
> 1. create an array of the single ip addresses.
> 2. loop throught the array printing an iptables command which will allow
> access on those ports to the loop index.
> 3. hardcode the ip block xx.xxx.xx.0/24
> 
> Am I correct so far?
You may find the iprange patch from patch-o-matic helpful if you have
contiguous addresses that do not break evenly into a subnet.  If you do
not want to patch, SubnetCreator (http://subnetcreator.sourceforge.net)
will turn the contiguous range into a group of subnets.
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


