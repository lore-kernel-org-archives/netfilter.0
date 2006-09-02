From: Jonas Meurer <jonas@freesources.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Sat, 2 Sep 2006 16:29:08 +0200
Message-ID: <20060902142907.GB31352@freesources.org>
References: <20060831224857.GA23094@freesources.org>
	<000901c6cd8b$bfbb28e0$0101000a@tanjian>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c6cd8b$bfbb28e0$0101000a@tanjian>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 01/09/2006 Rob Sterenborg wrote:
> >>> the server is running linux kernel 2.4.27.
> >> 
> >> Hmm, I don't know about 2.4.x kernels but in 2.6.x you can always set
> >> parameters to integrated modules on the kernel comand line.
> >> 
> >> In your case it would be:
> >>  ip_conntrack_ftp.ports=21,31,41
> > 
> > how can i use this kernel command line?
> > do you mean sysctl?
> 
> No.
> You should edit your lilo.conf or grub.conf for this and look for the
> line that says where your kernel is (probably: /boot/...). Append
> "ip_conntrack_ftp.ports=21,31,41" to it.
> Then, reboot the server.

as it is a production server, reboot is very complicated.

there is absolutely no way to set the ports in a running system?

...
 jonas

