From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: [ANNOUNCE] Release conntrack-tools 0.9.7
Date: Wed, 04 Jun 2008 02:18:00 +0200
Message-ID: <4845DF38.4020708@zensoluciones.com>
References: <48418100.2080305@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48418100.2080305@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi

I'm trying to rebuild  conntrack-tools packages under debian lenny.
I'm "git" newbie  ! when  I clone "libnetfilter_conntrack.git" it=20
download  the 0.0.30 version and I need 0.0.94 ...
How can I told git to checkout a specific "tag" ?  I've searched in=20
manual  but  I don't found what I need...

I hope that someone could light me ...
Regards


Pablo Neira Ayuso escribi=C3=B3:
> Hi!
>
> The netfilter project proudly presents another development release of
> the conntrack-tools. This release includes important improvements, ne=
w
> features and bugfixes:
>
> * add ICMPv6 support (Krzysztof Oledzki)
> * simplified conntrack update and deletion via command line
> * major improvements in the state synchronization code
> * add new best effort replication protocol
>
> Detailed changelog is attached.
>
> What are the conntrack-tools?
>
> - The userspace daemon so-called conntrackd that covers the specific
> aspects of stateful Linux firewalls to enable high availability
> solutions. It can be used as statistics collector of the firewall use=
 as
> well. The daemon is highly configurable and easily extensible.
>
> - The command line interface (CLI) conntrack that provides an interfa=
ce
> to add, delete and update flow entries, list current active flows in
> plain text/XML, current IPv4 NAT'ed flows, reset counters, and flush =
the
> complete connection tracking table among many other.
>
> Where can I download it from?
>
> http://www.netfilter.org/projects/conntrack-tools/downloads.html
>
> Where can I get more information about them?
>
> http://people.netfilter.org/pablo/conntrack-tools/
>
> Enjoy,
> 	Pablo (on behalf of the Netfilter Project)
>
>  =20

