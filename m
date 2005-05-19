From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Wed, 18 May 2005 23:55:27 -0500
Message-ID: <428C1C3F.9030600@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>
	<4289E72F.7020901@wp.pl> <428B3798.9050407@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428B3798.9050407@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> So my question is, cant we make iptables see the number of NEW 
> connections / attempts (Basically dictionary attack) given in a time 
> frame. And if the number of NEW connections exceed a certain time frame. 
> Then start DROP or TARPIT.

This *IS* based the number of NEW connections in a given time frame.  Note the "--seconds 60" parameter.  This is designed to see if there have been less than x number of NEW connections in the 60 second period.  If there have been less than x number of NEW connections in y time (seconds) then RETURN back to the calling chain and do not continue to parse this chain and ultimately TARPIT or DROP.

NOTE:  Take a look at https://lists.netfilter.org/pipermail/netfilter/2005-May/060570.html as this email has a newer (functioning) version of this script.



Grant. . . .

