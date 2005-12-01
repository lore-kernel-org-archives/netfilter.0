From: Nikolai Alexandrov <voyager123bg@gmail.com>
Subject: Re: ipsets for both source and target in one iptables-rule?
Date: Thu, 01 Dec 2005 17:53:25 +0200
Message-ID: <438F1C75.2080003@gmail.com>
References: <OF6D4A24FC.BD8BFC33-ONC12570CA.004AA26A-C12570CA.004D205F@knapp.com>
Reply-To: voyager123bg@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF6D4A24FC.BD8BFC33-ONC12570CA.004AA26A-C12570CA.004D205F@knapp.com>
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
To: Frank.Mayer@knapp-systems.com
Cc: netfilter@lists.netfilter.org



Frank.Mayer@knapp-systems.com wrote:

>Hello,
>
>I'd like to use two ipsets in a single iptables rule similar to
>
>iptables -A FORWARD -p tcp -m tcp --dport ssh -m set --set clients src -m 
>set --set servers dst  -m state --state NEW,ESTABLISHED -j ACCEPT
>iptables -A FORWARD -p tcp -m tcp --sport ssh -m set --set servers src -m 
>set --set clients dst -m state --state ESTABLISHED -j ACCEPT
>
>  
>
Have you tried without -m tcp? I think that -m tcp is wrong here.

>Can anyone tell me if that's just a syntax error or if this is entirely 
>impossible?
>(Kernel 2.4.32, iptables 1.3.4, ipset 2.2.7)
>
>Thanks in Advance,
>Frank Mayer
>UNIX Systemadministration
>----------------------------------------------------
>KNAPP Systemintegration GmbH
>Waltenbachstrasse 9
>8700 Leoben, Austria
>----------------------------------------------------
>Phone: +43 3842 805-921
>Fax: +43 3842 82930-921
>frank.mayer@knapp-systems.com
>www.knapp.com
>
>
>  
>

-- 
Ако не отговарям на писмата Ви - погледнете тук: http://6lyokavitza.org/mail


