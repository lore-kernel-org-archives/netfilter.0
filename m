From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: Kernel 2.6.18 and quota match
Date: Fri, 22 Sep 2006 17:41:10 +0200
Message-ID: <BAY103-F363870BA17F1FCBAD3E954B2210@phx.gbl>
References: <BAY108-F11F1C98A999C5BD38D2856BC210@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F11F1C98A999C5BD38D2856BC210@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: uncystu@hotmail.com, jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

>>Kernel: 'quota' has been obsoleted by 'statistic'.

No. Quota is quota. nth & random has been obsoleted
by the new statistic match.

>>Userspace: You are out of luck. quota was removed from POM, but its
>>replacement has not appeared in iptables to date.

Support for quota and statistic is in current iptables
snapshot (20060920 for example).



