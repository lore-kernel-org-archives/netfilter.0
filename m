From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Patch-o-matic
Date: Mon, 25 Nov 2002 10:22:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B3210199D0@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B3215414A3@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3215414A3@hslex01.hslbz.local>
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
To: 'George Vieira' <GeorgeV@citadelcomputer.com.au>, netfilter@lists.netfilter.org

> get a latest copy of iptables with it's patch-o-matic
> version, I am never able to patch the newnat stuff including
> the H323 patches..
>
> What is missing???
>
> I'm on (soon to be running, patching atm) Linux 2.4.19 with
> iptables 1.2.7a and it's patch-o-matic version....
>
> I get this every damn time....
>
> Testing... z-newnat16.patch NOT APPLIED (106 rejects out of 110 hunks)

<snip>

> what the hell is going on!?

Don't know ; it works for me, but..

I once had a problem patching the kernel which made me do a make menuconfig
(or make xconfig or make config, whatever). I configured nothing and saved
the "changes", after which patching worked.

Another solution could be the following ; I read somewhere sometime that you
might have to patch the kernel twice before some patch can be applied.

Maybe this helps ?..


Rob


