From: pieter claassen <pieter@openauth.co.uk>
Subject: Re: RH 8.0 iptables nf-bridge  help please
Date: 09 Apr 2003 21:55:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049921707.30979.3.camel@pc-dt>
References: <F83sNfTjD4EXKduNqBQ000229cd@hotmail.com>
Reply-To: pieter@openauth.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F83sNfTjD4EXKduNqBQ000229cd@hotmail.com>
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
To: Allan Dover <bigaldover@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hello Allan,

I am not sure if I understand exactly what you are trying to do, but it
sounds like you want to run snort-inline on top of iptables to filter
connections that match the drop rules in snort inline?

Here are some pointers:
1. You need the snort-inline patch (www.honeynet.org) for snort to do
this.
2. It has not been ported to snort v2.0 (as far as I know)
3. You want to use the ipqueue target in iptables to push all your
traffic through snort-inline.

Hope this helps.
Pieter
On Wed, 2003-04-09 at 20:51, Allan Dover wrote:
> Hello Everyone,
> 
> I have searched through the archives and havent found an answer to my
> problem, o here it is.
> I am running RH 8.0 Kernel 2.4.19-8.5.27
> Used Netfilter patch bridge-nf-0.0.7-against-2.4.19.diff
> IPTABLES v1.2.6a
> followed the instructions line for line in Firewalling for free.
> Enabled 802.1b bridging and Netfilter options as well as IPTABLES firewall 
> in the kernel config.
> 
> The Bridge works great packets go throught it no problem.
> eth0 0.0.0.0 promisc
> eth1 0.0.0.0 promisc
> bridge 127.0.0.1 promisc up
> 
> I am running Snort 2 and I see the traffice going from host to internet and 
> Vice versa.
> 
> I have copied the IPTABLES Script from Firewalling for Free and added a few 
> extra lines to suit my DNS Servers and different Web Servers.
> 
> IPTables doesnt seem to be doing anything I can scan using NMAP from my HOME 
> PC. Iptables is Loaded at boot, and when i type iptable -L i see all my 
> rules and chains, just as they appear in the docs.
> 
> Anyone have any ideas How I can get the IPTables portion to stop hackers 
> from snooping around my network, I have also created rules that should stop 
> the Slammer virus from getting in and messing up any servers that users may 
> have forgotten to patch.
> 
> Any help on this is appreciated.
> 
> Thanx,
> Allan
> bigaldover@hotmail.com
> 
> 
> _________________________________________________________________
> Protect your PC - get McAfee.com VirusScan Online  
> http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
> 
-- 
-----------------------------
Pieter Claassen
pieter@openauth.co.uk
http://www.openauth.co.uk

OpenAuth
Tel: 01344 390530
DDI: 01344 390630/390631
Fax number: 01344 390700
Mobile:  0776 665 6924

Highview House
Charles Square
Bracknell
Berkshire
RG12 1DF

TERMS AND CONDITIONS
(i)The information contained in this email and attachments is only
intended for the addressed recipient(s) and may not be distributed or
viewed by any other party without the explicit consent of the sender. If
you have received this message by accident, please contact Pieter
Claassen (pieter@openauth.co.uk) and destroy any electronic or physical
copies of the information contained in it, immediately.
(ii)This email is not certified to be virus free and OpenAuth accepts no
liability for losses arising from you receiving this email.
(iii)Any digital signatures (if present) used to authenticate this
email, only serves to allow you to verify the originating email address
of the sender and should not be relied upon to prove identity or base
financial transactions on, unless the Certificate Practice Statement
that the signature references, explicitly states differently.
(iv)This email may be subjected to further terms and conditions as
published on the company website at http://www.openauth.co.uk. If you
need to rely on the information contained in this email in any way, then
you should read those terms and conditions to understand how much you
can trust the information in this email.
(v)OpenAuth retains the copyright on any relevant material that is
included in this email.


