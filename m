From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS/NTP servers
Date: Sun, 2 May 2004 00:17:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405020017.16365.Antony@Soft-Solutions.co.uk>
References: <409310DE.2020004@isoar.ca> <200405012207.14866.Antony@Soft-Solutions.co.uk> <409419CE.5080800@isoar.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409419CE.5080800@isoar.ca>
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

On Saturday 01 May 2004 10:42 pm, Andrew E. Mileski wrote:

> Antony Stone wrote:
> >
> > I remain confused from your description as to whether you are talking
> > about the machine running the netfilter rules being an NTP server
> > (servicing requests from other clients), or an NTP client (sending
> > requests to other servers).
>
> The machine running the netfilter rules is an NTP and DNS server
> (servicing requests from other clients), _and_ a NTP and DNS client
> (sending requests to other servers).
>
> Hence my solutions (both tested) of an explicit rule to either:
>   A) Force all private hosts to use the DNS/NTP servers on the gateway.

This sounds like a very good idea, for both protocols, since:

a) if you have a caching DNS server on your network, you may as well make 
maximum use of it, instead of sending requests out to the Internet direct 
from individual clients

b) if you have an NTP server on your network, it is more important that all 
your local machines are synchronised to it than that some of them are 
correct, but different from others.

Therefore I think pointing all local clients at the DNS / NTP servers on the 
gateway, and then pointing the single DNS / NTP clients running on the 
gateway to the outside world, is the correct solution.

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


