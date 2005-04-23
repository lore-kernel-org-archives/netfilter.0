From: Eric Meris Vieira <emerisv@yahoo.com.br>
Subject: Re: block all trafic from input
Date: Sat, 23 Apr 2005 08:56:03 -0300
Message-ID: <426A37D3.7010402@yahoo.com.br>
References: <a3f524e05042303241434a0fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a3f524e05042303241434a0fd@mail.gmail.com>
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
To: Kashif Ali Bukhari <kbukhari@gmail.com>
Cc: netfilter@lists.netfilter.org

Kashif Ali Bukhari wrote:

>how can i block all inbond access to my linux box
>
>
>  
>
Try this...

iptables -P INPUT DROP





