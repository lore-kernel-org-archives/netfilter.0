From: Martijn Lievaart <m@rtij.nl>
Subject: Re: REDIRECT to different interfaces.
Date: Sun, 14 May 2006 20:43:23 +0200
Message-ID: <44677A4B.2020608@rtij.nl>
References: <OAEGKDKHMAKDDLCDGICBKENDCAAA.sprescott58@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OAEGKDKHMAKDDLCDGICBKENDCAAA.sprescott58@comcast.net>
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
To: Stan Prescott <sprescott58@comcast.net>
Cc: netfilter@lists.netfilter.org

Stan Prescott wrote:

>So far everything I have tried has failed. It will not REDIRECT port 80 to
>800 or port 80 to 8080 on a specific interface. It only seems to work for
>source of anywhere and destination of anywhere.
>
>Would someone be able to show me how to REDIRECT to a specific port AND
>interface?
>
>  
>

REDIRECT works only on the local machine. Use DNAT instead.

HTH,
M4

