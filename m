From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: disconnection from LAN
Date: Tue, 7 Sep 2004 11:33:51 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382AF0@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

i would think that prohibition against split-tunneling would be a corporate
security decision as such IS behaving as configured.

when you want to access the open internet DONT use the VPN.
dont change any of your other boxes as this makes since.

when you want to access the intranet, DO USE the VPN

v/r,

~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Tuesday, September 07, 2004 11:01 AM
To: netfilter@lists.netfilter.org
Subject: Re: disconnection from LAN


On Tue, 2004-09-07 at 13:54, Payal Rathod wrote:
> Hi,
> I am conecting to internet via. my Mandrake Linux 10 box. But
> whenever I connect to my client's VPN from my windows machine (using
> CISCO client) the windows machine is disconnected from the LAN
> immediately after the client gets connected. I have even tried this
> with no firwall except simple MASQUERADE rule for my 192.168.x.x series
> machine. But the same problem. As soon as I disconnect VPN I can
> get in LAN.
> Can someone suggest anything? I am very very bad in VPN and firewalls.
> 
> With warm regards,
> -Payal

your cisco VPN client is configured (at the VPN gateway end) not to
allow "split-tunneling" and is working as designed.

contact the administrator of the VPN gateway and ask to have
split-tunneling enabled so that you may access your LAN simultaneously.

-j

-- 
Jason Opperisano <opie@817west.com>


