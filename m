From: Dmitry Zamaruev <avenger@nixsolutions.com>
Subject: Re: netfilter scan detect
Date: Thu, 12 Jul 2007 17:33:59 +0300
Message-ID: <46963BD7.3050406@nixsolutions.com>
References: <46924d18.05a0660a.252d.16afSMTPIN_ADDED@mx.google.com>
	<46927FE7.8040104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46927FE7.8040104@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Try to use 'stealth' module from GRsecurity patchset.
It will detect stealth scans, but you need patched kernel and iptables.

debian wrote:
> Hello,
>
> i search a solution to detect scan port, i find psd patch, but now 
> with the last version of iptables, psd patch is not supported. An over 
> solution is possible?
>
> Thanks you.
-- 
Best regards,
Dmitry Zamaruev,
Team leader,
System integration dept.,
NIX Solutions Ltd.


