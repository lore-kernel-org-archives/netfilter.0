From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: more than 1 ISP
Date: Wed, 17 Nov 2004 18:04:05 +0100
Message-ID: <419B8485.50000@imag.fr>
References: <20041117115158.GA30794@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041117115158.GA30794@tranquility.scriptkitchen.com>
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

Payal Rathod wrote:
> Hi,
> My ISP gives me a speed of 48kbps maximum (actually 64kbps is promised
> but it never goes about 48). For a month or 2 we are taking one more connection
> of 48kbps from another ISP (actually a nearby company) for uploading data to
> our client's computer.
> Can I terminate it in my Linux box (which is the gateway) and for few of my windows
> clients make that IP my default gateway or is lartc needed here?
> I don't mind if even FTP protocol passes through the other link and the first
> one is used for browsing and mails.
> I need a simple solution to this and lartc was becoming too complex.
> 
> Any ideas anyone?
> With warm regards,
> -Payal
> 

sure, that's called multihosting. it's doable, all you need is to make 
your internal DHCP server hand out the appropriate default gateway 
address fro each machine

