From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need help with iptables DNAT on local loopback
Date: Fri, 16 Apr 2004 20:57:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404162057.40638.Antony@Soft-Solutions.co.uk>
References: <003101c423eb$fe5d2360$0a02a8c0@wacko6tr80mjb7>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003101c423eb$fe5d2360$0a02a8c0@wacko6tr80mjb7>
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

On Friday 16 April 2004 8:49 pm, C Kadziolka wrote:

> Hello,
>
> I am having some problems with making iptables work. I have
> a standard Slackware 9.0 installation, which is running kernel
> 2.4.22.
>
> My problem is this, it seems like no matter what iptables
> commands i issue, the kernel ignores them and acts as if
> i never issued them.
>
> To start with, i would just like to be able to DNAT all connections
> from one port to another port, all on the same computer over the
> local loopback.

Put the rules in the nat table of the OUTPUT chain for DNATting local packets.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


