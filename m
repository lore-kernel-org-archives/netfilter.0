From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ip_conntrack_ftp as a module or built-in?
Date: Tue, 22 Nov 2005 07:30:00 -0600
Message-ID: <200511220730.00694.rob0@gmx.co.uk>
References: <20051122104702.GC27443@rigacci.org>
	<54076.193.173.147.3.1132658395.squirrel@webmail.sterenborg.info>
	<20051122113351.GA29137@rigacci.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051122113351.GA29137@rigacci.org>
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

On Tuesday 2005-November-22 05:33, netfilter@rigacci.org wrote:
> > I'm not sure if passing that parameter to the kernel during boot
> > time will work (probably not).
> > Why would you do that anyway : why not use the module ?
>
> We are developing a network appliance and we are trying to keep a
> small static kernel, with only the required features, no KMOD, no
> discover, hotplug or whatever.

This is about the only scenario in which built-in netfilter drivers
make sense.

> Infact this is a more generic question: a module that accepts
> some paramters can be built into the kernel and still receive all

man 7 bootparam
[/usr/src/linux/]Documentation/kernel-parameters.txt
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

