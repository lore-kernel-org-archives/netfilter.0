From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: RE: module performance
Date: 15 Feb 2003 15:34:16 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045344856.1551.9.camel@runabout.noc.starken.com>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E2@EXCHANGE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E2@EXCHANGE>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Khanh Tran <khanh@slc.edu>
Cc: netfilter@lists.netfilter.org

If you can't load modules it takes away one way that someone could
install a LKM or trojan on the machine.

Dan

On Sat, 2003-02-15 at 14:47, Khanh Tran wrote:
> Thanks for the insight.  I didn't think it should affect the performance.
> As far as security goes for dynamically loaded modules, are you talking
> about someone getting at the modules from the local file system?
> 
> Khanh Tran
> Network Operations
> Sarah Lawrence College
> 
> 
> -----Original Message-----
> From: Daniel Wittenberg [mailto:daniel-wittenberg@starken.com]
> Sent: Saturday, February 15, 2003 3:05 PM
> To: Khanh Tran
> Subject: Re: module performance
> 
> 
> Linux kernel modules are not supposed to suffer any performance
> difference when loaded dynamically or statically.  It applies to any
> module (because of the way they are loaded), so you are good just doing
> the modules.  Using statically built kernel's without module support is
> better for security, but a PITA to upgrade.
> 
> Dan



