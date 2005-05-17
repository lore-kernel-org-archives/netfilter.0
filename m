From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 16:36:19 +0300
Message-ID: <1116336980.24331.28.camel@debianbox>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>
	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>
	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>
	<42898402.10507@eccotours.dyndns.org> <4289E72F.7020901@wp.pl>
	<4289EF97.2060009@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289EF97.2060009@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: =?iso-8859-2?Q?=A3ukasz?= Hejnak <sziftgroup@wp.pl>, netfilter@lists.netfilter.org

$ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60 
> --hitcount 3 -j RETURN

-j RETURN didn't work here. It was blocking all my ssh connections, so i
used ACCEPT and its working now.

On Tue, 2005-05-17 at 15:20 +0200, Brent Clark wrote:
> $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60 
> > --hitcount 3 -j RETURN


