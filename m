From: "Stefan-Michael. Guenther (in-put GbR)" <S.Guenther@in-put.de>
Subject: Re: Re: Accounting with iptables vs. snmp
Date: Tue, 26 Apr 2005 21:17:51 +0200
Message-ID: <200504262117.51465.S.Guenther@in-put.de>
References: <0MKsEO-1DQUpM3MdQ-00057r@mxeu13.kundenserver.de>
Reply-To: S.Guenther@in-put.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0MKsEO-1DQUpM3MdQ-00057r@mxeu13.kundenserver.de>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello Richard,

> Hello Stefan,
> maybe (!)... your problem is simple so solve. You are appending this
> rules with the LOG target. So you will not count traffic which is
> blocked. Just write an -I instead of -A. But i don't know if thats the
> problem which took up to 25% of traffic difference. It sounds very
> strange, if you say that some times you count more than your provider
> and another day your provider counts more. Maybe you have an failure
> based on rounding the bytes to megabytes?
>
I don't block packets on this box, there is a cisco box between the net and 
the linux box. Last wednesday the difference was about 2.6 GB in only 24 
hours! The scripts doesn't do any rounding, I've switched this feature off to 
get exact results. Even with all those portscans and P2P-packets, I don't 
think that this could add up to 2.6 GB. And it wouldn't explain why the box 
sometimes reports more traffic that the provider.

Could it be that the box is to slow, to see and log all packets? Sometimes I 
find lines like "last message repeated 10 times" in the logfile but my 
scripts is able to analyse these lines, too. And again, this would mean equal 
or less traffic, but no more traffic than the providers reports.


Stefan


-- 

*****************************************
in-put GbR - Das Linux-Systemhaus
Stefan-Michael Guenther
Moltkestrasse 49     D-76133 Karlsruhe
Tel./Fax : +49 (0)721 / 83044 - 98/93
http://www.in-put.de
*****************************************

