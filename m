From: Doug Yeager <doug@aircomwireless.net>
Subject: Re: denying local traffic  --SOLUTION
Date: Wed, 12 Feb 2003 07:05:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.3.2.7.0.20030212070212.02ee7d60@yeagerautomation.com>
References: <000701c2d226$24f56f50$bb00a8c0@DOUG1>
 <20030211222604.12c74c82.arnt@c2i.net>
 <000701c2d226$24f56f50$bb00a8c0@DOUG1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030212031133.6cef010e.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

i'm an idiot.  found out that wi-fi acts on layer 3 and netfilter code 
can't do much about it.
it act as a "hub" just like arnt has pointed out.  so the hostap guys said 
there is a configuration for this if you are using the hostap code to run 
the access point.  it is pretty handy code for a situation like this. here 
was the solution:


 > is there a way to not allow this using hostap? any settings at compile
 > time to only allow traffic from client to AP? but not client to client
 > through ap?
Yes, you can disable this internal driver bridge code by setting
ap_bridge_packets to 0: 'prism2_param wlan0 ap_bridge_packets 0'.
This does not require any compile time configuration.





At 03:11 AM 02/12/2003 +0100, Arnt Karlsen wrote:
>On Tue, 11 Feb 2003 18:34:32 -0500,
>"Doug Yeager" <doug@aircomwireless.net> top posted, err,
>top mailed in message <000701c2d226$24f56f50$bb00a8c0@DOUG1>:
> >
> > Arnt,
> > Thank you very much.
> > I think I understand what you are saying.  Just wanted to clear a few
> > things up:
> >
> > This is the case:
> > >..if people bring their own boxes
> >
> > >plug_ all wintendo ports, 137 tru 139.  _Plug_ goes anywhere
> > >between the humanistic "reject" thru "drop" to less so "mirror",
> > "same",
> > >and "tarpit".
> >
> > What are the wintendo ports?  What purpose do they serve on windows
> > machines?  I'm hoping you are referring to the ports that show the
> > shared folders and such, so that I can prevent open file sharing by
> > blocking them.  That is really what I want.
>
>..yup. 137 thru 139, there may be more, I don't know wintendo
>that well, I dropped wintendo95 in 1997, 23 reinstall in my last
>5 weeks... I took the hint.  ;-)
>
>..the wise way is block _everything_ below 1024, and then
>pop open _only_ the ports you need.
>
> > If hostap acts like a hub, how can I manage any of these ports w/
> > iptables?
>
>..you can't, ip address or not, _all_ antennas hears the same packets.
>You're left with vpn tunnels, ok, you _can_ use WEP etc too, it might
>not hurt to much, overheadwise.  Ok, iptables _can_ help deny and award
>a wifi card ip traffic access, and iptables can match on mac addresses.
>
>..in patch-o-matic, a few more modules can be thrown in to help
>troubleshoot your coffeeshop site, conn'track'ers etc.
>
>..once you're done, anonymize ip's where needed and post your solution
>on the list, there are more people around who needs this knowledge.
>
> > Something like this does not work unless I'm trying to do it wrong:
> > Is this because of the HUB issue?
> >
> > iptables -A INPUT -d 192.168.19.1 -i wlan0 -j ACCEPT #allow packets to
> > AP
> > iptables -A INPUT -d 192.168.19.0/255.255.255.0 -i wlan0 -j DENY
> > #deny
> > lan
> >
> > of course, it would be a similar command for the port blocking right?
> >
> > thx again,
> > doug
> >
>
>
>--
>..med vennlig hilsen = with Kind Regards from Arnt... ;-)
>...with a number of polar bear hunters in his ancestry...
>   Scenarios always come in sets of three:
>   best case, worst case, and just in case.


