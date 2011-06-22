From: Adishesh M <adisheshsm@gmail.com>
Subject: Re: Using interface name as a command line option to create a
 iptables rule
Date: Wed, 22 Jun 2011 09:55:00 +0530
Message-ID: <BANLkTiksEDRhm2RbTfVFJUHcQqC4bLmyHg@mail.gmail.com>
References: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
	<alpine.LNX.2.01.1106201359080.12967@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=PNi5WYf+55wite/Fb+CsSqtr7kNsN61dF1iwkPtmKm8=;
        b=iq8FOU3ItKDvtQOLECuaWTeb4SdSdBP3t6hMwYK7A1GPf8fNEQ3B0CZMdrPpEsq/1C
         FaFv1WF2Q4lfb5X05XMCDwkcavwj8xC6BJm4DXzu6HVZd2r10zcmZxYMIBTXTCbi/1ay
         pPvfy/l3/XdG2K3lLiG9+FyHK2j3ZuiULqmLo=
In-Reply-To: <alpine.LNX.2.01.1106201359080.12967@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

Hi


> The two sets certainly can be different (mathematically), so choose
> wisely. Especially since addresses can occur on any interface.


Currently we are not using DHCP to get IP addresses. So for us, it is
always eth0 with 192.168.229.131  and eth1 with 192.168.124.135
address.

we wanted to know the difference between option 1 and option 2 (
mentioned in the first mail of this mail chain) with respect to
security of the system.

>Another nuance is possibility of ip/arp spoofing - you can get 192.168.229.131 from eth1.

Because of the above reason, do we compromise the security of our
system if we don't use  interface  name while enabling a port.

Thanks and regards,
Adishesh
