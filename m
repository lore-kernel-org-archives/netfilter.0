From: pieter claassen <pieter@openauth.co.uk>
Subject: Re: Bridge with iptables
Date: 03 Apr 2003 16:56:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049385404.4404.1.camel@pc-dt>
References: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
Reply-To: pieter@openauth.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>
Cc: netfilter@lists.samba.org

You can have a look at http://ebtables.sourceforge.net/ for the patches
for the 2.4.x kernels.

Pieter
On Thu, 2003-04-03 at 15:44, hare ram wrote:
> Hi
> 
> iam trying to setup a bridge with iptable
> i have setup the transparent bridge,
> 
> and iam try to mark the http packets for QOS
> iam not able to see the packets
> 
> i was going through the Lartc.org
> some where i read at this stage ( kernel 2.4.18-27 Redhat iam using) bridge
> will not support iptables.
> it will support only on kernel 2.5, is this true
> 
> if false, where can i get the right documentation which help me to setup
> bridge with packet filtering
> 
> thanks in advance for the help
> 
> hare
> 
> 
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


