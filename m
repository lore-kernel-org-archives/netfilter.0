From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: How to block a range of IPs?
Date: 28 Apr 2003 12:14:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051546485.1427.7.camel@jasiiitosh.nexusmgmt.com>
References: <20030427140602.30833.28944.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030427140602.30833.28944.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

You can  use the tool at http://subnetcreator.sourceforge.net/ to easily
determine which subnets are contained in your IP address range.  The
same logic is being built into the iptables+ management tool being
developed in http://iscs.sourceforge.net/ .  However,even better,it
appears there is a patch available in patch-o-matic that allows one to
enter a range directly in iptables.  I haven't tried it yet but hope to
do so soon to replace that logic in ISCS.  Good luck - John

On Sun, 2003-04-27 at 10:06, netfilter-request@lists.netfilter.org
wrote:
> --__--__--
> 
> Message: 4
> From: "Afshin Lamei" <linux_st@hotmail.com>
> To: netfilter@lists.netfilter.org
> Subject: How to block a range of IPs?
> Date: Sun, 27 Apr 2003 10:41:54 +0430
> 
> Hi,
> How can I write a rule for a custom range of IPs? for example, I want to 
> block every WWW packet incoming from eth1, which source is an IP between 
> 192.168.1.10 and 192.168.1.20.
> please help me writing an example.
> thank you
> afshin
> 
> 
> 
> 
> 
> _________________________________________________________________
> Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
> http://join.msn.com/?page=features/junkmail
> 
> 
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


