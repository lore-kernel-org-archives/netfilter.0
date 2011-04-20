From: Tony Rogers <tony.rogers@erudine.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Wed, 20 Apr 2011 13:19:49 +0100
Message-ID: <1303301989.14640.3.camel@HP-019.Erudine.local>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
	 <1302544375.1551.11.camel@andybev>
	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
	 <1302626146.4938.1.camel@andybev-desktop>
	 <054F5B1BB94BD943B243C3B39B4F568D0161B8F7@victory.Erudine.local>
	 <1302636161.4938.5.camel@andybev-desktop>  <4DA4C61A.4070308@erudine.com>
	 <1302812689.4938.46.camel@andybev-desktop>
	 <1302873712.2984.17.camel@HP-019.Erudine.local>
	 <1302881372.4938.62.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302881372.4938.62.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-04-15 at 16:29 +0100, Andrew Beverley wrote:
> > > Anyway, back to the original subject, can you post the output from
> > > "iptables-save" instead, as this has additional detail such as the
> > > interfaces in the rules.
> > > 
> > > As a thought before you do so, if you're doing NAT in the normal way to
> > > share an internet connection, then what you are seeing is to be
> > > expected. You would normally SNAT on the internet-facing interface, not
> > > on the LAN-facing interface, meaning that traffic on the LAN interface
> > > will be going from/to public IP addresses.
> > 
> > Output of "iptables-save" below.
> > 
> > *however*
> > 
> > I *think* I may have solved it - I will know when I see the logs tomorrow morning.
> > 
> > I changed my MASQ entry from MASQUERADE any to only MASQ my internal
> >  IP. (see last but two lines)
> > 
> 
> Ah, that would make sense.
> 
> > Also - unless I misunderstand the rules - my SNAT is applied to the external interface?
> > 
> 
> <snip>
> 
> > *nat
> > -A POSTROUTING -s 192.168.0.0/255.255.255.0 -m mark --mark 0x1 -j SNAT --to-source 192.168.0.1 
> 
> Probably, yes, if all the clients on the internal network match the
> address range above, but if that's what you want then use -o $EXT_IF.
> 
> Out of interest, why would you want to SNAT a public facing interface to
> a private IP address?
> 
> > -A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth1 -j MASQUERADE 
> 
> Are you sure you want MASQUERADE? If you're using a static IP address
> then you should use SNAT instead (see the man page). You can probably
> drop the "-s 192.168.0.0/255.255.255.0" as well.
> 
> Andy
> 
> 
> 
> ------------------------
> This email was scanned by BitDefender.

Ok so I've re-checked all my rules, and tweaked them to use SNAT.

Below is an example of the 'raw' log entry.

If I'm interpreting this correctly:

212.118.226.91 is trying to connect to 192.168.0.168 ?

Or is this some kind of reverse logic, and 192.168.0.168 is actually connecting to 212.118.226.91 on port 80? If so, why would the log entry be reversed?

However, there is no rule that permits inbound connections of this nature.

And (more worryingly) the connection appears to be sourced from eth0 (internal interface).


Apr 20 11:21:52 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=115 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
Apr 20 11:21:59 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=116 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
Apr 20 11:22:04 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=117 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
Apr 20 11:22:23 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=118 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0

Does this make sense to any of you gurus out there?

Thanks.


