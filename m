From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: Error when using iptables 1.2.6a (or another version)
Date: Tue, 4 Jun 2002 16:28:07 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604212807.GA30300@valjean.si.ocslink.com>
References: <B5747F3DB39FD411884B00B0D07808CCB6C1FC@server10> <1023223261.8261.2.camel@billy.demon.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1023223261.8261.2.camel@billy.demon.nl>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Tue, Jun 04, 2002 at 10:41:01PM +0200, Tony Earnshaw wrote:
| O.k., I use Red Hat and kernel.org kernels and modules, but it seems
| *very* strange to me that Mandrake should use gzipped modules.

There is a compile-time option to modutils (modprobe, insmod, et al) that
permits gzipped kernel modules.  The INSTALL file from modutils-2.4.16
has this to say about it:

    [configure options]

    --disable-zlib          Handle gzipped objects?  Default is no.
                            You probably only need this if you are booting
                            a small root filesystem and the filesystem is
                            not compressed itself.

I know Slackware 7.1 and 8.0 enable this feature.

-James


