From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: Re: NAT
Date: Tue, 3 Jul 2007 09:55:53 +0200
Message-ID: <e208f5d10707030055u69eef541qfe52bb0c3add3332@mail.gmail.com>
References: <e208f5d10707022352j39395f6awc172a563a8b0d4@mail.gmail.com>
	<4689FA46.2030307@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=OUlB1ErKrEMbx/9AUzCe0fCF8FYpHIjWIGrowHNnnrjwXc83KBm1yXMQ4iPrtkdOwYJOKqy9t9i82qeFewWrsoSRTTETH8MAEWLOWQRMeZPhCNT9gaIfK07loXzsOq+h+0cOoKC7OL7hxmDyGj1+yQQQNBNEcB7PH1vRYXzjP/o=
In-Reply-To: <4689FA46.2030307@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 7/3/07, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 7/3/2007 1:52 AM, Martin Schi=F8tz wrote:
> > I'm going to setup a bridged NAT linux box for many users. I want one
> > outside IP address to serve for instance 10.0.0.0/22.
>
> Why do this with bridging?  If you have a 10.0.0.0/22 network like you
> say, it is private and thus not globally routable.  So, to reach the
> internet you will have to NAT to a globally routable IP.  Thus you have
> a private subnet and a public subnet which is an ideal environment for a
> layer 3 router.  Even if you are not going to a public IP but rather
> another private IP, the same scenario holds true.
>
> Or are you for some wanting wanting to perform a layer 3 function on
> layer 2?  If so, can I ask why?

Ok, I think your right here.

>
> > I want to be sure that each local IP address always has 1024 NAT
> > sessions available and that sessions is kept even if the timeout is
> > reached. If 1024 sessions is reached and a new session is being
> > established then it will take over the oldest (timed out) session.
>
> I'm not sure that you will be able to specify how many NAT sessions each
> system will have and / or how to control the expiration there of.  I do
> know that you will have (or did have to in previous kernels) to have a
> fair amount of RAM for the connection tracking table to not wrap on a
> network of that size.
>
> > Is this possible with iptables?
>
> The first part of what you want to do (layer 2 or layer 3) NATing, yes.
>
> As far as controlling how many sessions are reserved / maintained even
> beyond timeouts, I don't know.  I'm betting not, especially to the latter=
.
>

I guess the question was more about controlling the number of NAT
sessions pr. lokal IP address?

- Marftin

