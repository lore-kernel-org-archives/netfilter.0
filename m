From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Log with log amount
Date: Thu, 28 Oct 2004 13:39:11 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e50410280339657ae14b@mail.gmail.com>
References: <02b201c4bcd8$b5dd17e0$3a00200a@ThaiAn>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02b201c4bcd8$b5dd17e0$3a00200a@ThaiAn>
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

Hi,

I am not sure, but i think the ULOG target can do this with
--ulog-cprange parameter. I may be wrong, i never tested ULOG. Fot
ULOG you need a deamon called ulogd.


On Thu, 28 Oct 2004 17:27:17 +0700, thaian <thaian@6wind.com> wrote:
> Hi All
> 
> In FreeBSD, ipfw uitiliy can log with amount of packet:
>         ipfw add 1200 deny log tcp from any to any log-amount 100
> 
> But with netfilter, I do not see any option for setting amount of packet I want to  log
>         iptables -A INPUT -j LOG ...................????
> 
> Thai An
> 
> 


-- 
Bla bla

