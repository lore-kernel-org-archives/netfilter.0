From: "Knight Tiger" <caugar@gmail.com>
Subject: Forwarding packets received on bridged interfaces to DHCP server -regarding
Date: Thu, 22 May 2008 17:49:19 -0700
Message-ID: <69fec4520805221749u66f7e720sac91a67aaf6994b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=oxGIo3DMuIdX2tU3jYAlfzrfaVO8dI9aUfuXGNg6CVE=;
        b=vLeu17lgwAMq+5CpX/kNP9hkEnpIsE56rYRjFOPYtS9H0UxpCUIXD4EHSo3vuO5qIOg2Ip/N2tHhnhKy99Qsr7FcQhxvV47DYY4RJbCfmmfQb2ExbGEzEyUgX83/oJnSsoMGZYByccJtSRF/Z4kBNItYBtW0TFpDWdH7Gb6VpeY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Let me describe the setup that I wish to build.

I  have a Linux box with two interfaces, eth0 and eth1. eth1 is a
wireless interface with connects to a network and receives a DHCP
address. eth0 connects to a AP (with a cross over cable) and provides
Internet connection to a bunch of clients. The setup looks like this

AP1 <--> eth0      eth1 <---> AP2<---> DHCP server.

Using brctl I create a bridge with eth1 and eth0. I have not assigned
an IP address for the bridge. eth1 receives an IP address for the DHCP
server. When a client connects to AP1 and requests an IP address from
the same DHCP server, I am not able to see the request on the DHCP
server. I did a tcpdump on eth0, eth1 and br0. I am able to see the
DHCP request packet with the client MAC address on all three
interfaces. But for some reason, the DHCP request is not forwarded to
the DHCP server.

So I installed ebtables to redirect the packets when it arrives on
eth0 to eth1 so that the packets can be forwarded to the DHCP server.
I use the BROUTING chain for I read that it is the first chain to be
traversed when a packet arrives on a bridged NIC. But for some reason,
the packets are not forwarded. Is there something wrong with my
settings on ebtables ?

ebtables -t broute -I BROUTING -d ff:ff:ff:ff:ff:ff -i eth0 -j ACCEPT
ebtables -t broute -I BROUTING -d ff:ff:ff:ff:ff:ff -j DROP

I only want the bridge to forward all the traffic it receives on eth0
to eth1 and eth1 should send the packets out.

All incoming packets not destined for eth1's IP address should be
forwarded to eth0.

I would greatly appreciate any leads in ebtables configuration.

Thanks
Regards
Knight
