From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: OT: alias for a network card
Date: Thu, 15 Jul 2004 08:40:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F68954.8020802@pbl.ca>
References: <f51b72bc0407150121527f95a4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc0407150121527f95a4@mail.gmail.com>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Payal Rathod wrote:
> Hi,
> Excuse for this OT question here. But I don't know where I can get an
> answer. While doing  NAT i need to have alias IPs for my router
> machine like,
> # ipconfig eth0:1 192.168.0.4
> 
> But these rules are lost once the machine is rebooted. How can I  make
> them permanent?
> I thought of putting these in rc.local but it rather crude approach as
> my firewall might be started before that. I use Mandrake Linux.

It is OK to have firewall rules loaded before your interfaces are 
configured.  I would go a step further and say that it is recommended. 
On most Linux distribution I saw that is exactly the order how things 
are done during boot (first iptables, than network).  This way you don't 
have that one or two seconds gap when your machine/network is unprotected.

As for original question, check how and where your "normal" interfaces 
are configured.  On RedHat it is file ifcfg-IF_NAME (where X is 
interface number, for example for eth0 file is ifcfg-eth0) in 
/etc/sysconfig/network-scripts directory (so if you want virtual 
interface on eth0, you just create ifcfg-eth0:1 file).  Solaris does it 
the same way (/etc/hostname.hme0, /etc/hostname.hme0:1 and so on).  On 
Mandrake it is probably something similar (when you find how the normal 
interfaces are configured, virtuals are most likely configured the very 
same way).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

