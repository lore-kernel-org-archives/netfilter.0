From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 10:25:27 -0500
Message-ID: <428A0CE7.40407@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	
	<427C4EA3.5090501@riverviewtech.net>	
	<4281FC1A.8090000@eccotours.dyndns.org>	
	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	
	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	
	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	
	<4289957B.8070909@riverviewtech.net>
	<1116333615.24331.4.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1116333615.24331.4.camel@debianbox>
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

> When this is done, fully working, can you post your full iptables script 
> that prevents brute forcing.

No problem, I'd be glad to.

What I posted early this morning should be functioning code as I did (this time) test it on my router at the house.  I was able to successfully control the number of SSH connection attempts that came in to my router at the house with it.  That being said the code should be ready for use.  If any one wants to test it and report any problems to me I'd be more than happy to try to resolve them.  I do however plan on adding some code to the script to send the traffic that will be TARPITed to the NOTRACK target in the raw table to prevent connection tracking from using up unnecessary resources.



Grant. . . .

