From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: netfitler against Trojans and worms
Date: Mon, 5 Jul 2004 15:10:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407051510.06470.gdh@acentral.co.uk>
References: <1d7da3f40407050659476384b7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1d7da3f40407050659476384b7@mail.gmail.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 05 July 2004 14:59, Saad Faruque wrote:

> i did find couple of sites ex.
> (http://www.doshelp.com/trojanports.htm) which lists some ports. but i
> really am not sure if u simply block all these ports if it will effect
> my clients regular internet activity. any alternative suggestions are
> also welcome :)

My suggestion would to stop fire-fighting and instead turn the problem on its 
head.

Change your default policy from ACCEPT to DROP, and put in rules so that 
people are allowed to access port 80, 443, etc. and only the ports they 
actually NEED access to.

Cheers,
Gavin.

