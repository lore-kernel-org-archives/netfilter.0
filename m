From: "bino-psn" <bino@indoakses-online.com>
Subject: Re: request and reply/respon packets
Date: Wed, 3 Mar 2004 08:04:19 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <074a01c400bb$755f4a00$0103a8c0@indoaksesbno>
References: <071f01c400b7$63cc3900$0103a8c0@indoaksesbno> <200403030059.40173.Antony@Soft-Solutions.co.uk>
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

Hi Antony,
I think you made a better description .. thx..
And .. How to implement it in side the rule ?
well ... How to let's say MARK any http-ACK coming  via an interface ?

Sincerely
-bino-
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 03, 2004 8:02 AM
Subject: Re: request and reply/respon packets


> On Wednesday 03 March 2004 12:35 am, bino-psn wrote:
>
> > Dear All.
> > Is there any way to know whter a packet is a "request" or "reply/respon"
> > packets ?
>
> I'm not sure if I understand you correctly, but let me make a few
definitions
> of my own, and see if they match yours...
>
> "Requests" come from a client to a server.   "Responses" and the reply
from
> the server to the client.
>
> Requests start with a SYN packet (I'm assuming we're talking about TCP
> connections here?), and responses start with a SYN/ACK packet.
Thereafter,
> all packets have ACK set.
>
> So, you can detect the first packet of a request from the fact that SYN
(only)
> is set, and you can detect the first packet of a response from that fact
that
> SYN and ACK are set.
>
> Does that help answer your question?
>
> Antony.
>
> --
> Perfection in design is achieved not when there is nothing left to add,
but
> rather when there is nothing left to take away.
>
>  - Antoine de Saint-Exupery
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


