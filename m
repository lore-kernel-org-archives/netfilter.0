From: Amitabh Kant <amitabhkant@gmail.com>
Subject: Re: Installing iptables under MacOS X (for snort_inline)
Date: Mon, 24 Oct 2005 22:52:21 +0530
Message-ID: <84b68b3d0510241022x78fe8c15tc6ef0ab03465a379@mail.gmail.com>
References: <2DF90770-7496-4781-AA60-D8A4E5F17E0A@bordo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2DF90770-7496-4781-AA60-D8A4E5F17E0A@bordo.com.au>
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
To: James Brown <jlbrown@bordo.com.au>
Cc: netfilter@lists.netfilter.org

I am not very sure, but isn't Mac OS X based on some BSD code.  If
that's the case, you could try using ipfw/pf to work with snort in
inline mode.

Amitabh

On 10/23/05, James Brown <jlbrown@bordo.com.au> wrote:
> when I try "make install-devel" I get:
>
> Making dependencies: please wait...
> Something wrong... deleting dependencies.
>
>
>      Please try `make KERNEL_DIR=3Dpath-to-correct-kernel'.
>
>
> make: *** [linux/ip.h] Error 1
>
>
> This is under MacOS X Tiger (10.4.2).
>
> Has anyone got it to work under MacOS X?
>
> Thanks,
>
> James.
>
>

