From: Les Mikesell <les@futuresource.com>
Subject: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 12:11:18 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095354677.21739.6.camel@moola.futuresource.com>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
	<4149A4D5.2010209@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4149A4D5.2010209@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 09:36, Aleksandar Milivojevic wrote:
> > 
> > Is this just an over-simplifying statement that really means "if you're 
> > reading this, then don't even try setting up a NAT-traversing VPN"?
> 
> Yes and no.  Depends on what you mean by VPN.  VPN can be implemented in 
> many different ways.  With IPSec implementation you may run into 
> problems (some solvable, some not).  With user space daemon 
> implementations such as OpenVPN or VTun, you shouldn't have any 
> problems.  Basically it is good idea not to have VPN endpoints behind 
> NAT (if possible, of course).

CIPE (http://sites.inka.de/sites/bigred/devel/cipe.html) works over
NAT anywhere you can get UDP packets back and forth.  It was included
in RH9 and fedora core 1 as a fill-in-the-form option in the network
setup GUI but was dropped in fedora core 2 because it didn't work
with the 2.6 Linux kernel.  CIPE 1.6 claims to work with the 2.6
kernel now, but there still seems to be a problem making it work
with FC2.  
---
  Les Mikesell
   les@futuresource.com



