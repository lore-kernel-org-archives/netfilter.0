From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 13:22:05 -0500
Message-ID: <200907311322.05834.rob0@gmx.co.uk>
References: <20090731144247.01a4f9bb@zeus.int.pccl> <1249056381.27177.12.camel@enterprise.ims-firmen.de> <20090731172419.669eb256@zeus.int.pccl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090731172419.669eb256@zeus.int.pccl>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday 31 July 2009 11:24:19 Andrew Clayton wrote:
> On Fri, 31 Jul 2009 18:06:21 +0200, Thomas Jacob wrote:
> > On Fri, 2009-07-31 at 14:42 +0100, Andrew Clayton wrote:
> > [.. accessing outside IPs on a NAT router from
> > the inside network ...]

> But I do think the firewall is the proper place to do this.

To elaborate a bit on *why* Robby is right in his not-so-humble
opinion: the SNAT+DNAT solution makes your logs meaningless. There's
really no way to tell who's doing what, and from where.

I've seen cases in which people put too many eggs in a single DNS RR
basket ... like http://foo.example.com/ being SNAT'ed to LAN host
web.example.lan, and smtp:foo.example.com being SNAT'ed to a different
LAN host, mail.example.lan.

In a case like that, the SNAT+DNAT solution is the only one that will
keep foo.example.com working for clients behind the NAT. But there,
your real fix would be to use more names ... www.example.com and
mail.example.com in the above. If your DNS provider is charging you
extra for adding more names, find a reasonable DNS provider!
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
