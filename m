From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 03:39:58 -0500
Message-ID: <200507020339.58492.rob0@gmx.co.uk>
References: <NEBBKBPLMLNABNADCIPAEECJBDAB.dleangen@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAEECJBDAB.dleangen@canada.com>
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

On Saturday 02 July 2005 01:43, David Leangen wrote:
> some direction. Unless, of course, I'm looking in the wrong place...

FWIW you are *asking* in the wrong place. This is an OS problem, not a 
netfilter / iptables issue.

RH/FC and such like to hide information from the user. You can add some 
shell code to your startup scripts which redirect more verbose output 
to files. In this case maybe some echo commands to show which file is 
being fed to iptables-restore.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

