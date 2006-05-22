From: Sebastien Tricaud <sebastien.tricaud@wengo.fr>
Subject: Re: error compiling nfqnl_test.c
Date: Mon, 22 May 2006 16:06:11 +0200
Message-ID: <4471C553.8000005@wengo.fr>
References: <200605211515.30934.frankabel@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605211515.30934.frankabel@tesla.cujae.edu.cu>
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
To: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>
Cc: netfilter@lists.netfilter.org

Frank Abel Cancio Bello wrote:
> Hi all!
>
> A newbie question:
> When I try to compile "nfqnl_test.c" putting on command line:
>
> "gcc -Wall -o nfqnl_test nfqnl_test.c"
>
> the following error occur:
>   
[snip errors]

you forgot to include required library symbols:

gcc -Wall -o nfqnl_test nfqnl_test.c -lnfnetlink -lnetfilter_queue

will do




