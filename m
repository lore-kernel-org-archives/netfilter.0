From: Kim Jensen <kimj@dawn.dk>
Subject: Re: a problem, please help me!!
Date: Wed, 16 Apr 2003 19:07:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304161907.47249.kimj@dawn.dk>
References: <Law15-F64v5Gmz8Phg8000073bf@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F64v5Gmz8Phg8000073bf@hotmail.com>
Content-Disposition: inline
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
To: Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org

On Wednesday 16 April 2003 18:07, Afshin Lamei wrote:
> hi,
> I've a problem compiling the kernel 2.4.19 for netfilter and bridge-nf.
> during the "make dep" phase of the compilation, it returns various errors.
> I have patched the kernel with bridge-nf before the compilation.
> my hardwares are : Intel P4 1800 and SOLTECH main board.
> can anyone help me?
> regards,
> afshin
>
Try to compile the kernel a clean kernel, without patching it. Once you have a 
successfull setup, then add one patch at the time. If "make dep", then it is 
usually because you have a problem in your configuration, this can be 
anything.

/Kim


