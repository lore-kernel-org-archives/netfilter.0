From: Jason Lunz <lunz@falooley.org>
Subject: Re: REDIRECT changes DST address of the packet
Date: Tue, 5 Jul 2005 15:46:07 +0000 (UTC)
Message-ID: <dae9vv$1so$1@sea.gmane.org>
References: <20050630072934.80040.qmail@web60815.mail.yahoo.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

mesg2nari@yahoo.com said:
>  I am new to this mailing list sorry If I ask any thing wrong.
>
>  My question is if I use REDIRECT action in PREROUTINg rule is it
>  going to change the tcp packet DST address.
>  
>  If I lose original DST address, how can I persist that value in that
>  packet.

I think you're looking for the SO_ORIGINAL_DST sockopt.

Jason


