From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Logging source mac address
Date: Sun, 3 Oct 2004 01:26:23 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410030126.23983.Alistair@nerdnet.ca>
References: <414B19D30064B70D@vsmtp12.tin.it> (added by postmaster@virgilio.it)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <414B19D30064B70D@vsmtp12.tin.it>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On October 2, 2004 05:24 pm, mlist@libero.it wrote:
> Hi
>
> I installed Fedora core 2 and configured iptables with Guarddog and all
> works correctly (I know to configure iptables manually is better but I need
> to study it before manually write a configuration file).
> My problem is that I need to know if is possible or not always logging
> source mac address. With guarddog I tried all log levels ("debug", "alert",
> "critical") but the problem is that mac address is not always registered.
> Is there a way to log in all conditions (not only with drop or reject) the
> source mac address???
>
	You do realize that you can only see the MAC address if you happen to be 
connected to the same network segment -- okay make that physical connection 
-- as the other end of the connection?  (there are instances of bridged 
networks where you won't see mac from other end even on the same segment)

	You will NOT be able to see the MAC address of the other end of a connection 
if it has been routed.   Although you might see a MAC address in say 
ethereal, it will be the MAC address of the other end of that physical hop -- 
i.e. the next router in the link.

	( I think I said that straight --- but I'm kinda sleepy)

	Alistair Tonner

> Thanks a lot
> Marco
> Italy
>
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.771 / Virus Database: 518 - Release Date: 28/09/2004

