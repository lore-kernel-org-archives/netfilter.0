From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: SSH Brute force attacks
Date: Mon, 16 May 2005 20:49:29 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0505162046050.3744@e-smith.charlieb.ott.istop.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
	<20050511203452.GA13902@bender.817west.com>
	<4285A29C.1020200@hotpop.com> <4287AD34.8010908@neatech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4287AD34.8010908@neatech.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Patrick Nelson <pnelson@neatech.com>
Cc: netfilter@lists.netfilter.org


On Sun, 15 May 2005, Patrick Nelson wrote:

> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 -m 
> recent --hitcount 4 --set --name SSH -j RETURN
>
> is a integral part of his method.  I have the same output to the command 
> iptables -m recent -h as others here:
> <snip>
> recent v1.2.11 options:
> [!] --set                       Add source address to list, always matches.
> [!] --rcheck                    Match if source address in list.
> [!] --update                    Match if source address in list, also update 
> last-seen time.
> [!] --remove                    Match if source address in list, also removes 
> that address from list.
> --seconds seconds      For check and update commands above.
>                                     Specifies that the match will only occur 
> if source address last seen within the last 'seconds' seconds.
> --hitcount hits             For check and update commands above.
>                                    Specifies that the match will only occur 
> if source address seen hits times.
> <snip>
>
> And I get the same output from Grant's recent command of:
>
> iptables v1.2.11: Unknown arg `4'
> Try `iptables -h' or 'iptables --help' for more information.

If the doc is to be believed then --hitcount is only valid with --remove 
and --update. IOW, it's not valid with --set and --rcheck.

