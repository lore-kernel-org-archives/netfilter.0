From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bandwidth measurement
Date: Tue, 15 Oct 2002 19:47:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021015184737.SPRN27697.mta05-svc.ntlworld.com@there>
References: <3DAC5F71.4040901@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DAC5F71.4040901@bol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 15 October 2002 7:33 pm, Julio Cesar Ody wrote:

> Hello. I would like to know if it's possible to measure the bandwidth
> usage of each computer (fixed ip numbers) with iptables. Thanks.

You can measure the number of packets and bytes sent to or from specific IP 
addresses if you want.   Measure the number of bytes over a known period of 
time and you can work out the bandwidth.

Try something like:

iptables -A FORWARD -s a.b.c.d
iptables -A FORWARD -d a.b.c.d

iptables -L FORWARD -n -v -x

Yes, those rules have no "-j TARGET" at the end.   This is correct.

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

