From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: (no subject)
Date: Tue, 21 Nov 2006 11:13:01 +0100
Message-ID: <1164103981.10072.0.camel@tara.firmix.at>
References: <B81183566FF73947875C3A207CD60AA6027C722D@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B81183566FF73947875C3A207CD60AA6027C722D@LONEX01.tideway.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Tim Edwards <t.edwards@tideway.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2006-11-21 at 09:25 +0000, Tim Edwards wrote:
> Hi,
> 
> I don't know if this makes much sense with the way iptables works.
> Anyway I'm trying to instantly stop all outgoing traffic from a machine,
> even from processes that are currently running and may have connections
> active.
> 
> Is this possible with iptables? 

Yes. Just insert such a rule into the OUTPUT chain.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


