From: "Volker Augustin" <volker@multiartstudio.de>
Subject: Re: split iptables log from messages
Date: Wed, 21 May 2003 17:51:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c31fb0$e09e1ef0$1405a8c0@ew2>
References: <IHEHKFMEMKMGFDMIAHCIKENEDMAA.borda@netwall.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

there are a lot of possibilities to do so, you can split them from e.g.
/var/log/messages and save them in a new file, or just use the syslog
(i use a mixture of both)
try google for iptables+logfile , thats where i found some very usefull
hints and tools to do so (for syslog and splitting logfiles...)

hope this helps a little bit
volker


----- Original Message -----
From: "Leonardo Borda" <borda@netwall.com.br>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, May 21, 2003 5:18 PM
Subject: split iptables log from messages


> Hello
>
> Does anynone know how to split iptables logs from /var/log/messages ?
>
> thanks,
>
> Leonardo Borda
>
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.481 / Virus Database: 277 - Release Date: 13/5/2003
>
>
>


