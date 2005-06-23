From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables on FreeBSD
Date: Thu, 23 Jun 2005 07:15:44 -0500
Message-ID: <200506230715.44256.rob0@gmx.co.uk>
References: <000001c69530$0cbbf050$1000a8c0@mutogen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c69530$0cbbf050$1000a8c0@mutogen>
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

On Wednesday 21 June 2006 07:39, Artiom Matiuhoff wrote:
> Is it possible to setup iptables on FreeBSD5.3?

iptables(8) depends heavily upon the netfilter code in the Linux
kernel, so no, it is not possible. *BSD != Linux.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

