From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: block Kazaa download
Date: Tue, 4 Jun 2002 07:50:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040750.48242.raymondl@knowledgefactory.co.za>
References: <000301c20b79$c12c00b0$0200a8c0@JEFF>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000301c20b79$c12c00b0$0200a8c0@JEFF>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: LunarFox <lunar@comcast.net>, 'netfilter' <netfilter@lists.samba.org>

><snip>
 > anybody has a sample how to block Kazaa download?
>
> KaZaA appears to listen on port 1214.  So if you block that port
> *inbound* to your machine, in theory no one should be able to =
download
> FROM you.  Of course, you can also just tell the program not to share
> files.
>
> If you block *outbound* connections to 1214, your users should be not
> able to download from anyone ELSE.  At least, that's my limited
> understanding of it, I could be completely wrong.  ;)
>
> Shouldn't hurt to try one of these rules, depending on which way =
you're
> trying to block:
>
> $IPT -A INPUT -p tcp --dport 1214 -j DROP   # Avoid people =
downloading
> from you, and/or
> $IPT -A OUTPUT -p tcp --dport 1214 -j DROP  # Block your users from
> downloading via KaZaA
>
> I use the first rule above, because I was sick and tired of seeing
> logged packets being dropped when I wasn't even running the client.
>
> The usual caveat:  people are often able to get around fixed port
> assignments and your blocking of same.  I don't know if the main =
KaZaA
> client can do this, but I suspect it wouldn't be too hard to hack it
> (consider what's been done with KaZaA Lite).
>
I think the latest kazaa can use http proxies too, so you'll need to =
block=20
that too (with squidGuard or something similar).
> HTH,
>
> Jeff Bonner

--=20
----------------------------------------

Ray Leach (Technical Network Specialist)

Knowledge Factory

www: http://www.knowledgefactory.co.za

Tel: +27-11-445-8100 Direct: 445-8263

Fax: +27-11-445-8101

"No matter where you go, there you are."

----------------------------------------

