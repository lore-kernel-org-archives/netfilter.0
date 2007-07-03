From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT
Date: Tue, 03 Jul 2007 02:27:02 -0500
Message-ID: <4689FA46.2030307@riverviewtech.net>
References: <e208f5d10707022352j39395f6awc172a563a8b0d4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e208f5d10707022352j39395f6awc172a563a8b0d4@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 7/3/2007 1:52 AM, Martin Schi=F8tz wrote:
> I'm going to setup a bridged NAT linux box for many users. I want one=20
> outside IP address to serve for instance 10.0.0.0/22.

Why do this with bridging?  If you have a 10.0.0.0/22 network like you=20
say, it is private and thus not globally routable.  So, to reach the=20
internet you will have to NAT to a globally routable IP.  Thus you have=20
a private subnet and a public subnet which is an ideal environment for a=20
layer 3 router.  Even if you are not going to a public IP but rather=20
another private IP, the same scenario holds true.

Or are you for some wanting wanting to perform a layer 3 function on=20
layer 2?  If so, can I ask why?

> I want to be sure that each local IP address always has 1024 NAT=20
> sessions available and that sessions is kept even if the timeout is=20
> reached. If 1024 sessions is reached and a new session is being=20
> established then it will take over the oldest (timed out) session.

I'm not sure that you will be able to specify how many NAT sessions each=20
system will have and / or how to control the expiration there of.  I do=20
know that you will have (or did have to in previous kernels) to have a=20
fair amount of RAM for the connection tracking table to not wrap on a=20
network of that size.

> Is this possible with iptables?

The first part of what you want to do (layer 2 or layer 3) NATing, yes.

As far as controlling how many sessions are reserved / maintained even=20
beyond timeouts, I don't know.  I'm betting not, especially to the latter.



Grant. . . .

