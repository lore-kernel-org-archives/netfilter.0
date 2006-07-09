From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Changing destination in postrouting
Date: Sun, 09 Jul 2006 10:53:49 +0300
Message-ID: <44B0B60D.7010903@zoomnet.ro>
References: <200607082323.14982.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607082323.14982.antonio.dibacco@aruba.it>
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
To: Antonio Di Bacco <antonio.dibacco@aruba.it>
Cc: netfilter@lists.netfilter.org

Antonio Di Bacco wrote:

>Is it possible to change the destination ip address of a packet after the 
>routing has happened? that is, in the POSTROUTING? 
>
>Thank you,
>Antonio.
>
>  
>
Teoritically, maybe. Practically that would require work on how
ip_conntrack works.

