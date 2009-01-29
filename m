From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Multiple Incoming connections
Date: Fri, 30 Jan 2009 00:48:02 +0100
Message-ID: <49824032.8050906@chello.at>
References: <bb09457e0901291258n35a64c07t3f36fd935f98f71c@mail.gmail.com> <bb09457e0901291412g1ad7f906x7251d1f3c866e712@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bb09457e0901291412g1ad7f906x7251d1f3c866e712@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Didster wrote:
> Hi there,
>
> This is probably a very silly question, but here it goes.
>
> I have a linux box which I am using as an internal router
> [2.6.18-6-686].  These machine is connected two multiple ISPs via two
> separate NICs.  The connections are not direct, they are via PIX 501
> firewalls.  Both NICs use private IPs and the PIXes do address
> translation.  A third NIC connects the machine to a LAN.  The default
> gateway on the box is set to the private IP of PIX 1..
>
> I am trying to get incoming connections working from both ISPs.  I
> have apache running on the machine.  Both firewalls are set to allow
> port 80 though and translate it to the IP of the linux box.
>
> An incoming connection to the public IP of PIX 1 works just fine
> But an incoming connection to the public IP of PIX 2 does not =96 unl=
ess
> I change the default gateway on the box to be the private IP of PIX 2=
=2E
>
> A trace shows the connection coming from PIX 2 and then the reply
> going back out on PIX 1
>
> I have rp_filter switched off and ip_conntrack module loaded.
>
> Does anyone know how to stop this?  I thought conntrack would send th=
e
> related traffic back out of the route the initial request come in on.
>  =20
search google for: source based routing linux

greets

mart
