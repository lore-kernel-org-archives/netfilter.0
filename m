From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iproute2 and fwmark usage
Date: Sun, 11 Jan 2004 23:22:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401112322.27307.Antony@Soft-Solutions.co.uk>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <000a01c3d88c$f8d07d20$1684188d@Kiste> <001701c3d898$70c170e0$1684188d@Kiste>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c3d898$70c170e0$1684188d@Kiste>
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

On Sunday 11 January 2004 11:12 pm, Thhoep wrote:

> ok, just solved my problem. was just a misunderstanding of mine. i thought
> "stable" means "proved and working". didn't know that i had to patch and
> bugfix stable kernels till they work in normal order.

Normally, you don't.   However if you mix versions of the kernelspace system 
and the userspace utilities, results are not guaranteed.

The general rule is that if you update one you should update the other to 
match.

> found the necassary bugfixes for all my problems as a patch-o-matic on the
> netfilter main page.
>
> never the less thanks for helping.

Glad you've got things working okay now.

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


