From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP Rule Problem
Date: Tue, 3 Feb 2004 09:17:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402030917.34126.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Monday 02 February 2004 5:02 pm, David C. Hart wrote:

> Should this not reject echo requests?
>
> -A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
> icmp-net-prohibited
>
> It doesn't seem to work.

Never mind that, you're not allowed to respond to ICMP packets with ICMP
errors.

See RFC792 page 1.

Regards,

Antony.

--
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


