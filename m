From: "P theodorou" <props666999@hotmail.com>
Subject: DMZ howto
Date: Thu, 22 Sep 2005 22:35:22 +0000
Message-ID: <BAY102-F143E63E82A0CD5F4DB4F67AE970@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org




>From: "XouS - Jose R Negreira" <xous@xouslab.com.ar>
>Reply-To: xous@xouslab.com.ar
>To: "P theodorou" <props666999@hotmail.com>
>Subject: Re: DMZ howto
>Date: Thu, 22 Sep 2005 11:20:50 -0300 (ART)
>
>Hi,
>
>the reason for having a DMZ, is (being put in the most simple terms):
>
>to publish services to internet or another insecure network reducing
>impact in case someone breaks through any of this published service.
>
>You want to have separated your hosts, on ONE network, DMZ, the "internet"
>machines, possible insecure, or if you want...call them the "dirty"
>machines, in a kinda way phisical isolation from ANOTHER network, your
>internal network, with your clean, nice, and secure hosts.
>
>
>Regards
>
>_____________________________________________
>Jose R. "Xous" Negreira.
>PortalJAVA.com.ar - http://www.portalJAVA.com.ar <--  ** new!!! ** :P
>XousLAB - http://www.xouslab.com
>iptableslinux - http://www.iptableslinux.com
>RDP - http://www.relacionesdepareja.com.ar
>
>
>
>
>
> > Hello
> >
> > I want to achieve the firewall script in the official iptables tutorial
> > 1.20 version practices here
> > http://iptables-tutorial.frozentux....MZ.firewall.txt
> >
> > typically a well known set up is
> > to receive traffic from the ISP via dhcp which assigns IP to eth0
> > and eth0 forwords traffic to eth1 (NAT) which is the default gateway for 
>a
> > laptop .
> >
> > Now the machine has eth0 eth1 and eth2 so far we have spoken
> > for eth1 . Eth2 i wanted to be a DMZ for servers who need passive
> > connections
> > FTP etc...
> >
> > The concept of DMZ confuses me , can you suggest any resources
> > for the topic ?
> >
> > Really appreciated
> >
> >
> >
>
>
>



