From: Khanh Tran <khanh@slc.edu>
Subject: RE: module performance
Date: Sat, 15 Feb 2003 15:47:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E2@EXCHANGE>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

Thanks for the insight.  I didn't think it should affect the performance.
As far as security goes for dynamically loaded modules, are you talking
about someone getting at the modules from the local file system?

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Daniel Wittenberg [mailto:daniel-wittenberg@starken.com]
Sent: Saturday, February 15, 2003 3:05 PM
To: Khanh Tran
Subject: Re: module performance


Linux kernel modules are not supposed to suffer any performance
difference when loaded dynamically or statically.  It applies to any
module (because of the way they are loaded), so you are good just doing
the modules.  Using statically built kernel's without module support is
better for security, but a PITA to upgrade.

Dan

On Sat, 2003-02-15 at 07:16, Khanh Tran wrote:
> Does anyone feel like giving a somewhat detailed explanation of the
> differences in loading the ip_tables modules versus building it into the
> kernel?  I've got several RedHat Linux firewalls and when it comes to
> upgrading the kernels, loading ip_tables as  modules is easy.  Otherwise,
I
> have to upgrade my kernel and then go back and re-compile ip_tables into
the
> kernel.  This has proven to be much more time consuming, especially with
the
> growth of ip_tables use on our network.
> 
> Thoughts?  Thanks in advance?
> 
> Khanh Tran
> Network Operations
> Sarah Lawrence College
> 




