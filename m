From: Steve Cherry <steve.cherry@brandid.co.uk>
Subject: Re: iptables PPTP p-o-m patch info
Date: Tue, 25 Mar 2003 09:38:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E80238A.5000606@brandid.co.uk>
References: <000001c2f24e$4508ca10$6d64a8c0@discmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------050104070906030900020209"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Aldo Lagana <alagana@discmail.com>
Cc: 'James O'Gorman' <james@netinertia.co.uk>, netfilter@lists.netfilter.org


--------------050104070906030900020209
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I've had problems with checkpoint & PPTP before. Basically I found out 
that checkpoint cannot forward PPTP then GRE packets to internal IP's 
for some reason. I ended up setting up the PPTP server on the checkpoint 
firewall itself.

This lack of support for PPTP was actually documented on the checkpoint site

Aldo Lagana wrote:

>the pptp-conntrack patch from p-o-m works wonderfully for me - clients
>on private addresses (192.168.x.x for me) can use their windows (ew!)
>VPN connections they've setup to connect (just as NAT clients through my
>iptables & patched gateway) to PPTP servers out on the Internet.  So
>yes, they are getting NATted, but the PPTP sessions still work - that is
>the whole reason for the patch!
>
>If this is what you need, then that is the patch that will work for you.
>The problem I see is the Checkpoint VPN - is that a 100% PPTP VPN
>server?  Because the pptp patch will not work for IPSec or other
>non-PPTP VPNs.
>
>
>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org 
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
>>James O'Gorman
>>Sent: Monday, March 24, 2003 3:24 PM
>>To: netfilter@lists.netfilter.org
>>Subject: iptables PPTP p-o-m patch info
>>
>>
>>Hi,
>>
>>I'm after a bit more info on this patch, as there doesn't 
>>seem to be much mentioned about it on the netfilter.org site, 
>>or in the p-o-m help. I've got an ADSL connection with a 
>>single static IP, and we're thinking about having a linux box 
>>using iptables to NAT the connection to the internal LAN.
>>
>>One of the computers on the LAN uses Check Point VPN-1 
>>SecuRemote to connect to a corporate network, but with our 
>>current setup (using a ZyXEL Prestige ADSL router) this isn't 
>>possible - the user has to unplug the router and use the USB 
>>ADSL modem plugged directly into his PC, meaning the rest of 
>>the network loses the Internet connection, which, obviously 
>>is inconvenient. We think this fails to work because of the 
>>router re-writing the packet headers, and the VPN software 
>>not liking this (it's a security risk).
>>
>>Does the PPTP patch for iptables allow this to work properly? 
>>ie, if 192.168.0.1 was the internet gateway (ppp0 for 
>>Internet and eth0 for
>>LAN) and 192.168.0.4 needed to use VPN using 0.1 as the 
>>gateway instead of unplugging the gateway from the ADSL, 
>>would this work, or would it fail, for the same reasons it 
>>failed using the ZyXEL router?
>>
>>Thanks,
>>
>>James
>>
>>-- 
>>James O'Gorman
>>email: james@netinertia.co.uk | web: www.netinertia.co.uk
>>What is food to one, is to others bitter poison.
>>		-- Titus Lucretius Carus
>>
>
>


--------------050104070906030900020209
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<html>
<head>
</head>
<body>
I've had problems with checkpoint &amp; PPTP before. Basically I found out
that checkpoint cannot forward PPTP then GRE packets to internal IP's for
some reason. I ended up setting up the PPTP server on the checkpoint firewall
itself.<br>
<br>
This lack of support for PPTP was actually documented on the checkpoint site<br>
<br>
Aldo Lagana wrote:<br>
<blockquote type="cite" cite="mid:000001c2f24e$4508ca10$6d64a8c0@discmail.com">
  <pre wrap="">the pptp-conntrack patch from p-o-m works wonderfully for me - clients<br>on private addresses (192.168.x.x for me) can use their windows (ew!)<br>VPN connections they've setup to connect (just as NAT clients through my<br>iptables &amp; patched gateway) to PPTP servers out on the Internet.  So<br>yes, they are getting NATted, but the PPTP sessions still work - that is<br>the whole reason for the patch!<br><br>If this is what you need, then that is the patch that will work for you.<br>The problem I see is the Checkpoint VPN - is that a 100% PPTP VPN<br>server?  Because the pptp patch will not work for IPSec or other<br>non-PPTP VPNs.<br><br><br></pre>
  <blockquote type="cite">
    <pre wrap="">-----Original Message-----<br>From: <a class="moz-txt-link-abbreviated" href="mailto:netfilter-admin@lists.netfilter.org">netfilter-admin@lists.netfilter.org</a> <br>[<a class="moz-txt-link-freetext" href="mailto:netfilter-admin@lists.netfilter.org">mailto:netfilter-admin@lists.netfilter.org</a>] On Behalf Of <br>James O'Gorman<br>Sent: Monday, March 24, 2003 3:24 PM<br>To: <a class="moz-txt-link-abbreviated" href="mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</a><br>Subject: iptables PPTP p-o-m patch info<br><br><br>Hi,<br><br>I'm after a bit more info on this patch, as there doesn't <br>seem to be much mentioned about it on the netfilter.org site, <br>or in the p-o-m help. I've got an ADSL connection with a <br>single static IP, and we're thinking about having a linux box <br>using iptables to NAT the connection to the internal LAN.<br><br>One of the computers on the LAN uses Check Point VPN-1 <br>SecuRemote to connect to a corporate n
 
etwork, but with our <br>current setup (using a ZyXEL Prestige ADSL router) this isn't <br>possible - the user has to unplug the router and use the USB <br>ADSL modem plugged directly into his PC, meaning the rest of <br>the network loses the Internet connection, which, obviously <br>is inconvenient. We think this fails to work because of the <br>router re-writing the packet headers, and the VPN software <br>not liking this (it's a security risk).<br><br>Does the PPTP patch for iptables allow this to work properly? <br>ie, if 192.168.0.1 was the internet gateway (ppp0 for <br>Internet and eth0 for<br>LAN) and 192.168.0.4 needed to use VPN using 0.1 as the <br>gateway instead of unplugging the gateway from the ADSL, <br>would this work, or would it fail, for the same reasons it <br>failed using the ZyXEL router?<br><br>Thanks,<br><br>James<br><br>-- <br>James O'Gorman<br>email: <a class="moz-txt-link-abbreviated" href="mailto:james@netinertia.co.uk">james@netinertia.co.uk</a> 
 
| web: <a class="moz-txt-link-abbreviated" href="http://www.netinertia.co.uk">www.netinertia.co.uk</a><br>What is food to one, is to others bitter poison.<br>		-- Titus Lucretius Carus<br><br></pre>
    </blockquote>
    <pre wrap=""><!----><br><br></pre>
    </blockquote>
    <br>
    </body>
    </html>

--------------050104070906030900020209--


