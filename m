From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Looking for a how-to type battle plan for 2 physical
 subnets and an	openvpn tunnel.
Date: Wed, 16 May 2007 18:53:20 -0600
Message-ID: <web-14764344@bk3.webmaillogin.com>
References: <bf0ca81a0705161135y12499869yc93ea9043eec44bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bf0ca81a0705161135y12499869yc93ea9043eec44bc@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bill Ries-Knight <steelhoof@gmail.com>, netfilter@lists.netfilter.org

My approach to this:

Internet
!
!
+-----+
!     !
!     !
eth0  tun0
!     !
!     ???
!
+--eth1 (administration/teachers)
!
!
+
eth2 (lab)

Sorry for don't put in the diagram the allowed access for the roadwarriors.

-> "Without ipmasq there is no name based browsing at all" and "VPN happy 
but no browsing"

The OpenVPN client configuration is telling to the clients use another DNS 
servers than the configured in the gateways? If the answer is true, your 
firewall rules takes in consideration that kind of traffic?

Are you speaking about local network navigation using WINS or DNS resolution 
browsing the Internet?

To figure out better the situation you must put the result of:

ip r
ip a
iptables -L -nvx

And, additionally you must ask about the OpenVPN issues in the OpenVPN 
mailing list.

May this help you,

Jorge.

On Wed, 16 May 2007 11:35:10 -0700
  "Bill Ries-Knight" <steelhoof@gmail.com> wrote:
> ok, I have a solution issue...
> 
> We just had a server cracked (fc4, built by my predecessor)
> 
> The server acts as a firewall, VPN Server, content filtering system,
> samba server for files and ssh tunnel to the network.
> 
> There are 3 nics covering 2 physical subnets , school
> administration/teachers and computer lab for the sudents, each with
> thier own NIC and the gateway to the internet on the third.  Openvpn
> provides a tun interface with a third subnet to manage.
> 
> Software we are running is iptables for the firewall, Openvpn for the
> vpn tunnel between physical sites, samba and clamav/squid/dansguardian
> for content filtering and openssh for remote access.
> 
> I am using Debia Etch for the server.
> 
> Is there anyone with a reference on how to manage this one?
> 
> I can get the old firewall rules into place, but adding ipmasq munges
> it all up.  Without ipmasq there is no name based browsing at all.
> 
> At various times I can get the vpn happy, but no browsing.  if I try
> to bring both physical subnets into play, it munges.  I have issues
> with name based internet browsing, or a few minutes later, I have
> issues with the ip address based access.  Ie: I can ping out, but not
> name browse..  a bit later I cannot even ping out.
> 
> I am really lost here.
> 
> Help!
> Please.
> 
> -- 
> -- 
> Bill Ries-Knight
> Stockton, CA
> 
> Respect the process, Vote.
> 
> 

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com

