From: piraguasu <grtruchet@gigared.com>
Subject: Re: Iptables, squid
Date: Mon, 27 Nov 2006 11:51:14 +0100
Message-ID: <456AC322.1070003@gigared.com>
References: <c31bf6690611270048w653eed56m375636d92e98c3ab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c31bf6690611270048w653eed56m375636d92e98c3ab@mail.gmail.com>
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

Hi alok pathak

I think you can use iproute2 suite and iptables, but you should read
documentations about iproute2, you can set up rules and routes to
control traffic with them and iptables, also have "tc" which is a
traffic-control tool from iproute2.

Find http://www.lartc.org/lartc.html by Bert Hubert and then chat on it.

I hope you understand me and find utility in this e-mail

Gerardo
> Hi all,
>
> The problem with me:
> 1. I want my users to access the internet(but bandwith must be limited
> to each of them say 64kbps).
> 2. I configured delay pools in squid for this.
> 3. I also don't want to specify proxy settings on each users computer.
> 4. I also want to let my users use Yahoo WebCam, Bittorrent clients
> etc, but without proxy settings.
> 5. I configured transparent proxy, but able to impose bandwidth limit
> on http traffic only (port 80)
> Can I use something other than squid?
> Please help.
> Thanks,
> Alok Pathak
>
>


