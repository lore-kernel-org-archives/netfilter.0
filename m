From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Caching of rules in PRE(POST)ROUTING chains?
Date: Mon, 17 Nov 2003 09:24:42 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311170924.hAH9Oij21915@agate.rockstone.co.uk>
References: <1072098477.20031115110735@msmu.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072098477.20031115110735@msmu.eu.org>
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

On Saturday 15 November 2003 8:07 am, Pavel V. Yanchenko wrote:

> Hello.
>
> As far as I understand, rules in PRE- and POSTROUTING chains are
> cached? Because when I delete a rule with SNAT target for ip
> 192.168.10.10 this address's packets are still SNATed for several
> minutes. The same thing happens for rules in PREROUTING chains.
> Is it possible to disable this feature? Maybe there is some file in
> /proc where cached rules are listed?

No, there is no caching of rules in netfilter; however, packets which are 
part of an ESTABLISHED connection will continue to be processed without 
reference to the rules in PRE/POSTROUTING because of the connection tracking 
table entry - onlt the first packets of connections ever go through the 
explicit rules in these tables - all following packets are automagically 
processed behind the scenes.

This is the effect you are seeing, I'm sure.

Antony.

-- 

Christianity tells you to work hard today for little or no reward, and 
tomorrow you will die and awake in paradise.

Marxism says work hard today for little or no reward; tomorrow you will die 
and your children will awake in paradise.

 - Len Deighton, Billion Dollar Brain
                                                     Please reply to the list;
                                                           please don't CC me.

