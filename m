From: "Amit Kumar Gupta" <amitkumar.gupta@wipro.com>
Subject: RE: Reg iptables Connection tracking
Date: Fri, 10 Jan 2003 19:55:16 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4223A04BF7D1B941A25246ADD0462FF56478ED@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-a6e440da-041c-4cae-9806-0e82fcf6b34f"
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

------=_NextPartTM-000-a6e440da-041c-4cae-9806-0e82fcf6b34f
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi,

But As I have told previously, (in my previous mails), I don't have
/proc file system. So it is taking the default value of 1016.
Even I changed the kernel code also by hardcoding this value in
init_conntrack function to 4096 but it didn't has any effect.

Still it keeps dumping kernel messages.

Regards,
Amit

-----Original Message-----
From: Athan [mailto:netfilter@miggy.org]=20
Sent: Friday, January 10, 2003 7:33 PM
To: Amit Kumar Gupta
Cc: netfilter@lists.netfilter.org
Subject: Re: Reg iptables Connection tracking

On Fri, Jan 10, 2003 at 10:33:48AM +0530, Amit Kumar Gupta wrote:
> As soon as somebody pings to my m/c , that fellow doesn't get the
reply
> and on my m/c , kernel keeps dumping certain messages which are like
> this :-
>=20
> Ip_contrack: maximum limit of 1016 entries exceeded.

   echo 32760 > /proc/sys/net/ipv4/ip_conntrack_max

Works to increase the size of the table.  I had a problem with a default
of ~4092 for this when I was copying LOTS of files between machines
using "get -R directory" in ncftp.  The above cured it.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

------=_NextPartTM-000-a6e440da-041c-4cae-9806-0e82fcf6b34f
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer************************************************

Information contained in this E-MAIL being proprietary to Wipro Limited is 
'privileged' and 'confidential' and intended for use only by the individual
 or entity to which it is addressed. You are notified that any use, copying 
or dissemination of the information contained in the E-MAIL in any manner 
whatsoever is strictly prohibited.

***************************************************************************************

------=_NextPartTM-000-a6e440da-041c-4cae-9806-0e82fcf6b34f--

