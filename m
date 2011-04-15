From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Fri, 15 Apr 2011 16:29:32 +0100
Message-ID: <1302881372.4938.62.camel@andybev-desktop>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
	 <1302544375.1551.11.camel@andybev>
	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
	 <1302626146.4938.1.camel@andybev-desktop>
	 <054F5B1BB94BD943B243C3B39B4F568D0161B8F7@victory.Erudine.local>
	 <1302636161.4938.5.camel@andybev-desktop>  <4DA4C61A.4070308@erudine.com>
	 <1302812689.4938.46.camel@andybev-desktop>
	 <1302873712.2984.17.camel@HP-019.Erudine.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302881372; bh=nC6r+OkHg6gY0tph12T2DAEbxHTOWyWXn4neO
	mglIRs=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=PbCuLOif
	HJRtLZLsUdNvO3gDtWxPpzvKHlrYlFocW+WE4PXzOv/MmnR94+jV+An5ZowNsmfzwZn
	0flfTFUOe1/nigaOvXOqHgZ+/PY8rkxZiJqwWtUUw7gCUY+yqnMDuk6ECAYkcL1xc2V
	7d+3AKP78N2fVnmQkWFa9/iwQW6Qs=
In-Reply-To: <1302873712.2984.17.camel@HP-019.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Rogers <tony.rogers@erudine.com>
Cc: netfilter@vger.kernel.org

> > Anyway, back to the original subject, can you post the output from
> > "iptables-save" instead, as this has additional detail such as the
> > interfaces in the rules.
> > 
> > As a thought before you do so, if you're doing NAT in the normal way to
> > share an internet connection, then what you are seeing is to be
> > expected. You would normally SNAT on the internet-facing interface, not
> > on the LAN-facing interface, meaning that traffic on the LAN interface
> > will be going from/to public IP addresses.
> 
> Output of "iptables-save" below.
> 
> *however*
> 
> I *think* I may have solved it - I will know when I see the logs tomorrow morning.
> 
> I changed my MASQ entry from MASQUERADE any to only MASQ my internal
>  IP. (see last but two lines)
> 

Ah, that would make sense.

> Also - unless I misunderstand the rules - my SNAT is applied to the external interface?
> 

<snip>

> *nat
> -A POSTROUTING -s 192.168.0.0/255.255.255.0 -m mark --mark 0x1 -j SNAT --to-source 192.168.0.1 

Probably, yes, if all the clients on the internal network match the
address range above, but if that's what you want then use -o $EXT_IF.

Out of interest, why would you want to SNAT a public facing interface to
a private IP address?

> -A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth1 -j MASQUERADE 

Are you sure you want MASQUERADE? If you're using a static IP address
then you should use SNAT instead (see the man page). You can probably
drop the "-s 192.168.0.0/255.255.255.0" as well.

Andy


