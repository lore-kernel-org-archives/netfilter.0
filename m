From: Zen Kato <zenkato@pis.bekkoame.ne.jp>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Fri, 12 Sep 2003 21:33:03 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912213303K.zenkato@pis.bekkoame.ne.jp>
References: <20030903194627.25529b33.arnt@c2i.net>
	<20030909082106I.zenkato@pis.bekkoame.ne.jp>
	<20030911023808.2ef281a5.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030911023808.2ef281a5.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Thu, 11 Sep 2003 02:38:08 +0200

> > SIP UAs could send and receive "REGISTER", "INVITE", "200 OK", 
> > "ACK" and udp media packets via .100.30. So, DNAT/SNAT of iptales-
> > 1.2.8 works fine, but both sip phones can not have "audio"?!
> > 
> > Both sip phones worked fine when I tested using non-NAT with a local
> > sip proxy. I don't know why this case does not work.
> 
> ..pass, I dunno much about VoIP.  This works in your lan but 
> not across your firewall?  Does it conflict with nat?

Please refer the following sites for sip VOIP:
http://www.iptel.org for sip proxy "SER" and
http://www.grandstream.com for sip hardphone BT101/102

BT101(1011@tel.no-ip.com:5064),BT102(1021@tel.no-ip.com:5060) and sip
proxy server(ser-0.8.10)sits on 192.168.100.0/24. The linux iptables 
box is used for the purpose of 'bouncing(reflection)' at 192.168.100.30.
So, I have not set any packet filter on this box now.

The packet filter and portfowarding are set on ADSL modem/router
(NEC DR302CV(T)) on 192.168.0.1. This ADSL modem/router has fixed SIP
IP phone port(RJ11 FXS)(sip udp port:5060 and udp RTP/RTPC ports) and
sip address such as 050xxxxyyyy@sip.provider.co.jp. When we use this
sip phone, this adsl modem has to be not 'bridge mode' but 'router 
mode'.  

The sip packets flow(REGISTER,INVITE,TRING,...BYE) using iptable-1.2.8 
seems to be normal. But each IP phone(BT101,BT102) can not hear the other
side IP phone. I am now asking why to the manufacturer. If it works 
between these phones, then these IP phones should work across the nat and
firewall on 192.168.0.1(NEC ADSL modem/router) to other firewall/NATed
IP phones. Because my former NEC ADSL modem/router, DR30F which could
do 'bouncing(reflection)' on 192.168.0.1 as default and every SIP hard
phones and softphones such as MSN windows4.6, worked fine with ser-0.8.10 
on 192.168.0.26.

I don't have a strong confidence to work SIP with iptables because
I found the following site;
=====================================================================
http://www.netfilter.org/documentation/FAQ/netfilter-faq.txt

  netfilter/iptables FAQ
  Harald Welte <laforge@gnumonks.org>
  Version $Revision: 1.41 $, $Date: 2003/06/27 15:12:23 $

1.8 Are there any plans to support SIP?
  The SIP (Session Initiation Protocol) is quite complex, especially
  getting it acrosss firewalls and NAT devices.  The initial proposal
  was a proxy communicating over FCP (Firewall Control Protocol) with
  the packet filter.  Now an IETF MIDCOM working group has been founded,
  ... meanwhile, people want to use SIP.

  The netfilter/iptables team has currently no ressources to implement
  SIP conntrack/NAT support, but we're always open for sponsors :)
======================================================================
 
Regards,

Zen



