From: netfilter-maillist <vlad@fakt.tazovsky.ru>
Subject: Re-re Modules "time"
Date: Wed, 19 Mar 2003 09:08:35 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12986944437.20030319090835@fakt.tazovsky.ru>
Reply-To: netfilter-maillist <vlad@fakt.tazovsky.ru>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello, netfilter.

>iptables -I INPUT 1 -p tcp -s 192.168.1.2/32 -m time --timestart \
>11:00 --timestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
>-d 192.168.1.1/32 --j DROP
>Defaul policy in INPUT chain - DROP
>But... packets allows to 192.168.1.240 (server) in this
>time --> 11:00-17:00.
>>
>>If you use SNAT (masquerade) then it may be bypassing the input chain
>>because of a prerouting rule ...
>>

Why then in general operates the rule?
If there is SNAT, that what build the rules with module "time"?
The Rule operates, but can not understand, as it considers time.

-- 
With best wishes,
 netfilter-maillist                          mailto:vlad@fakt.tazovsky.ru


