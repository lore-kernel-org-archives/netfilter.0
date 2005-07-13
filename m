From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 12:14:51 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507131212090.14635@yvahk01.tjqt.qr>
References: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>
	<42D4E11C.2080100@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D4E11C.2080100@mnemon.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org


>> iptables -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED,NEW -j
>> ACCEPT 
>> iptables -A OUTPUT -p tcp --dport 21 -m state --state
>> NEW,ESTABLISHED,RELATED -j ACCEPT 

If using passive ftp, the host you are connecting to does not necessarily send 
from port 21.

>Hmm, many people, including myself, think, that filtering in OUTPUT is
>pointless. More troublesome than usefull. If you decide to set OUTPUT
>policy to ACCEPT, you don't need the first two rules. Up to you.

Not at all. Because certains things can not happen in certain environments, 
e.g. I read/write mail by logging into a mail server via SSH / no sendmail 
running, I can exclude certain things. In netfilter parlance:

 -P OUTPUT ACCEPT (same for FORWARD, btw)
 -A OUTPUT -j REJECT -p tcp --dport 25

This stops users that also have access to my machine to not spam smtp servers, 
should they find an open one.


Jan Engelhardt
-- 


