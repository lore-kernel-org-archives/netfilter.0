From: "John A. Sullivan III" <John.Sullivan@nexusmgmt.com>
Subject: Re: how to automate ip_forward
Date: Thu, 08 Jul 2004 15:44:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EDA433.40900@nexusmgmt.com>
References: <Pine.LNX.4.44.0407081443070.3962-100000@Megathlon.ESI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407081443070.3962-100000@Megathlon.ESI>
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
To: Marco Colombo <netfilter@esiway.net>
Cc: Peter Marshall <peter.marshall@caris.com>, netfilter <netfilter@lists.netfilter.org>



Marco Colombo wrote:
> On Thu, 8 Jul 2004, Peter Marshall wrote:
> 
> 
>>Hey guys, I know this sounds stupid, but I can not seem to get the value of
>>/proc/sys/net/ipv4/ip_forward to be 1 after boot.  I tried putting the echo
>>1 > /pro...../ip_forward in my iptables script .... (BTW, I have a bash
>>script with my rules in it and a startup script in rc2.d that calls it)
>>
>>I also tried making a separate starup script just for the ip_forward and set
>>it to run in as the last thing in rc2,d .....
>>
>>If anyone has any suggestions, I would greatly appreciate it.
>>
>>Thanks.
>>Peter
> 
> 
> That depends on the distro you're running. On Red Hat / Fedora distros,
> add (or change) the following line to /etc/sysctl.conf:
> 
> net.ipv4.ip_forward = 1
> 
> The echo you're using should work, just make sure nothing else
> (i.e. sysctl) resets it to 0 later at boot time (but on RH and
> Fedora, sysctl -p occurs in rc.sysinit, so before any rc.[2345]
> script).
> 
> As an alternative to the echo approach, you can use the sysctl
> command directly in your script. My iptables scripts start with:
> 
>   sysctl -w net.ipv4.ip_forward=0
> 
> and end with:
> 
>   sysctl -w net.ipv4.ip_forward=1
> 
> so that forwarding is disabled while the scripts are messing with rules:
> I tend to use the scripts at runtime now and then, disabling forwarding
> is just safer.
> 
> .TM.
Exactly.  Plus, I believe you'll find that sysctl is called in 
/etc/init.d/network.
As recommended, I tend to set the /etc/sysctl.conf setting to 0.  While 
I am there, I also disable redirects and source routing.  I then enable 
forwarding with the echo command (for platform independence) in my 
scripts after all the security scripts have successfully run.  This way, 
if one of the iptables or *swan scripts fails, I fail safe and the 
gateway does not forward - John
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

