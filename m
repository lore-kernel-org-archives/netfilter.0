From: Erdal Mutlu <emutlu@fonts.de>
Subject: Re: NAT and FTP problem
Date: Fri, 22 Nov 2002 13:29:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211221327280.21420-100000@bhows40003.fonts.de>
References: <20021122111627.9701.qmail@webmail32.rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021122111627.9701.qmail@webmail32.rediffmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: DurgaPrasad Adusumalli <asndp@rediffmail.com>

On 22 Nov 2002, DurgaPrasad  Adusumalli wrote:
> Hi,
>      This seems to be the problem with the modules. I think they
> are not loaded at run time.
>    Do $ /sbin/lsmod
> and check for the entries ipt_conntrack_ftp
>                            ipt_nat_ftp.



Hello,

No it is not. If you were right, then my connections wouldn't work. By the
way I am using monolitic kernel.

Erdal Mutlu




