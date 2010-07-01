From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 11:59:13 +0200
Message-ID: <4C2C66F1.1080602@plouf.fr.eu.org>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>	 <4C29E8B4.5060205@plouf.fr.eu.org>	 <1277821770.4006.33.camel@casper.meteor.dp.ua>	 <4C2B6536.2060401@plouf.fr.eu.org> <1277941138.11021.20.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277941138.11021.20.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Pokotilenko Kostik (approximate romanization) wrote :
> 
> Funny thing is that the problem persist. Tonight I've made some tests
> with 782M. I've connected two computers in my office (win7 and linux)
> through this pair directly. I seccessfully tested ping both directions,
> then switched them so that each crossed the bridge and was unable to
> ping.
> 
> tcpdump from linux showed:
> 
> 1. while pinging from linux to win7:
> 
> - Linux sends broadcast ARP-WHO-HAS win7-ip and no one replays
> - I was able to see win7's ARP-WHO-HAS some-other-ip after that linux
> probably learned it's MAC and started to send unicast ping requests,
> still no replay
> - I also saw some unicast packets from win7 crossed the bridge
> 
> 2. while pinging from win7 to linux:
> 
> - linux gets broadcast ARP-WHO-HAS linux-ip
> - linux replays unicast ARP-IS-AT
> - those two repeat, so win7 doesn't get replay
> 
> Regarding this I can surely tell (this is all about 782M pair) that
> after box crossing the bridge MAC-port table is not updating (how it
> should be if it were switch's logic). Packets with srcMAC of crossed box
> CAN cross the bridge, but with dstMAC of crossed box CANNOT cross the
> bridge.

An explanation may be that the MAC table in each modem is updated only
with the source address of packets received on the ethernet port and not
those received through the VDSL link, based on the assumption that the
other modem already takes care of them.

Do the modems have a management interface that shows the contents of the
MAC table ?
