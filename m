From: Anthony Liu <anthony@nexus-online.com>
Subject: Re: Memory leak problem
Date: Sat, 28 Sep 2002 00:51:12 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927165112.7AF5C87849@defiant.starfleet.net>
References: <7F2740B50D94FD4B9EAF9AAC33016C3C45382C@lascar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7F2740B50D94FD4B9EAF9AAC33016C3C45382C@lascar>
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
To: Jean Cantarutti <jcantarutti@subtel.cl>
Cc: Netfilter Mailing List <netfilter@lists.samba.org>

On Fri, 27 Sep 2002 11:03:32 -0400 Jean Cantarutti <jcantarutti@subtel.cl> wrote:

> Memory leak problem
> 
> Hi, im using iptables 1.2.5 on a HP machine working like firewall, it has 512 MB of RAM and every 30 seconds eats 6 kb of RAM, in 48 hours only left 8300 kb of available RAM.
> 
> I need help.

Are you sure it was leaking memory? Each tracked connection use up some kernel memory.
http://www.netfilter.org/documentation/FAQ/netfilter-faq.html#toc3.6

Ignore "available" RAM, the system will take as much "available" RAM for various cache buffers,
the system will release it back from the cache buffers when needed.  If the memory pressure still
increase, the system will start to swap some other process out.  Unless you are seeing out-of-memory
situation in the syslog, it should not be a problem.  BTW, how many clients is the firewall serving?

