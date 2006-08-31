From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how to set ports for ip_conntrack_ftp
Date: Thu, 31 Aug 2006 18:28:29 +0200
Message-ID: <000a01c6cd1a$7e02bbf0$0101000a@tanjian>
References: <20060831155749.GC32342@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060831155749.GC32342@freesources.org>
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
To: 'Netfilter-Users' <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org <> wrote:
> On 31/08/2006 Rob Sterenborg wrote:
>>> where can i set the ports for ip_conntrack_ftp?
>>> 
>>> if i load it as module, i can use
>>> 'modprobe ip_conntrack_ftp ports=21,31,41'
>>> 
>>> but if the module is compiled into the kernel, i have no idea how to
>>> set the ports. i didn't find anything in either /proc or
>>> kernel-source/Documentation.
>> 
>> AFAIK you can't: you can only do that when it's compiled as a module.
> 
> in other words, this module is unusable for ftpservers on non-standard
> ports, if it's compiled into the kernel?

Ah, well, you could try by passing the paramters to the kernel at
boot-time (lilo/grub). maybe that would work.


Gr,
Rob


