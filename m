From: SamLT <sam@sltosis.org>
Subject: Re: SNAT
Date: Wed, 22 Feb 2012 08:47:24 +0100
Message-ID: <20120222074724.GA11787@tosh.sltosis.org>
References: <20120222014817.M7308@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1329897152; bh=lF9pJOiGyKMZme0LSfDFS51/zSbED39g8WRLoYWHa6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=eFYa/GySdJImJbcI1f6lgGN7TbXbcrC1Myl7k7Ftd+AuSzxffPrm3Vg9JAZd+Cmj8
	 VtwTmaRv2XYCCufC/w/pBiUqv4UvJ26+BtJaPROiuvPiJSc6aOSAEGsrVeOdhDJgwC
	 WDCKkpRQjkVTT+wCidY2cjS5Qj/cMjfQmtnm22n0=
Content-Disposition: inline
In-Reply-To: <20120222014817.M7308@kdtc.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cc <cc@kdtc.net>
Cc: netfilter@vger.kernel.org

On Wed, Feb 22, 2012 at 10:04:32AM +0800, cc wrote:
> Hi,
> 
> Long story short, I'm now rebuilding a netfilter firewall 
> script as the original died with the firewall.  Well, died
> in the sense that it got corrupted.
> 
> Instead of needing to specify the following for each required
> port that needs to be used to connect to external sites,
> how do I just let any traffic originating from the LAN
> to connect?  (I'm feeling this isn't the right way of doing
> things.  I appreciate any corrections.)
> 
> $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
>            --dport 1025: -j SNAT --to-source $EXTIP
> 
> But the above rule 'looks' like it should work; but it
> doesn't.  tcpdumping the traffic, it seems the traffic is
> going one way and not the other.
> 
> So if I want to set the firewall to allow the following
> situations: machine A in $LAN_NET  wants to RDP to an external
> site,  it can.  If machine B wants to surf the net, it also
> can.  I don't need to separately do the following:
> 
>   $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
>            --dport 3389 -j ACCEPT
>   $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
>            --dport 80 -j ACCEPT
>   $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
>            --dport 443 -j ACCEPT

You need to allow the reply too, e.g. for tcp 443, you could add this
rule:
|   $IPT -A FORWARD -o $LANETH -i $EXTETH -p tcp -d $LAN_NET \
|            --sport 443 -m state --state ESTABLISHED -j ACCEPT


Doing it this way, you'd also need to allow, at least, ICMP RELATED
packets.


> 
>   $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
>           --dport 3389 -j SNAT --to-source $EXTIP
>   $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
>           --dport 80 -j SNAT --to-source $EXTIP
>   $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
>           --dport 443 -j SNAT --to-source $EXTIP
> 


Instead of doing it per "tcp connection", if you don't have special
needs, you could SNAT globally, allow the outbound traffic you want, and
allow every inbound ESTABLISHED and RELATED traffic. e.g.:

|   $IPT -t nat -A POSTROUTING -o $EXTETH -s $LAN_NET \
|           -j SNAT --to-source $EXTIP
|   $IPT -A FORWARD -o $LANETH -i $EXTETH -d $LAN_NET -m state \
|           --state ESTABLISHED,RELATED -j ACCEPT
|   $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -d $LAN_NET \
|           -m multiport --dports 80,443,3389 -j ACCEPT


This may or may not suit you though.



> 
> 
> Now if I remembered, I used MASQUERADE when I was using 
> a dynamic IP.  Now with a fixed IP, I shouldn't be using
> MASQUERADE (seems less of a headache) as the manual says 
> it's more appropriate to use SNAT for fixed IP.
> 
> Any help/clarifications/hints appreciated.
> 
> Ed
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
