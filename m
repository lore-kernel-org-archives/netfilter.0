From: "Angel Tsankov" <fn42551@fmi.uni-sofia.bg>
Subject: Re: ip forwarding and iptables
Date: Tue, 16 May 2006 09:55:03 +0300
Message-ID: <004401c678b5$acf7c310$cf34000a@sven>
References: <002301c67865$88d8d6e0$cf34000a@sven> <e4b032$e9r$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org


>> I have 2 PCs: one configured as gateway (PC1) and the other one (PC2)
>> configured to use PC1 as gateway. PC1 runs a custom Linux distribution. It has ip
>> forwarding enabled (e.g. by echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf).
>> As far as I understand, I do not need to do anything else to make the kernel route traffic to and from PC2, right?
>> However, if I have one PC more - PC3, and I do not wnat to route traffic to and from it I need to configure the kernel, e.g. with
>> the help of iptables. Now if I do so, i.e. use iptables to configure the kernel, save the iptables configuration, setup the 
>> system
>> to reload it at startup (using the init.d scripts), is there any moment (during system startup) when ip forwarding has been 
>> enabled
>> but the iptables configuration has not yet been loaded and traffic could be routed to and from PC3?
>
> It's pretty hard to guess what your "custom Linux distribution" might
> be doing.  Usually, at startup the iptables service is started before
> starting networking, and during shutdown networking is stopped before
> stopping (unloading) iptables.

My linux distro is LFS.

> How much more you might need to do in order to get traffic routed
> depends on details about your network addressing that you have not
> provided.

Well, it seems that enabling ip forwarding on PC1 is sufficient to route traffice to and from PC2 as the latter can ping hosts on
the Internet and browse web sites. The network configurations is as follows:
PC1 has a single NIC:
IP=172.16.0.3
PREFIX=24
BROADCAST=172.16.0.255

PC2 has a single NIC, too:
IP address = 172.16.0.4
subnet mask = 255.255.255.0
default gateway = 172.16.0.3

iptables have NOT been installed on PC1. So, if PC3 is configured similarly to PC2, it could too have access to the Internet, right?

And lastly, two more quesions:
-What exactly does ip forwarding mean?
-If I install the iptables service, and use it to configure the kernel not to route traffice for PC3, how can I ensure that the
iptables service gets started before starting networking, so that there won't be a time slice when PC3 will have access to the
Internet? 


