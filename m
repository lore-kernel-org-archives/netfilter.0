From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: NAT + Firewall
Date: Sun, 02 Jan 2005 00:56:08 -0500
Message-ID: <1104645369.8653.2.camel@jasiiitosh.opensourcedevel.com>
References: <41D645A8.4183E803@ita.org.mo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D645A8.4183E803@ita.org.mo>
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
To: edwardspl@ita.org.mo
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sat, 2005-01-01 at 14:39 +0800, edwardspl@ita.org.mo wrote:
> Dear All,
> 
> Happy New Year !
> 
> I want to know how to set the nat and firewall, then all of the client
> PCs needn't to via ( throught ) leased line / broadband again, means
> direct to internal network to connect with Internet Server ?
> 
> Many thank for your help !
> 
> Edward.
> 
> 
> 
I would suggest that you read Oskar Andreasson's excellent tutorial on
using iptables.  You can find it in the tutorials section of the
netfilter web page (http://www.netfilter.org).  There are also some
slide shows available in the training section at
http://iscs.sourceforge.net
You could also use a GUI configuration like fwbuilder
(http://www.fwbuilder.org) to make this easier.  When ISCS is ready, it
will automatically configure even the most complex NAT such as nested,
overlapping and range NAT.  Good luck in your studies - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


