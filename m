From: "Amit Kumar Gupta" <amitkumar.gupta@wipro.com>
Subject: RE: Reg iptables Connection tracking
Date: Sat, 11 Jan 2003 10:36:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4223A04BF7D1B941A25246ADD0462FF564792B@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-44bd78d2-e4b7-4e10-aa71-f1bbed3b102e"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Athan <netfilter@miggy.org>
Cc: netfilter@lists.netfilter.org


This is a multi-part message in MIME format.

------=_NextPartTM-000-44bd78d2-e4b7-4e10-aa71-f1bbed3b102e
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using Embedix platform in which If I enable CONFIG_SYSCTL, the
image doesn't come up on the H/w. So I have to disable this.( There has
been some changes in the Kernel to suit this which works fine). Now in
conntrack module I don't have this option so my conntrack ctl_table will
not be registered woth ipv4 table. So I was hardcoding the value of
ip_conntrack_max? Whether it will help?

Another issue is I don't have enough memory on the board to have sysctl
command.

Can you suggest something which I can do?

Regards,
Amit


-----Original Message-----
From: Athan [mailto:netfilter@miggy.org]=20
Sent: Friday, January 10, 2003 10:09 PM
To: Amit Kumar Gupta
Cc: netfilter@lists.netfilter.org
Subject: Re: Reg iptables Connection tracking

On Fri, Jan 10, 2003 at 04:04:54PM +0530, Amit Kumar Gupta wrote:
> On Friday 10 January 2003 12:37 am, you wrote:
> > Well I am able to see upto this point. I went through the code flow
> > also. But I don't know why it prints the message(Even if increasing
> > the value from 1016 to 4096 by hardcoding it in the kernel). Another
> > issue is I don't know how it is taking 1016. As There is no /proc
file
> > system, and by default it shoud take 0.

   I missed this before, sorry.  Is this due to specifically disabling
/proc and/or specifically not mounting it for security reasons?  If not,
just enable it and mount it already.

> Not that this helps much.  The real problem is WHAT is the conntrack=20
> table filling with.  And I suspect it may be nothing, that you have a=20
> problem because it is trying to use /proc/net/conntrack and there IS
no=20
> /proc/net/conntrack.  The message may be triggering incorrectly,=20
> presuming that since it cannot write another entry to=20
> /proc/net/conntrack that the table is full.

   Er, no.  That's not what /proc/net/ip_conntrack is.  It doesn't EXIST
as such until you try to read from it.  All of /proc is virtual.  Just
because you have no /proc and can't get at 'files' in it doesn't mean
the SOURCE of their data doesn't exist.

> /proc in order to work.  If I think of something else I'll email you=20
> again.  Sorry.

   I'd certainly recommend having /proc around as well.  There's the
sysctl() interface for querying/changing some values too.  Aha! You can
set net/ipv4/ip_conntrack_max from this too *8-):

	sysctl -w net/ipv4/ip_conntrack_max=3D32768

If your kernel doesn't have the sysctl support then, er, you're kind of
shooting yourself in the foot for tuning things at ALL, including things
like turning IP forwarding on and off, global TCP ECN support, SYN
cookies etc....

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

------=_NextPartTM-000-44bd78d2-e4b7-4e10-aa71-f1bbed3b102e
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer**************************************************    
 
 Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
and 'confidential' and intended for use only by the individual or entity to which it is 
addressed. You are notified that any use, copying or dissemination of the information 
contained in the E-MAIL in any manner whatsoever is strictly prohibited.

****************************************************************************************

------=_NextPartTM-000-44bd78d2-e4b7-4e10-aa71-f1bbed3b102e--

