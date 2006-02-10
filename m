From: Frederic Beck <frederic.beck@loria.fr>
Subject: Re: Problem with state match for ip6tables
Date: Fri, 10 Feb 2006 14:56:31 +0100
Message-ID: <20060210145631.1726fd0d@localhost.localdomain>
References: <20060202133857.5bded5b8@localhost.localdomain>
	<87d5i3bf2t.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <87d5i3bf2t.fsf@newton.gmurray.org.uk>
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

> > root@trunks:~/firewalling/iptables
> > % ip6tables -A FORWARD  -m state --state ESTABLISHED -j ACCEPT
> > ip6tables: Unknown error 4294967295
> 
> I see the same problem with gentoo kernel 2.6.15-r2 and iptables
> 1.3.5, except that I also add the protocol 
> 
> # ip6tables -I INPUT 1 -p tcp -m state --state NEW,ESTABLISHED -j
> ACCEPT ip6tables: Unknown error 4294967295
> 
> strace shows this prior to the error
> 
> socket(PF_INET6, SOCK_RAW, IPPROTO_RAW) = 3
> getsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */,
> "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
> getsockopt(3, SOL_IPV6, 0x41 /* IPV6_??? */,
> "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [2328]) =
> 0 setsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */,
> "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2620) =
> -1 ENOENT (No such file or directory) write(2, "ip6tables: Unknown
> error 4294967"..., 36ip6tables: Unknown error 4294967295 ) = 36

I tried on several distributions (debian, fedora) and kernel versions
(2.6.14, 2.6.8), but i get each time the same error.

Is this a known bug ?  I couldn't find it in netfilter's bugzilla

Fred

