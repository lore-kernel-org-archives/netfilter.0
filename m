From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Export code for Netfilter/iptables
Date: Tue, 9 Aug 2005 11:55:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508091153590.6879@yvahk01.tjqt.qr>
References: <388032EC32FD7A46AB01D59B3396E058B27BDB@esealmw107.eemea.ericsson.se>
	<5d2f379105080812012bf0884d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f379105080812012bf0884d@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org

>> We are going to use Netfilter/iptables in a product. In order to obtain an export code, I need to document whether these components implement any kind of encryption - so my questions are:
>
>I hope that as part of the process of considering ANY third party code
>in your products, a code review would be done to explore security[...]

And to answer the question: If there was cryptography, then netfilter would 
use the Linux CryptoAPI so we do not have two crypto engines all over the 
place in the kernel.

POMng also has a XOR target - dunno if you can consider this encryption in 
the sense of the US laws.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

