From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: State NEW and --syn flag
Date: Tue, 20 Jul 2004 20:47:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040720184750.0B34420AB@sterenborg.info>
References: <200407201038.42003.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407201038.42003.Antony@Soft-Solutions.co.uk>
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
To: 'iptables' <netfilter@lists.netfilter.org>

> > If checking for state NEW, is there any reason to also check if the
> > --syn flag is set or is it enough to just rely on state NEW ?
> 
> Depends on your degree of security paranoia :)

...

> If you let through NEW packets which do not have SYN (only) 
> set, then the 
> result depends on the O/S on the machine they get forwarded 
> to.   I suggest 
> http://www.insecure.org as a source of data on what different 
> systems do with 
> different strange flag combinations in packets they receive.
> 
> One thing is almost certain - letting through NEW packets 
> which don't have SYN 
> set is very unlikely to result in an ESTABLISHED connection 
> being created.

Thanks !
I'll be paranoid ;-)..


Gr,
Rob


