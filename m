From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: DNS with iptables
Date: Thu, 11 Dec 2003 11:42:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004a01c3bfd3$88cc9760$0e25fe0a@southpark.ae.poznan.pl>
References: <4D365C260C742A4AABFBF2EE41B7E59F312D8D@itfbsv01.itservices.intern> <200312110959.11243.Antony@Soft-Solutions.co.uk>
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

> > Es geht um Dyndns und damit einem Problem...
> Ja, das ist ein Problem :(
You would have to remove the rule and insert it again, or just reload the
ruleset
everytime you detect the address has changed. It is possible, but
cumbersome.

Regards,
Maciej


