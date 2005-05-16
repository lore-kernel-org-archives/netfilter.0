From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: Mangling IP Options fields
Date: Mon, 16 May 2005 09:35:16 -0400
Message-ID: <876ef97a050516063532a0f24e@mail.gmail.com>
References: <42889068.4010307@hoole.biz> <002d01c55a30$2063f940$7b0e10ac@hegel>
	<42889D97.7000601@hoole.biz>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42889D97.7000601@hoole.biz>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Quinton Hoole <quinton@hoole.biz>
Cc: netfilter@lists.netfilter.org

On 5/16/05, Quinton Hoole <quinton@hoole.biz> wrote:
> I looked into the libipq user space queueing option, but unfortunately
> switching to user space is not feasble in my case (every single packet
> on a GBit ethernet needs to be stamped, and resource utilisation is a
> big issue).  Some further reading of the netfilter FAQ has revealed that
> patch-o-matic based extensions seem to be the way that others have
> achieved things similar to my aims.
>=20
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-=
4.html
>=20
> Can anyone confirm that I'm heading in the right direction?

You are headed in the right direction. I will say two more things:

1. What you are trying to do is very simple and shouldn't require much
deviation from iptables targets that already exist w/r/t coding
ability. Just make sure you know the pertinent RFCs and have a fast
machine to compile on.

2. You will need 2-3 CPUs (x86) to keep up with GBit forwarding + netfilter=
.

--=20
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

