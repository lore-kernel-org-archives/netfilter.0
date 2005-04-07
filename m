From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Ebtables & iptables!!
Date: Thu, 7 Apr 2005 10:08:23 +0200
Message-ID: <1403218a050407010864040939@mail.gmail.com>
References: <9927912d050406234959cd97fe@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050406234959cd97fe@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Visham Ramsurrun <vishamr2000@gmail.com>, netfilter <netfilter@lists.netfilter.org>

You want a normal firewall, so why do you want to use ebtables ??


On Apr 7, 2005 8:49 AM, Visham Ramsurrun <vishamr2000@gmail.com> wrote:
> Hi to all,
> 
> I wanted to know abt the following:
> 
> 1) do we always have to set up ebtables as a bridge or bridge router
> to be able to use ebtables commands. Is it possible to have only a
> normal firewall using ebtables (just like with iptables). It's just
> that almost all examples I've come across talk abt building only
> bridges, bridgefirewalls or bridge routers. I just need a confirmation
> of this.
> 
> 2) Also, I want to make the packets move from the link layer right
> after ebtables NAT PREROUTING to iptables. I have not set up my PC as
> a bridge or bridge router.. I just want to set up a normal firewall
> that makes use of both ebtables and iptables.
> 
> How do i go about it? do i use br-nf code?Does anyone have a sample
> script using br-nf code? If yes, pls send it to me.
> 
> Thx in advance..
> 
> Best regards,
> Visham Ramsurrun
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

