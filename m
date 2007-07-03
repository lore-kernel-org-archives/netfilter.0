From: Robert LeBlanc <robert@leblancnet.us>
Subject: Re: NAT
Date: Tue, 03 Jul 2007 08:29:46 -0600
Message-ID: <C2AFB97A.1D36E%robert@leblancnet.us>
References: <e208f5d10707030055u69eef541qfe52bb0c3add3332@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e208f5d10707030055u69eef541qfe52bb0c3add3332@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Martin Schi=?ISO-8859-1?B?+A==?=tz <malinux@gmail.com>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>




On 7/3/07 1:55 AM, "Martin Schi=F8tz" <malinux@gmail.com> wrote:

> On 7/3/07, Grant Taylor <gtaylor@riverviewtech.net> wrote:
>> On 7/3/2007 1:52 AM, Martin Schi=F8tz wrote:
>>> I'm going to setup a bridged NAT linux box for many users. I want one
>>> outside IP address to serve for instance 10.0.0.0/22.
>>=20
>> Why do this with bridging?  If you have a 10.0.0.0/22 network like you
>> say, it is private and thus not globally routable.  So, to reach the
>> internet you will have to NAT to a globally routable IP.  Thus you have
>> a private subnet and a public subnet which is an ideal environment for a
>> layer 3 router.  Even if you are not going to a public IP but rather
>> another private IP, the same scenario holds true.
>>=20
>> Or are you for some wanting wanting to perform a layer 3 function on
>> layer 2?  If so, can I ask why?
>=20
> Ok, I think your right here.
>=20
>>=20
>>> I want to be sure that each local IP address always has 1024 NAT
>>> sessions available and that sessions is kept even if the timeout is
>>> reached. If 1024 sessions is reached and a new session is being
>>> established then it will take over the oldest (timed out) session.
>>=20
>> I'm not sure that you will be able to specify how many NAT sessions each
>> system will have and / or how to control the expiration there of.  I do
>> know that you will have (or did have to in previous kernels) to have a
>> fair amount of RAM for the connection tracking table to not wrap on a
>> network of that size.
>>=20
>>> Is this possible with iptables?
>>=20
>> The first part of what you want to do (layer 2 or layer 3) NATing, yes.
>>=20
>> As far as controlling how many sessions are reserved / maintained even
>> beyond timeouts, I don't know.  I'm betting not, especially to the latte=
r.
>>=20
>=20
> I guess the question was more about controlling the number of NAT
> sessions pr. lokal IP address?

If you give iptables a range, it will try to do as little port mangeling as
possible, so I beilieve it will try to hold onto connections as long as
possible. We saw quite a performance when we moved our 100 users from one
Natted address to 64. I guess the mangeling made that much of a difference.
=20
Robert LeBlanc
BioAg Computer Support
Brigham Young University
leblanc@byu.edu
(801)422-1882



