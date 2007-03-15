From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: bytes count question
Date: Thu, 15 Mar 2007 20:11:58 +0100
Message-ID: <45F99A7E.607@unipex.it>
References: <45F95EA9.3030201@unipex.it>
	<02BB8A4AC86C564C89C7F14CF98CE0C49CBF@knowledge.wizdom.nu>
	<02BB8A4AC86C564C89C7F14CF98CE0C49CC0@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49CC0@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Sietse van Zanen wrote:
> Uh, no I think I may be wrong here. That might only count for NAT 
> packets.
> 
> The 600.000 bytes might be due to compression. How did you download
> the file?
> 

Just discovered that that was the right values, but of the upload! :)
I was wrong because now, with the right "download" rule (so a rule that
see the traffic "to" and not from the test machine)!

> -Sietse

Thanks,
Michele

