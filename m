From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: iptables-1.2.6a patch-o-matic patches to userspace iptables code.
Date: Fri, 14 Jun 2002 12:19:04 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206141219.04657.fabrice@celestix.com>
References: <20020611113630.A5302@Ajftl1.ajfthome.on.ca>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020611113630.A5302@Ajftl1.ajfthome.on.ca>
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
To: Alistair Tonner <Alistair@alistairt.2y.net>, netfilter@lists.samba.org

On Tuesday 11 June 2002 23:36, Alistair Tonner wrote:
> Hi folks:
> I suspect this should be directed to a specific developer, but
> I felt that it should
> be tossed out there for general review.
> I've just been playing with 1.2.6a and kernel 2.4.18 and have
> been applying and poking at
> different patches ..
> I've got this box with quite a few partitions mounted for
> different elements of the
> filesystem tree .. and since it will be a firewall, I've got
> most of the basics set
> to be dismounted unless needed.  Thus, usr/src/ is a separate
> partition, as is /tmp and
> /var/log, etc etc etc... basic minimums will be in place in
> production.
> When I went to apply ipt_REJECT_fake_source, runme newnat died
> a nasty horrible ugly death
> complaining of illegal cross device links. It appeared that it
> tried to hard link from
> /usr/src/iptables-1.2.6a to /tmp ... not sure if it was the
> code or something I did, but
> thought that someone might want to look into it for future
> reference.

Hello,

yes, it was my mistake. I fixed it some time ago (get the latest cvs version
of netfilter), so that now it won't try to hardlink in a different
/tmp but inside the same directory (to maximize the chances of being on the
same partition). So give it a try and let me know if it still doesn't work.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

