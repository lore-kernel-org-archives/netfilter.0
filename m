From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: droping too many ports
Date: Thu, 23 Sep 2004 21:51:13 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409232151.13935.gdh@acentral.co.uk>
References: <a0f69e504092313454a9090b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504092313454a9090b3@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 23 September 2004 21:45, Askar wrote:
> hi all
>
> what if I do (and im doing this from last two hours ;))
>
> iptables -A FORWARD -p tcp --dport 31000:65500 -j DROP
> iptables -A FORWARD -p udp --dport 31000:65500 -j DROP
>
> yes I am Droping too many ports at once, (actually its default ACCEPT
> machine), 

I think you answered your own question - why not make the default policy DROP, 
and then just permit the services you want?

gdh

