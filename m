From: Andre Costa <acosta@ar.microlink.com.br>
Subject: Re: [OT] module performance
Date: Sun, 16 Feb 2003 11:14:36 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030216111436.414c93f5.acosta@ar.microlink.com.br>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E7@EXCHANGE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E7@EXCHANGE>
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
To: netfilter@lists.netfilter.org

Hi Khanh,

They differ basically on modprobe's ability to resolve dependencies
(based on a makefile-like file previously created with depmod, tipically
/lib/modules/*/modules.dep on RH systems) and load all modules necessary
to activate a specific one. insmod OTOH will try to load the specified
module *only*, and therefore will fail if dependencies are not resolved.

As you might have guessed, modprobe is a wrapper around insmod: it
parses the depmod-generated file, learns all inter-dependencies among
modules and then call insmod (or rmmod) to actually carry out module
loading (or unloading). You can check this with the -n and -v switches:

# modprobe -nv ipt_state
/sbin/insmod /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_conntrack.o
/sbin/insmod /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_state.o

(ip_state depends on ip_conntrack)

Compare it to the same attempt using insmod:

# insmod -n ipt_state
Using /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_state.o

HTH,

Andre

On Sun, 16 Feb 2003 09:23:23 -0500
Khanh Tran <khanh@slc.edu> wrote:

> Here's a follow-up to this train of thought:
> 
> Does someone feel like giving a somewhat detailed explanation of the
> difference between using insmod and modprobe to load kernel modules? 
> This is probably slightly off-topic, but still relevant to loading
> ip_tables modules and the performance of the firewall.
> 
> Thanks again...
> 
> Khanh Tran
> Network Operations
> Sarah Lawrence College

-- 
Andre Oliveira da Costa

