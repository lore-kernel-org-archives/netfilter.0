From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Squid + Tproxy + Bridge on Kernel 2.6.34 - Workaround
Date: Wed, 16 Jun 2010 03:44:53 +0000
Message-ID: <7d220a07303ee00134cb1a11a900c6a5@mail.treenet.co.nz>
References: <4BFCA1D3.3060505@gmail.com> <201006151337.48731.luis.daniel.lucio@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <squid-users-return-100581-gcwsg-squid-users=m.gmane.org@squid-cache.org>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:squid-users@squid-cache.org>
List-Help: <mailto:squid-users-help@squid-cache.org>
List-Unsubscribe: <mailto:squid-users-unsubscribe@squid-cache.org>
List-Subscribe: <mailto:squid-users-subscribe@squid-cache.org>
In-Reply-To: <201006151337.48731.luis.daniel.lucio@gmail.com>
Content-Type: text/plain; charset="utf-8"
To: Luis Daniel Lucio Quiroz <luis.daniel.lucio@gmail.com>
Cc: squid-users@squid-cache.org, netfilter@vger.kernel.org

On Tue, 15 Jun 2010 13:37:48 -0500, Luis Daniel Lucio Quiroz
<luis.daniel.lucio@gmail.com> wrote:
> Le mardi 25 mai 2010 23:21:39, senthilkumaar2021 a Ã©crit :
>> Hi,
>> 
>> Squid + Tproxy + Bridge Setup on latest kernel - version 2.6.34
>> 
>> I had followed all the steps that had given in the
>> http://wiki.squid-cache.org/Features/Tproxy4
>> 
>> Kernel - 2.6.34
>> iptable - 1.4.8
>> ebtable - 2.0.9-1
>> 
>> But clients were unable to browse and no errors in cache.log. Error -
>> Network Unreachable. The error had returned by browser not squid proxy.
>> 
>> Workaround :-
>> 
>> After adding the following rules, clients are able to browse.
>> 
>> # ip rule add dev <device name> fwmark 1 lookup 100
>> 
>> example
>> 
>> # ip rule add dev eth0 fwmark 1 lookup 100
>> 
>> NOTE : Repeat the above for each interface except " lo "
>> 
>> Source -
>> https://lists.balabit.hu/pipermail/tproxy/2010-January/001212.html
>> 
>> Based on the above source this issue had identified on kernel version -
>> 2.6.32. But still not yet fixed.
>> 
>> I have CC ed this mail to netfilter mailing lists also.
>> 
>> Hope this helps
>> 
>> Thanks,
>> Senthil
> 
> I was about to  ask
> if this is fixed in 2.6.33+
> 
> or shall i stay in 2.6.31.x

From the Squid side;
 I have not seen any concrete evidence that this problem was anything more
than a configuration mixup.

This "fix" is to configure routing tables so that packets the bridge stack
sends to the routing stacks (ebtables ... -j DROP) actually get routed to
Squid. Our wiki demo uses 127.0.0.1 and the lo interface, it seems like the
reporter was using a global IP and only had to configure a global
interfaces' routing.

The other two older reporters have been suspiciously silent on the lists
since the same bridge/router interaction was mentioned.

Amos
