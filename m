From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: RE: bridge firewall and iptables.
Date: Tue, 4 Mar 2008 09:17:17 -0500
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E934@ASM220.aspen.com>
References: <001301c87e00$a2c92490$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <001301c87e00$a2c92490$0200640a@wtlc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Andrea Bencini <andrea.bencini@tin.it>


> -----Original Message-----
> From: Andrea Bencini [mailto:andrea.bencini@tin.it]
> Sent: Tuesday, March 04, 2008 9:04 AM
> To: netfilter@vger.kernel.org
> Cc: Eric Estes
> Subject: Re: bridge firewall and iptables.
> 
> > I have a similar setup and I ended up using ebtables to take care of
> > that.
> >
> > ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol
udp
> > --ip-source-port 67:68 -j DROP
> > ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol
udp
> > --ip-destination-port 67:68 -j DROP
> > ebtables -A FORWARD --in-interface eth0 --protocol ipv4
--ip-protocol
> > udp --ip-destination-port 67:68 -j DROP
> > ebtables -A FORWARD --in-interface eth0 --protocol ipv4
--ip-protocol
> > udp --ip-source-port 67:68 -j DROP
> 
> Can you tell me where I can put those rules? In which configuration
file
> and
> directory?
> Thanks
> Andrea
> 

I just created a script that I run at startup.

http://forum.openwrt.org/viewtopic.php?pid=31952
