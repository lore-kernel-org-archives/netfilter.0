From: bash <0x62ash@gmail.com>
Subject: Re: IPSET and linux-2.6.15 kernel
Date: Mon, 27 Mar 2006 23:13:07 +0400
Message-ID: <20060327231307.00de300b.0x62ash@gmail.com>
References: <20060327192319.31ecc828.0x62ash@gmail.com>
	<000001c651bb$3f58b470$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c651bb$3f58b470$0101000a@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

On Mon, 27 Mar 2006 18:26:48 +0200
"Rob Sterenborg" <rob@sterenborg.info> wrote:

> >   Hello All,
> > Anybody tried to apply patch-o-matic-ng-20051203 to current
> > linux-2.6.15 kernel? Im want to add IPSET
> > http://ipset.netfilter.org/install.html functionality to netfilter.
> > But this p-o-matic offer to add only COMMENT patch :/
> > 
> > execution flow:
> > ---%<-------------------------------------------------------- src #
> > pwd /usr/src
> > 
> > src # ls
> > iptables-1.3.4  linux  linux-2.6.15  patch-o-matic-ng
> > patch-o-matic-ng-20051203.tar.bz2
> > 
> > src # cd patch-o-matic-ng
> > 
> > src # KERNEL_DIR=/usr/src/linux-2.6.15/
> > IPTABLES_DIR=/usr/src/iptables-1.3.4/ ./runme
> > ---%<--------------------------------------------------------
> > 
> > Any advices, comments or help?
> 
> Try : ./runme extra

Thanks a lot! This helps me! :)

-- 
Biomechanica Artificial Sabotage Humanoid

