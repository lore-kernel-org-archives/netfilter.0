From: Jason Opperisano <opie@817west.com>
Subject: Re: question on sting match option
Date: Mon, 25 Oct 2004 15:41:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041025194107.GA24708@bender.817west.com>
References: <000901c4ba62$1bec7860$69fea8c0@off>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c4ba62$1bec7860$69fea8c0@off>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Oct 25, 2004 at 04:13:20PM +0900, James wrote:
> Untitled Document
>            
>                   Dear netfilter people
> 
>                   I've wanted to use -string match filter so worked with kernel compiling... but finally ended up here.
> 
>                   I've done CVS patch (Patch-O-Matic), but I can't could fine any string match option in menuconfig.
> 
>                   How can I do? 

what kernel version are you patching against?  i ask because AFAIK,
the string patch is 2.4 only.

did you "./runme pending"?

did the string patch apply cleanly?

-j

-- 
Jason Opperisano <opie@817west.com>

