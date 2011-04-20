From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Wed, 20 Apr 2011 20:41:34 +0100
Message-ID: <1303328494.4938.289.camel@andybev-desktop>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
	 <1302544375.1551.11.camel@andybev>
	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
	 <1302626146.4938.1.camel@andybev-desktop>
	 <054F5B1BB94BD943B243C3B39B4F568D0161B8F7@victory.Erudine.local>
	 <1302636161.4938.5.camel@andybev-desktop>  <4DA4C61A.4070308@erudine.com>
	 <1302812689.4938.46.camel@andybev-desktop>
	 <1302873712.2984.17.camel@HP-019.Erudine.local>
	 <1302881372.4938.62.camel@andybev-desktop>
	 <1303301989.14640.3.camel@HP-019.Erudine.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1303328494; bh=7Fd17J4Z29xr1vfPR7xg+wtFVv4EtuWjWem8r
	Y8eYZE=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=peXalOuI
	bE6xOAaQDtO8xxf+Nn05+tpXATI1WJzKIIEScVlkSYw29oZpa2Vtk//psWO3SOi5fiU
	AVGhKWk0BprhAYUOtxni5YA+Am0Q/xmVQVJw47XKib3p/kYYrpxFdnLJXrQocIu0QCV
	ThX50anKvLsCMVE23xOyYj4+9gu+4=
In-Reply-To: <1303301989.14640.3.camel@HP-019.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Rogers <tony.rogers@erudine.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-04-20 at 13:19 +0100, Tony Rogers wrote:
> If I'm interpreting this correctly:
> 
> 212.118.226.91 is trying to connect to 192.168.0.168 ?
> 

Not really "trying to connect", it's just a packet of data, so it could
be the reply to a connection already initiated.

> Or is this some kind of reverse logic, and 192.168.0.168 is actually
>  connecting to 212.118.226.91 on port 80? If so, why would the log
>  entry be reversed?

I suspect that it is the *reply* packets. So your local client (.168)
opens a connection to port 80 on the remote server (.91) and then the
remote server sends a reply back which are the packets that you are
seeing below.

> However, there is no rule that permits inbound connections of this nature.
> 

Well if you don't allow *any* packets in, then you will only have a one
way connection, which is pretty useless...

Are you sure you don't have a rule to allow ESTABLISHED connections back
in?

> And (more worryingly) the connection appears to be sourced from eth0 (internal interface).
> 

I'd expect them to go OUT on the internal interface. Which chain are you
logging the packets in? If it's POSTROUTING, then I'd expect IN to be
blank - not sure why it is also eth0 - maybe your version of iptables.

> 
> Apr 20 11:21:52 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=115 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
> Apr 20 11:21:59 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=116 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
> Apr 20 11:22:04 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=117 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
> Apr 20 11:22:23 statler kernel: OUTPUT IN=eth0 OUT=eth0 SRC=212.118.226.91 DST=192.168.0.168 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=118 DF PROTO=TCP SPT=80 DPT=2011 WINDOW=0 RES=0x00 RST URGP=0
> 
> Does this make sense to any of you gurus out there?
> 

Well I'm not a guru... but yes it does make sense, except for both the
IN and OUT being the same.

Try logging in the PREROUTING and FORWARD chains as well, and you should
see the interfaces change.

Andy


