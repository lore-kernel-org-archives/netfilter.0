From: Simon <greminn@gmail.com>
Subject: A netfilter 'if possible' question
Date: Wed, 26 Jul 2006 21:29:48 +1200
Message-ID: <5bdb1aa70607260229h5742562djf4065dfb70dfbb6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi There,

I understand NAT to the level that i currently use it, to send certain
ports from our DSL link to various different servers within our
internal network. Is it possible to do this to an outside IP address.

eg. zzz.zzz.zzz.zzz sends http requests to port 80 and 443 on
xxx.xxx.xxx.xxx, then have netfilter NAT those requests thru to port
80/443 on yyy.yyy.yyy.yyy, both x and y being different real world IP
addresses and on different subnets? (physically seperate servers).

Thanks and sorry if its a lame question...

Simon

