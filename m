From: Mihael Kukec <mkukec@public.srce.hr>
Subject: Re: newbie question : ip_conntrack_ftp
Date: Wed, 24 Mar 2004 08:28:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4061389C.6020703@public.srce.hr>
References: <Pine.GSO.4.50.0403231623050.17504-100000@jagor.srce.hr> <406070EC.3010601@nk.nl>
Reply-To: mihael.kukec@public.srce.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <406070EC.3010601@nk.nl>
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

Victor Julien wrote:

> You're probably running the 'bf24' kernel (which kame with the 
> bootdisk). If you use 'kernel-image-2.4.18-1-i686' you do have the 
> modules. So you can use 'apt-get install kernel-image-2.4.18-1-i686' (if 
> you have an i686). Beware though, you need to modify your lilo.conf 
> because of initrd (instructions will be on the screen when you install).

Kernel that came originally was 2.2.20. I upgraded to 2.4.18-686. There
is no such image (kernel-image-2.4.18-1-i686) in latest stable or
testing packages, but there is kernel-image-2.4.25-1-686 in testing. I
will try with that...


Mihael





