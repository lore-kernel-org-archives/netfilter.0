From: Scott van Looy <scott@ethosuk.org.uk>
Subject: Re: h323
Date: Fri, 15 Aug 2003 15:36:14 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308151530220.28720@novak.ethosuk.org.uk>
References: <FDEMKKNJDLAJDPNDPCDDOEEJNFAA.georgev@citadelcomputer.com.au>
 <004b01c36332$04c83490$8c01a8c0@RSUNDARAM>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004b01c36332$04c83490$8c01a8c0@RSUNDARAM>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: netfilter@lists.netfilter.org


You'll need to be happy building your own custom redhat kernel -

install from source patch-o-matic, adding the h323 patch
recompile kernel, then boot into kernel
install from source iptables

then make sure your modules are loaded
/sbin/modprobe -k ip_nat_h323
/sbin/modprobe -k ip_conntrack_h323

open ports 1503 and 1720 (389 and 522 if you want to use ils)

and it should just work!

Today Sundaram Ramasamy did spake thusly:

> Can you post your iptables rules for this?
>   ----- Original Message -----
>   From: George Vieira
>   To: dalive@flashmail.com ; netfilter@lists.netfilter.org
>   Cc: Morrison, Trevor (Trevor)
>   Sent: Tuesday, August 12, 2003 6:48 AM
>   Subject: RE: h323
>
>
>   Just use the H323 patch in p-o-m... I use it and it works fine for me..
>   I don't know what this gatekeeper is.. but it's not needed if you can successfully patch in the pom module.
>
>   -----Original Message-----
>   From: netfilter-admin@lists.netfilter.org [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of DALive Editor
>   Sent: Tuesday, August 12, 2003 6:47 AM
>   To: netfilter@lists.netfilter.org
>   Cc: Morrison, Trevor (Trevor)
>   Subject: Re: h323
>
>
>   Hello to this mailinglist,
>
>   I'd also really like an awnser to the question bellow about H323, you have no idea how long I've toiled unsuccessfully. What is this about a patch? And I've read a little about the gatekeeper, could someone cluse me in further?
>
>   Thanks alot - I'd given up hope
>
>
>   Morrison, Trevor (Trevor) wrote:
>
>     Hi,
>
>     I have a RH 9.0 box running iptables-1.2.8 and a 2.4.20 kernel with the h323 patch applied and recompiled.  My network looks like this:
>
>                                         dhcp from ISP
>     Win 2000 box <--------------------------->RH 9.0 Box<---------------------->Internet
>     192.168.1.0/24                          NAT       12.207.X.X/32
>
>
>
>     I have searched the archives back to September of last year trying to find what rules I need to apply to my iptables to allow h323 traffic through my NAT'd box.  I am now more confused then before because the threads mentioned something about a gatekeeper that I need to run on a NAT box?
>
>     What I am looking for is what are the rules that I need to put into my filter file and what other programs or procedures do I need to add to that I have the full features and functionality of Microsoft's Net Meeting from my Win 2k box.
>
>     Thanks in Advance and sorry for bring this subject up again but I could not find the information in the previous threads.
>
>     Trevor Morrison
>

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

"Irrigation of the land with sewater desalinated by fusion power is ancient.
It's called 'rain'."
-- Michael McClary, in alt.fusion

