From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall
Date: Tue, 15 Feb 2005 16:15:46 +0100
Message-ID: <87vf8tq2fx.fsf@helmut.nilsson.homedns.org>
References: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
	<42120B2E.9020802@utilitran.com>
Mime-Version: 1.0
In-Reply-To: <42120B2E.9020802@utilitran.com> (Michael Gale's message of
	"Tue, 15 Feb 2005 07:46:06 -0700")
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
Content-Transfer-Encoding: 7bit
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

Hie,

I would've tried something different if I had the possibility to
choose. This is a solution chosen by the company I work for.

Are you sure about that IPSec can't be NATed? NAT-T is kind of meant to
handle just that. Also, my colleagues have no trouble through
e.g. D-Link routers. The ISAKMP part NATs just fine...

Regards,
/Ola

Michael Gale <michael.gale@utilitran.com> writes:

> Hello,
>
> 	You can not NAT ESP (protocol 50) traffic. Some IPSEC clients
> and servers support NATing but I believe this requires special
> implementation on the client and server end.
>
> If you want to NAT a VPN tunnel I suggest you try a SSL base
> VPN. OpenVPN works well, you could also try TCP or UDP encapsulation
> to help get around the NAT issue.
>
> Michael.

-- 
/Ola Nilsson


