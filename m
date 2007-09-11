From: "Sathish Kumar R" <geosathish@gmail.com>
Subject: broadcasting over ipsec vpn..?
Date: Tue, 11 Sep 2007 17:20:05 +0530
Message-ID: <3e5af7bc0709110450t283367b0tdf815de5b616a3f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=awQfP9fYBrGaLddqyw2YHL5rn0Rp2C5CsolTKb13n7I=;
	b=DP1zSPwflVNca+qI/zEAJK0cfl0WkE2+8Mmmwc+OknTKTqSrqv1FbknRW70tiGGFAXrVO2Up35+OBjuHqjLGPm7GNYQcxMBzGA6waT9+TYtanzCjUR6LF6jT0NHi1kNKPWVZ51f043I0nVVcCEmAx2k5Tio0tjxVIeHv1SkN/1U=
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everybody,

i need to know the possibilities of iptables for the following setup..

My gateway security device has three interfaces

Device-1
--------
eth0 - WAN - (192.168.1.10)
eth1 - LAN - (192.168.50.1)
eth2 - DMZ - (10.10.10.1)

and i am making a ipsec VPN connection with another device Device-2,

Device-2
--------
eth0 - WAN - (192.168.1.15)
eth1 - LAN - (192.168.60.1)
eth2 - DMZ - (10.10.20.1)

VPN connection gets established successfully,

here my requirement is regarding broadcast messages to remote subnet over vpn.

i have one broadcast server in Device-1 and it is binded with
192.168.50.1 interface and broadcasting to 255.255.255.255,

the 192.168.50.0/24 subnet can able to receive the broadcast messages,

is it possible to communicate the same broadcast message to the remote
subnet(192.168.60.0/24) via ipsec tunnel  ...?

with regards,

Sathish Kumar.R

