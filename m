From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: nfs ports
Date: Fri, 28 Jan 2005 12:50:55 -0500
Message-ID: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

I've been fighting the good fight trying to maintain nfs connections though my 
firewall but I'm not winning. Every time I think I have opened the ports I 
need nfs (portmapper?) uses a different port. My questions:

1.  Is there a netfilter patch for tracking nfs ports similar to the one for 
ftp?

2.  If not, can someone point me to a list of ports used by nfs so that I can 
open up what I need once and for all?

Thanks

Jeff

