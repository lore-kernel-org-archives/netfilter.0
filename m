From: "Knight Tiger" <caugar@gmail.com>
Subject: Re: Forwarding packets received on bridged interfaces -regarding
Date: Fri, 30 May 2008 15:32:54 -0700
Message-ID: <69fec4520805301532n7f68fc9m9af29004f1514833@mail.gmail.com>
References: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
	 <483E1DF2.3080304@riverviewtech.net>
	 <69fec4520805282155k441b60edo30a98bb26135df62@mail.gmail.com>
	 <483E3C6B.1030208@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=i2R5j/dHyuTDqGaUZIIL38a8E2SXRsnS1eDu2okoUq0=;
        b=NEUYkASbfA9QF2C3oipeVvXatUsKHyyb1mkCO9XhN5NVc3vy2e87vH26eiChHUXjYteSHB7jl/yJq7kHCmZ1wL1v7q4ujRPOG43j9UMHcIH5Ty8bsZRNMGys4Jf39oSNC9CmobGfl2mRnelcwi8/oH6ySCzNprnoIQbpIHkpHoY=
In-Reply-To: <483E3C6B.1030208@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

<snip>
>
>> The problem:
>>
>> The DHCP requests from the clients get blocked at the eth1 interface. I
>> want all traffic from the clients to go out via eth1. I would like to know
>> to configure this setup,
>
> I re-looked at your EBTables rules and did not see any thing that should
> prevent things from working as long as you are not using the MAC address of
> eth1 (i.e. talking to or from eth1).  If you are using the MAC of eth1 then
> you are forcing the bridge to route the packet when the IP stack will not
> have any thing to route.
>
> The only other thing that comes to mind is that seeing as how (I think) eth1
> is a wireless NIC, you may be dealing with problems with a wireless card
> that is not playing quite right.  You might consider testing your bridging
> (and filtering when it is time) via a regular computer with two wired
> ethernet interfaces.

I did the test on a desktop with two NICs and no iptables/ebtables
entries. The setup works great. Thanks. I expect the problem to be
with the wirless NIC (I use the Intel Linux drivers but apparently
they are no good for bridge settings).

Thanks again.

Regards
Knight
