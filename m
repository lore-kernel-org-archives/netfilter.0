From: Pandu Poluan <pandu@poluan.info>
Subject: Re: OUTPUT SNAT
Date: Fri, 11 Feb 2011 23:27:25 +0700
Message-ID: <AANLkTimG330ctZjRk8a=ps19bpKc35x86hBT8+DGKycD@mail.gmail.com>
References: <AANLkTimBv5i=wHBW=_QCUkbkW32UA5bH1T2Le=2Hd_Ez@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimBv5i=wHBW=_QCUkbkW32UA5bH1T2Le=2Hd_Ez@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Whelan <rcwhelan@gmail.com>, netfilter@vger.kernel.org

Maybe you can employ -m physdev ?

http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html

(sorry, never used br0 and tun0)

Rgds,


On 2011-02-11, Ryan Whelan <rcwhelan@gmail.com> wrote:
> I have a linux router with a WAN/VPN interface (tun0) and a LAN/Bridge
> (br0).  The SVI address on the bridge is 172.21.0.1 / 28.  The Linux
> machine doesn't do any masquerading so all the traffic from machines
> connected to the br0 interface contains its original address.  All
> traffic from the Linux router itself, sent over the VPN has a source
> address of the tun0, of course.  Is it possible to to SNAT all traffic
> sent over the VPN to have a source ip of the bridge SVI?
>
> Something like: `iptables -t nat -A OUTPUT -o tun0 -j SNAT --to 172.21.0.1`
>
> `iptables -t nat -A POSTROUTING -o tun0 -j SNAT --to 172.21.0.1`
> works, but it will also masquerade all traffic forwarded from the
> bridge (br0) interface.
>
> Is this possible with netfilter? or even possible with linux?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
