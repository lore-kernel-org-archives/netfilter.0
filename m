From: Data Shock <datashock@hotmail.com>
Subject: RE: iptables - Trying to understand "no longer support implicit
 source local NAT"
Date: Thu, 19 Mar 2009 17:06:48 -0400
Message-ID: <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
 <49C2A535.1040700@kis.keele.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49C2A535.1040700@kis.keele.ac.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Thank you for the reply Jon.  I didn't expect any replies so soon.  :)


> Is it that it can't send to 127.0.0.1 or is it the loopback interface
> that's the problem?


Well, actually, the Sender program refuses to send to "itself", so it w=
on't use any address on the device.  I appologize, I should have been m=
ore specific about that.


I really would LOVE to get an answer to the actual iptables issue.  The=
re seems to be no real information on this, so I'm hoping that this thr=
ead will lead to some conclusive information.

=46or the sake of this thread, lets assume that iptables is the only so=
lution.  Assuming that, and given my iptables configuration, what is th=
e reason for the error message? And how can I correct it?

Many thanks,

=46rank

_________________________________________________________________
Express your personality in color! Preview and select themes for Hotmai=
l=AE.=20
http://www.windowslive-hotmail.com/LearnMore/personalize.aspx?ocid=3DTX=
T_MSGTX_WL_HM_express_032009#colortheme