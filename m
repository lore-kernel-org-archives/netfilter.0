From: Povilas <csh@unix-like.net>
Subject: Re: about yahoo messenger and http download
Date: Sat, 12 Apr 2003 13:48:14 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E97E0DE.9010808@unix-like.net>
References: <000801c30088$90e25490$9600000a@xpsys>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c30088$90e25490$9600000a@xpsys>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: chammy <chammy@netvigator.com>
Cc: netfilter@lists.netfilter.org

Hello,
chammy wrote:

> Does any one can provide tip & hints, how to block the yahoo messenger 
> and http downlaod, the mainly problem of yahoo messenger is can not 
> block "all block"
>  
> yahoo mesenger default is 5050, if not avaiable will scan 80 , we can 
> not stop 80 cause we need to www service and the http download is same 
> problem
>  
> thanks  a lot

I suppose you can try this::
in your router ( of course if it's possible) you can run proxy server as 
squid. Then you can mane transparent proxy, redirecting transparently 
from 80 port to squid port. Squid understands only http and ftp 
requesrs. Kazaa and others over 80 port won't work. I've tested this and 
it really works.
I don't know, but I think that yahoo messenger will do the same.

Bye,
Paul


