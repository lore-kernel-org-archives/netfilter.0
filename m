From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Delay
Date: Tue, 8 Oct 2002 16:08:23 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210081607470.14539-100000@dns.toxicfilms.tv>
References: <3da2defc.52d0.0@ieg.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3da2defc.52d0.0@ieg.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jose Rocha <kleros@ieg.com.br>
Cc: netfilter@lists.netfilter.org

> Does anybody know if I can introduce delay to all packets that come from one
> IP??? For example, I want to intruduce 10ms of delay in all packets that come
> from one IP. May I use the netfilter to do this? Does anyone have another idea??
Read about IMQ in Linux Advanced Routing and Traffic Control (lartc)

Regards,
Maciej Soltysiak



