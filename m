From: pieter claassen <pieter@openauth.co.uk>
Subject: Ipqueue slows down network scan
Date: 28 Mar 2003 13:42:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048858974.925.12.camel@pc-dt>
Reply-To: pieter@openauth.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I am running ipqueue and snort-inline. However, I find that the moment
that I add
iptables -A FORWARD -j QUEUE

nmap scans slow down by an order of magnitude.

It is quite important for me to understand why this is happening. Any
help is appreciated.

Also, the firewall machine cpu and mem load is real low, so it certainly
doesn't see to be running out of capacity (10 Mb network)

Could a machine start dropping packets even though there is not
significant CPU or Mem load and where will it report dropped packets?

The kernel has the br-nf patches loaded and the firewall is in bridged
mode.

Thanks,
pieter
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


