From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Is it possible to do bonding/connection teaming with non-ethernet devices?
Date: Wed, 21 Nov 2007 17:14:06 +0200
Message-ID: <op.t15dxsbprtqp7s@hagumi.home>
References: <4744413F.1000700@aitel.hist.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4744413F.1000700@aitel.hist.no>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Helge Hafting <helge.hafting@aitel.hist.no>, netfilter@vger.kernel.org

You can this decently by using iproute2's nexthop. Of course, one client  
isn't able to use more than one ISP per connection and their IP will keep  
changing depending on which route they happend to get.

Anyway, to the point.  
http://wiki.robotz.com/index.php/Iproute2#General_Notes_and_Information
On Wed, 21 Nov 2007 16:31:27 +0200, Helge Hafting  
<helge.hafting@aitel.hist.no> wrote:

> I am trying to set up a mobile router using linux. It connects to  
> several ISPs
> using 3G connections, and offers a NATed wireless network for clients.
>
> I wish to utilize the bandwith when all ISPs are available, and
> be able to provide internet access for all as long as at least one
> ISP is available.
>
> I have looked at bonding and "ifenslave". But I can't use this
> because some of the 3G devices provides ppp links like
> ppp0, ppp1, ... and bonding seems to want physical ethernet devices only.
> Windows was able to do this - but the os turned out to be too unstable.
>
> Is there some other approach that might work?
>
> Helge Hafting
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
