From: Martijn Lievaart <m@rtij.nl>
Subject: Re: block nmap info
Date: Sun, 06 Feb 2005 00:44:15 +0100
Message-ID: <42055A4F.3040904@rtij.nl>
References: <20050127200622.GA23921@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050127200622.GA23921@omega.lacnic.net.uy>
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
To: Pablo Allietti <pablo@lacnic.net>
Cc: netfilter@lists.netfilter.org

Pablo Allietti wrote:

>hi all (again), how can i made a rules for block nmap information?
>
>if i do nmap -sT myhost.com from a cybercafe for example,   nmap display
>all ports open. exist any way to block this? something like block
>scanports?
>  
>

Lookup the psd module in patch-o-matic, it does exactly what you are 
looking for.

M4


