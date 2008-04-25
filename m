From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: nfconntrack and asymmetric routing
Date: Fri, 25 Apr 2008 21:24:11 +0200
Message-ID: <BAY103-DAV111F37548D4281FB84FF29B2DD0@phx.gbl>
References: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl> <alpine.LNX.1.10.0804251934090.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> 
> On Wednesday 2008-04-23 10:54, Marco Berizzi wrote:
>>
>>Unfortunately I have a linux firewall
>>which see half of packets because of a
>>bad designed network.
>>nfconntrack table is full of these entries:
>>
>>ipv4     2 tcp      6 431303 ESTABLISHED src=172.23.1.21 dst=82.9.69.137
>>sport=25 dport=4036 packets=2 bytes=256 [UNREPLIED] src=82.9.69.137
>>dst=172.23.1.21 sport=4036 dport=25 packets=0 bytes=0 mark=0 use=1
>>
>>because netfilter never see the fin/rst
>>tcp packets.
>>They never expires and sometimes linux
>>logs these messages:
>>
>>nf_conntrack: table full, dropping packet
>>
>>Is there a way to tell netfilter to delete
>>these entries?
> 
> Would not it be better to disable connection tracking for
> the asymmetrically routed packets?

Is there a way to do it?
