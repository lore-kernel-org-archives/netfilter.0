From: "Amit Kumar Gupta" <amitkumar.gupta@wipro.com>
Subject: Re: Reg iptables Connection tracking
Date: Fri, 10 Jan 2003 16:04:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4223A04BF7D1B941A25246ADD0462FF56477FD@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-46a8770a-7ccb-47d3-a23d-ff860739350d"
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
To: netfilter@lists.netfilter.org


This is a multi-part message in MIME format.

------=_NextPartTM-000-46a8770a-7ccb-47d3-a23d-ff860739350d
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable



On Friday 10 January 2003 12:37 am, you wrote:
> Hi,
>
> Well, Only 2 machines are attached in the inhome network and the
> fireall I am using is written using iptables rule. Well, the
> interesting point is :- There is no
> /proc/sys/net/ipv4/ip_conntrack_max file . What I mean is the max
> length it takes from this file and this file doesn't exist as I am not
> using /proc file system. (This mean that in the kernel CONFIG_SYSCTL
> option is not set).
>
> Well I am able to see upto this point. I went through the code flow
> also. But I don't know why it prints the message(Even if increasing
> the value from 1016 to 4096 by hardcoding it in the kernel). Another
> issue is I don't know how it is taking 1016. As There is no /proc file
> system, and by default it shoud take 0.

Hmmm. I suspect it is taking a 1024 default then, the actual number of=20
entries usually seems to be (2^n)-8.  The following probably explains=20
/where/ the value is coming from:

int __init ip_conntrack_init(void)
{
	unsigned int i;
	int ret;

	/* Idea from tcp.c: use 1/16384 of memory.  On i386: 32MB
	 * machine has 256 buckets.  >=3D 1GB machines have 8192 buckets.
*/
 	if (hashsize) {
 		ip_conntrack_htable_size =3D hashsize;
 	} else {
		ip_conntrack_htable_size
			=3D (((num_physpages << PAGE_SHIFT) / 16384)
			   / sizeof(struct list_head));


Not that this helps much.  The real problem is WHAT is the conntrack=20
table filling with.  And I suspect it may be nothing, that you have a=20
problem because it is trying to use /proc/net/conntrack and there IS no=20
/proc/net/conntrack.  The message may be triggering incorrectly,=20
presuming that since it cannot write another entry to=20
/proc/net/conntrack that the table is full.

The fact that you only have two machines pretty much eliminates traffic=20
as a source of legitimately filling it... :^) =20

I'm out of ideas for the moment, other than the above, that it will need

/proc in order to work.  If I think of something else I'll email you=20
again.  Sorry.

j


------=_NextPartTM-000-46a8770a-7ccb-47d3-a23d-ff860739350d
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

------=_NextPartTM-000-46a8770a-7ccb-47d3-a23d-ff860739350d--

