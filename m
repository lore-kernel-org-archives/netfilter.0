From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Restrict based on time of day
Date: Sat, 15 Apr 2006 12:52:24 -0500
Message-ID: <444132D8.5080908@riverviewtech.net>
References: <57F9959B46E0FA4D8BA88AEDFBE5829016756E@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829016756E@pxtbenexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org

> I was asked today by a client if we can configure the firewall to
> restrict outgoing traffic between certain time frames from certain IP's.
> Basically they have had issues with people using the system in
> appropriately after hours.  We have policy restrictions in place that
> prevent people from logging into the domain after hours but they have
> their own laptops which causes a problem.

Gary, this could easily be done with the IPTables "Time" match.  Take a look at "http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-time", I think you will find it very interesting and help full.



Grant. . . .

