From: =?UTF-8?B?U2FtdWVsIETDrWF6IEdhcmPDrWE=?= <samueldg@arcoscom.com>
Subject: Re: Where is CONNMARK extension kernel 2.4.32?
Date: Wed, 11 Jan 2006 08:20:04 +0100
Message-ID: <43C4B1A4.3070706@arcoscom.com>
References: <43C0F61F.4030400@arcoscom.com> <43C2A451.1020509@arcoscom.com>
	<43C4003B.9080400@freesco.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43C4003B.9080400@freesco.pl>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mac!eKs <macieks@freesco.pl>
Cc: netfilter@lists.netfilter.org

The last pom-ng tested by me where the 20051231 and I'm sure the 
CONNMARK isn't into it.

Could any netfilter guy re-add these patches into pom-ng for the 2.4 
kernels? Or, better, talk with kernel guys to add them into 2.4 mainline?

What do you think about this propose?

Regards

Mac!eKs escribió:

> Samuel Díaz García napisał(a):
> 
>>> Hi all.
>>>
>>> I have troubles with CONNMARK extensions into kernel 2.4.32.
>>>
>>> The problem I have is that I tried to patch a 2.4.32 kernel with 
>>> pom-ng and I cant see CONNMARK extension into the pom-ng options and 
>>> isn't in kernel config.
>>>
>>> Perhaps could be that any patch I applied before (IMQ, Layer7filter, 
>>> etc...) had broken it. I had compiled kernel, iptables (1.3.4) and 
>>> many pom-ng patches. And when I test some scripts that uses CONNMARK 
>>> without success (chain/tarjet error).
>>> I can view /usr/local/usr/libipt_CONNMARK.so and I suppose that is 
>>> the reason why I can view "iptables -j CONNMARK --help" help text, 
>>> but I can't see any "/lib/modules/2.4.32/....." *CONNMARK* module and 
>>> isn't compiled into the kernel (cat /usr/src/linux/.config | grep 
>>> "CONNMARK") doesn't show me anythink.
>>>
>>> Can anybody help me please?
>>>
>>> Thanks
>>>
> 
> which pom-ng snapshot are you using?
> The last pom-ng snapshot with CONNMARK/TTL/string is from 20050918.
> Then these patches were removed, because they are now in 2.6 kernel 
> serie. But not in 2.4 :/
> 

-- 
    Samuel Díaz García
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

Móvil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

