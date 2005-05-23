From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Mon, 23 May 2005 18:31:31 +0200
Message-ID: <42920563.7070406@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>	<428B3798.9050407@eccotours.dyndns.org>	<428C1C3F.9030600@riverviewtech.net>	<428C56C9.9000607@eccotours.dyndns.org>	<428CA51D.4080206@riverviewtech.net>	<428DDFBC.1080905@eccotours.dyndns.org>
	<428DF9F1.9060602@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428DF9F1.9060602@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Taylor, Grant wrote:
>> So... I cant see why I cant connect from a dynamically assigned ip.
> 
> 
> Brent, I'll have to take a closer look at your script later on (complete 
> flow analysis vs just the SSH_Brute_Force chain).  But for now it looks 
> like you have both versions (original and updated one) in your firewall, 
> this could be causing a few problems as I don't think it would take more 
> than one attempt in a 60 second period to get your self to the point 
> that you would be TARPITed / DROPed.  However I think that you would be 
> able to connect at least 1 time from any dynamic remote IP in the 60 
> second period.  Also keep in mind that the recent module (in the updated 
> version) is using an --update option which will keep track of the number 
> of times that you have tried to connect for 60 seconds after the last 
> connection attempt.
> 

Hi Grant

If you look carefully on the left, you will see I have hashed out the 
original rules.

Thanks

Kind Regards
Brent Clark

