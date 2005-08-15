From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 04:46:50 -0500
Message-ID: <200508150446.51233.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
	<200508152018.33866.michael@networkstuff.co.nz>
	<4300612F.6070603@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4300612F.6070603@mnemon.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 2005-August-15 04:32, J=F6rg Harmuth wrote:
> > Am I missing something?
>
> Yes, -v ;) Ok, you certainly typed "iptables -L" and this will not
> output the interfaces. Try "iptables -nvL" and you will see, that
> "ACCEPT all anywhere anywhere" concerns only loopback.
>
> Regarding the timeout issue, do as Grant recommended. May be you
> should log in OUTPUT too, at least if logging in INPUT will not show
> the problem.

GMTA. :) I just sent something very much like the foregoing, except due=20
to a MUA/PEBKAC problem I missed the fact that it went offlist. The one=20
substantive addition in my offlist message was a recommendation to use=20
iptables-save(8) output to see a detailed listing of rules.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

