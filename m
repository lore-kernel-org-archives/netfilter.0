From: Jason Joines <joines@bus.okstate.edu>
Subject: Re: Another Hardware Sizing Question
Date: Mon, 08 Sep 2003 09:34:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5C9384.1050600@bus.okstate.edu>
References: <3F58B934.3060902@bus.okstate.edu> <1062999695.827.19.camel@india.nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062999695.827.19.camel@india.nsecure.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

Dharmendra.T wrote:
> On Fri, 2003-09-05 at 21:56, Jason Joines wrote:
> 
> /   We have a subnet with a potential of 1022 hosts.  Each machine is ///
> /connected to a 100 Mbps switch.  The connection from our subnet to the ///
> /main university network is I believe OC-3, ~154 Mbps.  There are ///
> /currently less than 500 active machines on the network.  They do the ///
> /normal web brosing, and connect to NetWare and Domino servers outside ///
> /the subnet.  With that, the maximum traffic we've ever seen between our ///
> /subnet and the rest of the world is about 40 Mbps.///
> ////
> /   We'd like to put all the boxes on our subnet behind and IPTables ///
> /firewall and NAT them.  We'd also like to take into consideration the ///
> /possibility of the number of machines growing to ~1000.  We have quite a ///
> /few spare PIII 450 boxes setting around.///
> ////
> /   What would be the mininum, ideal, etc., hardware setup for this ///
> /environment.///
> ////
> ////
> /Thanks,///
> ////
> /Jason Joines///
> /Open Source = Open Mind///
> /========================///
> ////
> 
> Hi,
> 
> Ideally if you put p-3 machine with 256MB ram should work in this 
> situation assuming that you are not running any application on the 
> firewall other than packet filtering.
> 
> ////
> 
> -- 
> Regards
> Dharmendra.T
> dharmu@nsecure.net
> Linux Security and Admin
> 


  Yep, just doing packet filtering.  How many p3 with 256 MB would you 
recommend?

Thanks,

Jason
===========


