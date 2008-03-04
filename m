From: "Andrea Bencini" <andrea.bencini@tin.it>
Subject: Re: bridge firewall and iptables.
Date: Tue, 4 Mar 2008 15:04:09 +0100
Message-ID: <001301c87e00$a2c92490$0200640a@wtlc>
References: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E924@ASM220.aspen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org
Cc: Eric Estes <Eric_Estes@aspensquare.com>

> I have a similar setup and I ended up using ebtables to take care of
> that.
>
> ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol udp
> --ip-source-port 67:68 -j DROP
> ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol udp
> --ip-destination-port 67:68 -j DROP
> ebtables -A FORWARD --in-interface eth0 --protocol ipv4 --ip-protocol
> udp --ip-destination-port 67:68 -j DROP
> ebtables -A FORWARD --in-interface eth0 --protocol ipv4 --ip-protocol
> udp --ip-source-port 67:68 -j DROP

Can you tell me where I can put those rules? In which configuration file and 
directory?
Thanks
Andrea 

