From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Squid Accelerator configuration
Date: Mon, 19 Jul 2004 22:00:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407192200.10863.Antony@Soft-Solutions.co.uk>
References: <OF79696C32.B5892048-ON85256ED6.006F014E-85256ED6.0070F054@banquo.mc.duke.edu >
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF79696C32.B5892048-ON85256ED6.006F014E-85256ED6.0070F054@banquo.mc.duke.edu >
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

On Monday 19 July 2004 9:33 pm, Jim Matthews wrote:

> Antony
>
> Thanks for the reply.
>
> I added port 113 to the "allow" list and when I tried to reconnect to the
> Squid box, those 113 port packets are still being dropped.  Any idea why
> the port 80 packets are being dropped as well?  I think my rules are setup
> correctly, so I'm not sure why they're not being allowed.  I'm attaching
> my rules if someone would like to take a look and see what's happening.

Maybe my earlier explanation was not entirely clear.

The squid *server* is the ident *client* - it initiates the connection to the 
ident server running on the http client.

The rules for TCP port 113 in your ruleset seem to assume the opposite - that 
one machine is both http and ident client, and the other machine is both http 
and ident server.

Regards,

Antony.

-- 
I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


