From: Ruprecht Helms <rhelms@my-mail.ch>
Subject: Re: log analysis
Date: Thu, 27 Oct 2005 09:33:08 +0200
Message-ID: <436082B4.7040303@my-mail.ch>
References: <BOEKIIIKCIBKDMDMHHLLIEBPCPAA.gene@poh.com>
Reply-To: rhelms@my-mail.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BOEKIIIKCIBKDMDMHHLLIEBPCPAA.gene@poh.com>
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
To: Gene Dellinger <gene@poh.com>
Cc: netfilter@lists.netfilter.org

Gene Dellinger wrote:

> How difficult is it to perform Intrusion Detection using iptables, any real
> world stories(good and bad) desired.

Sorry, but good intrusion detection is very different to iptables. 
Iptables only control the connections based on ports. With connection 
tracking you can check if there is made some portscan or someone tried
to send a ping of death to you.

Modifying in the filesystem can not be controled by iptables. That is
task of a good intrusion detection system.

Regards,
Ruprecht

------------------------------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Web:       htp://www.rheyn.de

