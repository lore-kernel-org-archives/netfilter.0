From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Fri, 15 Dec 2006 09:15:43 +0000
Message-ID: <200612150915.43921.mike@v6.gaima.co.uk>
References: <200612121942.19276.mike@v6.gaima.co.uk>
	<457F6F58.3010005@riverviewtech.net>
	<200612131239.35043.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612131239.35043.mike@v6.gaima.co.uk>
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

Damn it, I keep sending these with the wrong account :/ ...

On Wednesday 13 December 2006 12:39, Mike Williams wrote:
> Hmm, which suggests they aren't being tracked properly... And after some
> investigation traffic going to any of the VPN networks from 136.0/24 aren't
> being conntrack'd, whereas on the other firewalls I run they are (i.e. the
> VPN between 0.0/24 and 30.0/24). Is there any peculiar about conntrack'ing
> packets over/out a bridge?

Just a quick update before I reply fully to the very helpful Grant.

I've just dropped the bridge interface on the public side of LFW, so br0 is no 
more. The purpose of the bridge was to simulatiously allow NAT'ing to 
internal server/services (like the current firewalls we have do), and also 
give protection to other servers that required their own public IP addresses.
The VPNs terminate at bond0 now that it has the IP addresses br0 had, and the 
default route is out the same.

Now traffic can travel in all directions correctly, and exactly how I 
expected. Connections from 136.0/24 to 22.0/24 going out bond0 (native 2.6 
ipsec, so no VPN virtual interfaces) get conntrack'd, so the returning 
packets are known to be RELATED or ESTABLISHED, thus get ACCEPT'd.

Feature? Bug? Mis-conception? At 1:15 am, I don't much care :)

-- 
Mike Williams

