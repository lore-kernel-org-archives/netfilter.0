From: Sylvain BERTRAND <jowy@2001-space-odyssey.net>
Subject: Re: M$ Messenger 6 behind a linux router/firewall
Date: Wed, 10 Sep 2003 21:37:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5F7D75.6050406@2001-space-odyssey.net>
References: <3F5E5D08.5040704@2001-space-odyssey.net> <16758.193.173.35.183.1063181358.squirrel@www.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16758.193.173.35.183.1063181358.squirrel@www.sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: nf <netfilter@lists.netfilter.org>

Rob Sterenborg a =E9crit :

>Sylvain BERTRAND said:
> =20
>
>>Hi everyone,
>>
>>I'm the admin for 193.48.225.0/24 and I would like if it were possible
>>for my users to chat with Messenger 6 (got complaints already). I've
>>read a few M$ tech notes, and they suggest the use of Port Triggering or
>>UPnP firewall. AFAIK it would not be a good thing in security terms. Do
>>any of you know a solution to my problem?
>>   =20
>>
>
>So far MSN6/iptables works for me.
>Filetransfer (and the like) can be a problem. You could try to install a
>socks5 server and let MSN use it. Once NEC had a free one.. (I still have
>the old source somewhere if you can't find it.)
>But that won't solve the problem of webcams. Did you load the H323
>contrack-/nat-modules ?
>
>About UPnP, I found something at http://linux-igd.sourceforge.net. I think
>that might be what you're looking for.
>
>
>Gr,
>Rob
>
>
>
> =20
>
I've been looking around and I found both igd and upnp sourceforge=20
projects. However, many people (including netfilter devs if I recall=20
correctly) consider using UPnP as a main risk for security. I guess UPnP=20
makes it easier for users to make P=B2P software run in active mode, even=20
if my firewall (not running NAT) blocks incoming connections. How would=20
you rate the efficiency of UPnP? Don't you think it would allow trojans=20
and spywares to work a lot better than without?

Sylvain


