From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: ftp connection tracking on multiple ports
Date: Thu, 28 Oct 2004 13:10:49 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04102804107389b75e@mail.gmail.com>
References: <BC372EA70AC7724B9DE983CBA6D1D7E5126E37@ws03-exchange.iconos.be>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BC372EA70AC7724B9DE983CBA6D1D7E5126E37@ws03-exchange.iconos.be>
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
To: Sneppe Filip <filip.sneppe@uptime.be>, netfilter <netfilter@lists.netfilter.org>

I don't use natting, do I still need that helper ???


On Thu, 28 Oct 2004 12:40:37 +0200, Sneppe Filip <filip.sneppe@uptime.be> wrote:
> Mohamed Eldesoky wrote:
> 
> >I do
> >But it doesn't work when doing ftp host 45 then do ls
> >it hangs there !!
> 
> Hi,
> 
> Don't forget you also need to add the ports for the nat helper:
> 
> modprobe ip_nat_ftp ports=21,45
> 
> (If ip_nat_ftp is already loaded, you need to rmmod the module first
> and then load it again - same thing with ip_conntrack_ftp if you change
> a kernel module parameter)
> 
> Regards,
> Filip
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

