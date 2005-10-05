From: "Winanjaya - PBXSoftwares" <winanjaya@pbxsoftwares.com>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 13:44:54 +0700
Message-ID: <00e401c5c978$4ba35120$580110ac@HO.lippogeneral.com>
References: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com><200510050029.36699.rob0@gmx.co.uk><00cb01c5c970$b6eb9620$580110ac@HO.lippogeneral.com>
	<200510050123.52028.rob0@gmx.co.uk>
Reply-To: Winanjaya - PBXSoftwares <winanjaya@pbxsoftwares.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org


----- Original Message -----
From: "/dev/rob0" <rob0@gmx.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, October 05, 2005 1:23 PM
Subject: Re: IP and MAC Address check


> On Wednesday 2005-October-05 00:50, Winanjaya - PBXSoftwares wrote:
> > > My only comment is that some older systems might not have -m
> > > iprange. But no worries, it's not far outside 2 CIDR ranges:
> > > 172.16.2.240/29 and 172.16.2.248/30.
> > >
> > > Ah, one other comment: this might be better structured using a
> > > user-defined chain.
>
> (Hold that thought ...)
>
> > so you meant I can use  below:
> >
> > # Range 241 to 246
>
> 172.16.2.240/29 is actually 240 through 247.
>
> >  -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
> > 00:12:95:6d:0a:3e -j DROP
> > -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
> > 00:12:95:15:61:14 -j DROP
> > -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
> > 00:12:95:15:62:29 -j DROP
> > -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
> > 00:12:95:15:63:ba -j DROP
>
> RH-Lokkit-0-50? Yuck!!
>
> Okay, trying to regain composure ... :)
>
> Think about this. Look at the first rule:
> >  -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
> > 00:12:95:6d:0a:3e -j DROP
>
> If the source IP is in 172.16.2.240/29 and the MAC address is *not*
> 00:12:95:6d:0a:3e, drop the packet. Your second and subsequent MAC
> rules will never be used, because those packets are already dropped.
>
> That's why I'd use another chain for this. Put an ACCEPT rule in the
> calling chain after the jump to your new chain. Use -j RETURN rules for
> your permitted MAC addresses, and a -j DROP rule at the end of your new
> chain.
>
> I hope you do understand about MAC filtering: it only works when your
> packets originated on the same physical segment. Anything from outside
> your physical segment will come to you with the MAC address of your
> upstream router.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>
I am really sorry that I am not sure that I already understood what you mean
exactly.. could you please give me a simple example for this? .. thanks a
lot in advance

Regards
Winanjaya


