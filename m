From: "Glover George" <dime@gulfsales.com>
Subject: RE: msn voice chat
Date: Tue, 31 Dec 2002 14:01:18 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2b107$64c27c30$6c00a8c0@blue>
References: <A4136342-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A4136342-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
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

Yes and no.  Yes it does use that and a helper module might work, but
it's entirely too much (it uses a lot of things, not just SIP).  What it
does use however, is Universal Plug N Play.  And EVERY single feature of
Windows and MSN Messenger uses UPnP, except the phone call thing.
Voice/Video, Remote Assistance, File Transfer (MSN 5.0 and up) and
whiteboard, all the others work with a UPnP IGD.  I'm actually the
author, and started this trying to make a helper module, but this was
actually the more correct way to deal with it. 


-----Original Message-----
From: Roy Sigurd Karlsbakk [mailto:roy@karlsbakk.net] 
Sent: Tuesday, December 31, 2002 12:57 PM
To: Glover George
Cc: cuigl@ilion.bio.sunysb.edu; netfilter@lists.netfilter.org
Subject: Re: msn voice chat

As far as I'm concerned, MSN telephony, and voice chat, uses SIP, not 
h.323, and SIP also needs a helper module the same way as pptp, ftp, 
irc etc

roy

On Tuesday, December 31, 2002, at 07:34 PM, Glover George wrote:

> No you need this,
>
> http://linux-igd.sourceforge.net.  Be aware however that if you're
> intention is completely security, then you should be warned by the
> SECURITY documentation.
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Guanglei Cui
> Sent: Thursday, December 26, 2002 11:48 AM
> To: netfilter@lists.netfilter.org
> Subject: msn voice chat
>
> Dear all,
>     I've set up IP NAT in my redhat 8.0 (kernel-2.4.18.19.8.0,
> iptables-1.2.6a-a). The following modules are loaded,
> ip_nat_irc
> ip_nat_ftp
> iptable_nat
> ip_conntrack_irc
> ip_conntrack_ftp
> ip_conntrack
> ip_tables
>
> It seems almost everything works just fine in my local network, except
> MSN
> voice chat (instant message works fine). Do I need other modules to 
> make
> it
> work, something like ip_nat_h323? Thanks in advance.
>
> cuigl
>
>
>




