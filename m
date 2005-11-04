From: Jordan Russell <jr-list-2005@quo.to>
Subject: Re: PPTP connection attempts fail with ip_nat_pptp loaded
Date: Thu, 03 Nov 2005 20:45:47 -0600
Message-ID: <dkei0s$5th$1@sea.gmane.org>
References: <dk9kdc$k5j$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dk9kdc$k5j$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

Jordan Russell wrote:
> When ip_nat_pptp is loaded (via "modprobe ip_nat_pptp"), about 9 out of
> every 10 PPTP connection attempts hang and eventually time out.
> 
> I'm connecting from a Windows 2000 machine through a Linux 2.6.14
> NAT/firewall box to a Poptop PPTP server on the Internet.

Follow-up:

Problem solved. It turns out a patch is needed if you have Windows PPTP
clients:

https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=397

Thanks to Philip for bringing this to my attention.

-- 
Jordan Russell


