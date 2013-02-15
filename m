From: John Corps <envoys@gmail.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 13:46:51 -0500
Message-ID: <CAFURDX-j3AhJ-3uUdWqoaX3N17-Q6PzKaS-waWHOzRkq6BD-hw@mail.gmail.com>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	<1360946103.2251.2.camel@andylaptop>
	<CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
	<1360947911.2251.24.camel@andylaptop>
	<CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
	<1360952022.2174.1.camel@andylaptop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=Gt62VoCnKgEP64CliOzMAMG//AIVMq0V5pGyCQV7CxY=;
        b=y0PrGUfOLYnFubTgrdWqM9VRi/rGhhCPKVvoixCfGE3Dgen9wxdEaMlUXXGGnEydBc
         aBWBP8Wx8eZuL/sPRC4dRcQPs1i8U4PljbvyGqhdOL3Edz57t97/O1OnCcom9iAVJNro
         PO3xisFXaUBHTcSyW0WATrQDcakOFbD7dn2CqvHR060uGVmIJC33kUgJn/sLVy39+5Hm
         4/DKiY1iXuZcSYVI3zBvCFWC0SVU0nYQ3QJYT4Nmiql3iROdGovgQxryQMWo/6WID7IF
         Zr19KIHqTNaAi3ztkgSIP0I2wEemMPj3LCt0u26W16VY83EcTQ0gSWnEx3A35QvQTDil
         vAkA==
In-Reply-To: <1360952022.2174.1.camel@andylaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Fri, Feb 15, 2013 at 1:13 PM, Andrew Beverley <andy@andybev.com> wrote:
> On Fri, 2013-02-15 at 12:28 -0500, John Corps wrote:
>> Very odd...put on a simple logging of
>> iptables -A INPUT -i eth1 -j LOG --log-prefix "DNS TEST INPUT drop: "
>>
>> getting nothing in the logs...this is mind baffling. Even with TCPDUMP
>> not seeing any packets unless i set client DNS to local ip of server,
>> the 192.168.1.2 dns, set it to google for a test of 8.8.8.8 and get
>> nothing in logs or with tcpdump.
>
> What's your network topology? Any chance that the packets are not being
> routed through your server?
>
>
>

I wouldn't think they wouldn't be getting routed through as all the
test devices are all on the same switch and all on the same vlan.
It's simple a switch, the server i'm trying iptables with is plugged
into port 1 which is untagged on vlan 1000, and the client pc is on
port 2 which is also untagged on vlan 1000. There is no uplink to any
other switch or router etc, just this switch and 2 devices plugged
into it.

Since the 1 client pc is windows, i haven't got dig on that to test,
but doing simple nslookup with dns statically configured on the nic to
8.8.8.8, its trying to go to that one and gets timed out, but doing
nslookup pointing to the 192.168.1.2 which has the iptables rules,
give me back the right IP.
