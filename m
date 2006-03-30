From: "Filip Sneppe" <filip.sneppe@gmail.com>
Subject: Re: ip_conntrack_ftp and non-standard ports
Date: Thu, 30 Mar 2006 23:10:38 +0200
Message-ID: <9151ac2a0603301310q19746224yb8d43d26f31a31f6@mail.gmail.com>
References: <442B68CB.10005@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442B68CB.10005@palaver.net>
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
To: Brian Capouch <brianc@palaver.net>
Cc: netfilter@lists.netfilter.org

On 3/30/06, Brian Capouch <brianc@palaver.net> wrote:
> I hope this isn't a FAQ.  I've looked around and googled around, and so
> far, it seems from what I've found that such a thing can be done.  What
> I don't know is just how to tell iptables to do it.
>
This is done when loading the ip_conntrack_ftp and ip_nat_ftp kernel module=
s,
eg.

modprobe ip_conntracl_ftp ports=3D21,2021,3021
modprobe ip_nat_ftp ports=3D21,2021,3021

(see "modinfo ip_conntrack_ftp")

> I hope someone might provide a pointer.
>
Hope this helps...

Regards,
Filip

