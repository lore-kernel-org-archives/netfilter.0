From: SamLT <sam@sltosis.org>
Subject: Re: Routing the DNS Traffic via specific interface.
Date: Fri, 27 Jan 2012 16:51:05 +0100
Message-ID: <20120127155105.GA9371@tosh.sltosis.org>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
 <607824512.20120125163350@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1327687215; bh=jyBtJsEDqNGCloNxJ3SInKMWysQyo5s9ofLV4YLI/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Q7YXRK0duiceu92ikFWMX5pC4pRJGVwQCaTS5Y/iMoodyRcSFphkJt9gYmHPvdFQ6
	 hzEUVnAaVD7eP9nHSmdOppwyu03j4WjHEAgGIFTOxxhq6f1gZuzabxnd3otJc8VyfP
	 X12bIWSiHy/pFL6sVSpRW2+C8Cp0skNh/Oga8YB4=
Content-Disposition: inline
In-Reply-To: <607824512.20120125163350@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org, gnetravali@sonusnet.com

On Wed, Jan 25, 2012 at 04:33:50PM +0700, gapsf@yandex.ru wrote:
> No. You should use "Policy routing" with MARK target in iptables.
> 
> Mark outgoing DNS packets with iptables in mangle PREOROUTING for example.
> # iptables -t mangle -A PREROUTING -p udp --dport 53 -j MARK --set-mark 0x4
> 
> Create additional routing table with different routing rules.
> Add new entry in /etc/iproute2/rt_tables
> =========================================
> #
> # reserved values
> #
> 255     local
> 254     main
> 253     default
> 0       unspec
> #
> # local
> #
> #1     inr.ruhep
> 1      isp2 # <- new entry
> =========================================
> 
> Then execute
> # ip route flush table isp2
> and add defalt route into newly created table
> # route add default via <ip_of_your_eth2_gateway> dev eth2 table isp2
> 
> Add new policy in RPDB.
> # ip rule add from all fwmark 0x4 table isp2


Consider adding a preference/priority to your rule(s) to avoid potential
future headaches

> 
> Check RPDB
> # ip rule show
> You should view somthing like this:
> 0:      from all lookup local
> 32763:  from all fwmark 0x4 lookup isp2
> 32766:  from all lookup main
> 32767:  from all lookup default
> 
> In result: all traffic routed with main routing table, except marked DNS traffic routed
> via "isp2" routing table via its default route and iface.
> View picture http://postimage.org/image/nn9owf5x7/ for example.
> 
> NG> Hi ..
> 
> NG> I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?
> 
> NG> Block the output DNS traffic on eth0 interface.
> 
> NG> iptables -A FORWARD -p udp -o eth0 --dport 53 -j DROP
> 
> NG> Forward output DNS traffic from eth1 interface
> 
> NG> iptables -A FORWARD -p udp -o eth1 --dport 53 -j ACCEPT
> 
> 
> NG> Thanks
> NG> Ganesh
> 
> 
> NG> --
> NG> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> NG> the body of a message to majordomo@vger.kernel.org
> NG> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
