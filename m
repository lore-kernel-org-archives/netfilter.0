From: "=?ISO-8859-1?Q?Cloves=20Pereira=20Costa=20Jr?=" 
	<cloves.costa@m2sys.com.br>
Subject: Re: Multiple Incoming connections
Date: Fri, 30 Jan 2009 08:34:10 -0200
Message-ID: <20090130103410.16008.qmail@hm668.locaweb.com.br>
References: <49824032.8050906@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49824032.8050906@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Fri, 30 Jan 2009 00:48:02 +0100, Mart Frauenlob <mart.frauenlob@chello.at> escreveu:

> Didster wrote:
> > Hi there,
> >
> > This is probably a very silly question, but here it goes.
> >
> > I have a linux box which I am using as an internal router
> > [2.6.18-6-686].  These machine is connected two multiple ISPs via two
> > separate NICs.  The connections are not direct, they are via PIX 501
> > firewalls.  Both NICs use private IPs and the PIXes do address
> > translation.  A third NIC connects the machine to a LAN.  The default
> > gateway on the box is set to the private IP of PIX 1..
> >
> > I am trying to get incoming connections working from both ISPs.  I
> > have apache running on the machine.  Both firewalls are set to allow
> > port 80 though and translate it to the IP of the linux box.
> >
> > An incoming connection to the public IP of PIX 1 works just fine
> > But an incoming connection to the public IP of PIX 2 does not ? unless
> > I change the default gateway on the box to be the private IP of PIX 2.
> >
> > A trace shows the connection coming from PIX 2 and then the reply
> > going back out on PIX 1
> >
> > I have rp_filter switched off and ip_conntrack module loaded.
> >
> > Does anyone know how to stop this?  I thought conntrack would send the
> > related traffic back out of the route the initial request come in on.
> >   
> search google for: source based routing linux
> 
> greets
> 
> mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> 

You can take a look at http://linux-ip.net/html/linux-ip.html#adv-multi-internet-outbound.

In this site you will find a lot of information about linux routing.

[]s

Cloves Pereira Costa Jr

+55 41 8808-8553
Skype: clovespcjr

