From: "Bill Ries-Knight" <steelhoof@gmail.com>
Subject: Looking for a how-to type battle plan for 2 physical subnets and an
	openvpn tunnel.
Date: Wed, 16 May 2007 11:35:10 -0700
Message-ID: <bf0ca81a0705161135y12499869yc93ea9043eec44bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=t/PS0G5Y8XShDG7rIvcgEGwlW6rB1xZjCyOkZhk//lneClyLP12Tgt6Ssv0w9d23yhvCPNL/euU8R6K5pSyUIVoEXFkCocL/mvyOTROdzuBW+xJQeIM87uYE8g09SCSSGM/HqH5x+ZkZZ6oljtlDsVIhY59T4uCpD7YLPhrI7HA=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

ok, I have a solution issue...

We just had a server cracked (fc4, built by my predecessor)

The server acts as a firewall, VPN Server, content filtering system,
samba server for files and ssh tunnel to the network.

There are 3 nics covering 2 physical subnets , school
administration/teachers and computer lab for the sudents, each with
thier own NIC and the gateway to the internet on the third.  Openvpn
provides a tun interface with a third subnet to manage.

Software we are running is iptables for the firewall, Openvpn for the
vpn tunnel between physical sites, samba and clamav/squid/dansguardian
for content filtering and openssh for remote access.

I am using Debia Etch for the server.

Is there anyone with a reference on how to manage this one?

I can get the old firewall rules into place, but adding ipmasq munges
it all up.  Without ipmasq there is no name based browsing at all.

At various times I can get the vpn happy, but no browsing.  if I try
to bring both physical subnets into play, it munges.  I have issues
with name based internet browsing, or a few minutes later, I have
issues with the ip address based access.  Ie: I can ping out, but not
name browse..  a bit later I cannot even ping out.

I am really lost here.

Help!
Please.

-- 
-- 
Bill Ries-Knight
Stockton, CA

Respect the process, Vote.

