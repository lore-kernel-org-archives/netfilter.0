From: David Cannings <lists@edeca.net>
Subject: Re: how to stop broadcasts using iptables
Date: Tue, 27 Apr 2004 13:50:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404271350.11890.lists@edeca.net>
References: <20040427123529.HVYI23570.viefep19-int.chello.at@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040427123529.HVYI23570.viefep19-int.chello.at@localhost>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 27 April 2004 13:35, sschlesi@chello.at wrote:
> I'm trying to stop broadcasts getting forwarded, but I'm  not sure how
> to do this. i read that *.255 - which are afaik broadcast addresses -

My first question is why are broadcasts getting forwarded anyway?  Neither 
ethernet or IP broadcasts should leave your subnet.  How and where 
exactly are broadcasts being forwarded?

IP addresses ending in .255 are not always broadcast addresses.  Any 
subnet larger than class C (/24) can span more than one "block" of 256 IP 
addresses.

> doesnt guarantie that its a broadcast. then i read that its possible by
> matching the mac address, because broadcast will have ff:ff:ff:ff:ff:ff
> . but I'm not sure if that's all  nonsense.

There is the difference here between an IP broadcast and an ethernet 
broadcast.  IP broadcasts are sent to the ethernet broadcast address [1], 
so you may be able to do a MAC match.

According to the manual page I have here, the module "mac" only offers a 
--mac-source option but there are more options in PoM I believe, you may 
want to check the mailing list archives.

David

1- A ping to the broadcast address on a LAN:
13:44:59.765871 0:10:XX:XX:XX:XX Broadcast ip 98: 192.168.0.100 > 
192.168.0.255: icmp: echo request (DF)

