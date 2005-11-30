From: "David Leangen" <netfilter@leangen.net>
Subject: RE: Is using a blacklist in iptables a good strategy?
Date: Wed, 30 Nov 2005 23:51:58 +0900
Message-ID: <DGEJKHJNFFKAGKLEMOPJIEDJCAAA.netfilter@leangen.net>
References: <438C14E9.5010309@szift.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438C14E9.5010309@szift.org>
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
To: NetFilter <netfilter@lists.netfilter.org>


Guys,


> > I'm getting a little fed up with break-in attempts happening every 
> > single day.

> My current way of doing this is using the ipt_recent
> so now I only block the 'strage connections' for some time...
> here's some copy/paste from my current ipt rule set


> http://people.netfilter.org/peejix/geoip/howto/geoip-HOWTO-2.html
> 
> it's a geoip patch for iptables, allows you to block entire countries,
> or you can allow connections from only certain countries.


Thanks for the great tips!

Dave



