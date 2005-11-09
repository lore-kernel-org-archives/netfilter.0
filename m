From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Performance problems on my firewall using iptables
	(SuSEfirewall2)
Date: Wed, 9 Nov 2005 08:25:13 -0600
Message-ID: <200511090825.13553.rob0@gmx.co.uk>
References: <4371D45F.10103@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4371D45F.10103@skynet.be>
Content-Disposition: inline
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

On Wednesday 2005-November-09 04:50, Marc Green wrote:
> NAT. BTW the result of "iptables -t nat|filter -L" can be sended on

iptables-save(8) would be much better. Without that you are asking for 
wild speculation.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

