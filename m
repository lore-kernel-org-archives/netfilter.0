From: Jeff Rasmussen <jeff.rasmussen@gmail.com>
Subject: Re: FTP and IPSEC
Date: Thu, 7 Jul 2005 18:42:58 +0000 (UTC)
Message-ID: <loom.20050707T203841-41@post.gmane.org>
References: <57F9959B46E0FA4D8BA88AEDFBE582909ED0@pxtbenexd01.pxt.primeexalia.com>
	<loom.20050707T201352-299@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Jeff Rasmussen <jeff.rasmussen <at> gmail.com> writes:

I was able to recreate your same behavior by removing the modules mentioned 
above.

It looks like the modules ip_ftp_nat and ip_conntrack_ftp cannot
differentiate between the vpn traffic and the public Internet traffic
going through the same interface.

However, the only side-effect will be that I won't be able to use my server
as an ftp client through NAT.  I can live with that.

Is this something that should be reported as a bug?

Jeff Rasmussen
GPG public key 0x9686C12F


