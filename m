From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Possible bug in iptables : -m --uid-owner not working with ping
Date: Mon, 22 Oct 2012 09:44:58 -0500
Message-ID: <20121022144458.GC3672@harrier.slackbuilds.org>
References: <50855A6B.1070000@lavabit.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50855A6B.1070000@lavabit.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, Oct 22, 2012 at 04:38:35PM +0200, matja=B8 wrote:
> Is it possible that owner matching does not work correctly ?
> I tried blocking internet access to one user, but found out he can
> still use ping.

ping(1) must be SUID to have the privilege to make ICMP echo request=20
packets. Therefore outgoing pings are done as root.

Your solution would be to change permissions of your ping binary such=20
that the user in question cannot execute it.

snip
> Also : the -match --uid-owner seems to work on other protocols.

Indeed.

> Oddly enough, using group id instead seems to work :
snip
> Is this expected behaviour ?

Yes.
--=20
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
