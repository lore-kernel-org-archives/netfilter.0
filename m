From: Victor Julien <victor@nk.nl>
Subject: Re: newbie question : ip_conntrack_ftp
Date: Tue, 23 Mar 2004 18:16:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406070EC.3010601@nk.nl>
References: <Pine.GSO.4.50.0403231623050.17504-100000@jagor.srce.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.50.0403231623050.17504-100000@jagor.srce.hr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter List <netfilter@lists.netfilter.org>
Cc: mkukec@public.srce.hr

You're probably running the 'bf24' kernel (which kame with the 
bootdisk). If you use 'kernel-image-2.4.18-1-i686' you do have the 
modules. So you can use 'apt-get install kernel-image-2.4.18-1-i686' (if 
you have an i686). Beware though, you need to modify your lilo.conf 
because of initrd (instructions will be on the screen when you install).

Regards,
Victor

Mihael Kukec wrote:
> 
> Hello!
> 
> 
> I'm using latest stable Debian, with 2.4.18 kernel. Unfortunately it does
> not have ip_conntrack_ftp module included and I need it. Can someone give
> me short instructions on that to do? Where to get source, and if there
> are, some special instructions for compiling etc...
> 
> 
> 
> 
> TIA
> 
> 
> 
> 


