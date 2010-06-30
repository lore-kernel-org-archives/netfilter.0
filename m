From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: nat bypass
Date: Wed, 30 Jun 2010 11:54:15 +0200
Message-ID: <4C2B1447.1070806@chello.at>
References: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 28.06.2010 12:13, ratheesh k wrote:
> Hi,
>
>    A ------->  R ------->S
>
> I have a linux machine A is connected to Linux machine R . Machine R
> is having two network interfaces and acting as a router .
> It has a dhcp server running  . It will assign ip in 192.168.1.0/24
> subnet to all machine connected on lan side ( A is connected also in
> lan side ) . Wan side of R is connected to HTTP server S . There is
> also a DHCP server running on S to assign ip in 10.232.18.0/24 subnet
> .  Is there any way , in which NAT should be bypassed to get ip from
> DHCP server running  on S . My question is : How can A will get  an ip
> from 10.232.18.0/24 pool ip .?
> ebtables is an option ? How can we make it ?
> Is there any other optimal way ?

How about a VPN?
i.e. OpenVPN on S.
Clients from A become members for both networks using DHCP locally (R) 
and via VPN (S).

regards


Mart
