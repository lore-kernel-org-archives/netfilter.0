From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall tcp timeout
Date: Wed, 19 Nov 2003 12:22:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311191222.hAJCM5j23805@agate.rockstone.co.uk>
References: <006d01c3ae94$0303f650$0800a8c0@KORNIS>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006d01c3ae94$0303f650$0800a8c0@KORNIS>
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
To: netfilter@lists.netfilter.org

On Wednesday 19 November 2003 11:55 am, Kornelijus wrote:

> Hi.
>
> Have a problem.
>
> "Acording to related documentation by software implementation
> "Firewall tcp timeout" must be set to 60 minutes."

There are many timeouts associated with TCP - the above description is 
insufficiently specific to identify which one is being referred to.

See /usr/src/linux/Documentation/networking/ip-sysctl.txt for some 
information about the timeouts included in the normalLinux TCP/IP stack, and 
see /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c for similar 
values used in the netfilter connection tracking system.

Once you've found out which of these values your documentation is referring 
to, you can change it to whatever you like, either by writing to a file in 
/proc/sys/net/ipv4, or by recompiling netfilter conntracking, depending on 
which value it is you want to adjust.

Regards,

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery
                                                     Please reply to the list;
                                                           please don't CC me.

