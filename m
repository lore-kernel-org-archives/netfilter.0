From: Jaga Doe <jaga.doe@aol.com>
Subject: Redirect bridged traffic
Date: Wed, 5 Feb 2020 18:04:26 +0000 (UTC)
Message-ID: <1561900038.672905.1580925866433@mail.yahoo.com>
References: <1561900038.672905.1580925866433.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1580925869; bh=n2y1DSyR3OhNMn98QHbq6XINxemv/B2siSo67kbcq1E=; h=Date:From:To:Subject:References:From:Subject; b=GU23ZFyibuLTR1EyD+ndnidRyBiTLPj+AIP65CUil4jCxhNSSX8b+kPmMoML2dCGNAg7LIdvC4R0gu8gPR1zPiKTH95bOoNbGHQEi+1eOGVMPn4H/vt2oceLSjl3uRP8+ZGlijXH58/Dc/DeZI1AKCHhF5LzAiKz8+4zMvBsBjBFKCkigYt7M1I0IrdE7ZXspoErWqwVMZroLtALFPX9Yv6/gNOOxjXURsAmIPIVFeBYN8NVGjGDYe6EA/NHBK0Nrn6TSm0WL85ui1DMaWeyU/ssmGkYTi1uAM3Bc4H7Ca34Daoe8dy5JG0gOcEiQEexvTrOyWG92QbT3McneFyIiQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


      Hello,

   I have a device with 3 NICs connected to two networks as follow:
1. eth0 connected to monitor network used for accessing my device and do configurations.
2. eth1 connected to main network which contains routers, DHCP server, NTP server, etc.
3. eth2 connected with a direct cable to a device (PC0) supposed to be part of the main network.

My device needs to pass through the entire traffic between PC0 and the main network excepting the one connecting on port 3000 of PC0 which needs to be redirected to a local process. The local process at it's turn needs to connect to PC0 on port 3000 and the replies to be passed back to the main network client.

For this I have created a bridge which is able to pass all the traffic between eth1 and eth2:
brctl addbr br0
brctl addif br0 eth1
brctl addif br0 eth2

ip link set br0 up

Using this, the PC0 is able to access all services from the main network (i.e DHCP for getting the IP address). Though the performances of the bridge is much lower than expected, the speed being almost 6x lower comparing to direct access of PC0 to main network.

For redirecting the traffic I was trying to use the nftables configuration below:

#!/usr/sbin/nft -f

flush ruleset

define MON_MAC=00:0c:29:15:7b:a0
define TPORT

table bridge tbrFilter {
    chain cbrRedirect {
      type filter hook prerouting priority 0;
      log tcp dport $TPORT meta pkttype set host ether daddr set $MON_MAC counter
    }
}

table inet tlcRedirect {
    chain clcRedirect {
      type nat hook prerouting priority 0;
      log tcp dport $TPORT counter redirect to $TPORT
    }
}

Using this configuration, the connection to PC0:3000 seems that it is captured by the nft but is not going to the local process.

What I am missing here?

Thanks and best regards,
Jaga.
