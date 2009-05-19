From: Jason Vas Dias <jason.vas.dias@gmail.com>
Subject: Re: Anyone achieved BSD natd(8) compatibility with Linux netfilter or 
 =?iso-8859-1?q?=09Solaris_ipf_-_ie=2E_single-address-on-same-interface?=
 =?iso-8859-1?q?_bidirectional_mapping_to_=09DMZ_private_subnet?= ?
Date: Mon, 18 May 2009 20:07:51 -0400
Message-ID: <200905182007.52087.jason.vas.dias@gmail.com>
References: <102f5c010905151710m7bf674e9s6abb5d36b8c4fcca@mail.gmail.com> <4A0FC74A.4080503@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:organization:to:subject
         :date:user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=wd90AEeZkTw+ndJ2mWS9bn3W0kstuU1rW9Rs2+wAt28=;
        b=iC9jiXi6qQ4uWQup1/d47MAj2Fv6KFt5JyCORzWBZYKsryPv/YmTKJg+QX3Lw7oXS0
         iAqlsoa/btcGMlmHsRhfhVYLkI9yyb9zcapJQwSCjomAkscT16I0Ao2KIxoKPoelSJ9l
         HF6afEx8Wrvgf0MQQb0o6tcdH7LG3viE4pT6Y=
In-Reply-To: <4A0FC74A.4080503@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Cc: netfilter@vger.kernel.org

Thanks for the response. 

I finally figured out how to do this on Solaris :

  $  echo 'map hme0 192.168.2.0/24 -> 0/32' 

does the job for primary interface hme0 , configured by DHCP,
with static logical interface hme0:1 configured as 192.168.2.1
and dhcpsvc.conf containing "INTERFACES=hme0:1' and 
dhcptab set up to serve the 192.168.2/24 network, setting
the default-router option to 192.168.2.1 , and with 
   "ifconfig hme0 dhcp
    ifconfig hme0 addif 192.168.2.1 netmask 255.255.255.0 broadcast 
192.168.2.255 up arp
    ifconfig hme0 router
    ifconfig hme0:1 router
    svcadm enable svc:/network/dhcp-server
    svcadm enable svc:network/ipfilter
  '
somewhere in startup scripts .

The Solaris box is my only non-laptop box so problem solved (for me) -
but I'd still like to know:

Please, could anyone answer :
 o is there / what is the equivalent netfilter rule for Linux ?
 o why do the firestarter rules  require two physical ethernet
    interfaces in order to enable "internet connection sharing" ?
 o Is it possible to do internet connection sharing with NAT on Linux
   with only one physical etjhernet interface ? 
  All the documentation I can find assumes two interfaces.
  I want to know how to be able to create  a similar configuration
 on Linux, ie:
  - single primary physical ethernet interface (eth0) configured with 
DHCP
  - a "private" ip also configured on eth0:
   $ ip addr add dev eth0 192.168.2.1/24 ...
  - DHCP set up to serve 192.168.2/24 net ( I can do this OK !)
  - create NAT rules to replace source address of packets with
   dest addr not on subnet 192.168.2/24 with DHCP address
   of eth0, maintainence of state for such packets, and mapping
   the destination address of packets received from non-192.168.2/24
   network to the 192.168.2/24 address of the originating host for
   the 'ESTABLISHED' packet session. 
   Is this possible with a single ethernet interface on Linux or not? 
   
Thanks & Regards,
Jason


On Sunday May 17 2009 04:14:02 Brian Austin - Standard Universal 
wrote:
> Hi,
>
> this seems very simple, google for source nat, destination nat and
> masquerade
>
> http://www.howtoforge.com/internet-connection-sharing-
masquerading-on-linux
>
> portforwarding is also rather simple.
>
> regards
>
> Brian
>
> Jason Vas Dias wrote:
> > Hi -
> >
> > This is my first post to this list, so please excuse me if I miss
> > something or if this is an inappropriate posting for this list.
> >
> > Question :
> >
> > I am trying to replace an ancient MacOSX box, whose natd(8) does a
> > really great job of
> > "Connection Sharing" - becoming a router for the "External Internet"
> > to my local LAN
> > subnet whose addresses it has provided with DHCP ( 192.168.2.2 - 4 
) .
> >
> > So natd(8) maps the IP source address in packets originating from the
> > local 192.168.2.{2,3.4} subnet
> > that appear from the en0 interface, to the external internet address
> > given to the single interface en0 by
> > my DSL modem , and sends such packets out on en0 with the 
destination
> > address and port mapped back
> > to natd's address and port on the external internet .   natd(8)
> > maintains a table of all such packets sent
> > out to the external internet, such that when a response for such a
> > packet it received, the destination
> > IP address is mapped back to the original packet originator, and is
> > then sent back out on en0 to the
> > local DMZ subnet host that originated it,  as in this diagram :
> >
> >    MacOS Host:
> >    single IP interface  en0:
> >         ipv4 address 192.168.2.1
> >         ipv4 address 66.68.31.192 (assigned from DSL router)
> >    natd:
> >         listens on      66.68.31.192:natd
> >   bootpd:
> >         listens on      192.168.2.1:bootps
> >
> >     DMZ   hosts:  192.168.2.2, 192.168.2.3,   192.168.2.4
> >
> >   All these hosts are connected to the same hub, whose uplink cable is
> > connected to the DSL Router.
> >
> >   natd(8) reads a raw socket to receive every packet that is received
> > on interface  en0.
> >   When a packet is received from a 192.168.2.x source address  with 
a
> > destination address
> >    that is not  in subnet 192.168.2/24 , it replaces the 192.168.2/24
> > address with 66.68.31.192,
> >    and the destination address and port with 66.68.31.192:natd , and
> > sends the packet back out on en0;
> >    the DSL router sends such packets on to the external internet, and
> > the external internet host sends
> >    responses back to 66.68.31.192:natd;  natd can then use  the 
packet
> >  identifiers it generated
> >   for the request packets to the response packet (it could  even use a
> > separate port to receive
> >   response packets  for each separate DMZ  host, so the mapping
> > becomes trivial).
> >
> > My  question is : how can this be achieved with Linux netfilter or
> > Solaris IP Filter / ipnat(4) ?
> > I have either a Solaris host or Linux host I can use for this job. The
> > old MacOSX ppc32 host is
> > too slow, and does not support more than two other hosts on the 
DMZ .
> >
> > What I don't understand from the netfilter / ipfilter documentation 
is
> > precisely how a response
> > from the external internet , whit a destination IP + port on the
> > gateway , is translated into a response
> > for a DMZ host in the same way as netd does.
> >
> > I have looked  at the open-source firestarter project, which can
> > construct NAT rules to do this for a gateway
> >  host with two physical interfaces, but all my hosts have only one
> > physical ethernet interface.
> >
> > Could anyone please explain how response packets can be routed 
back to
> > the DMZ host with Linux netfilter or Solaris ipfilter rules ?
> >
> > Thanks in advance,
> > Jason.
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-
info.html

