From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipfilter vs. netfilter keepalive
Date: Sat, 31 Jan 2004 08:52:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401310852.12573.Antony@Soft-Solutions.co.uk>
References: <200401302349.i0UNn7u19236@neo1.neolabs.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401302349.i0UNn7u19236@neo1.neolabs.be>
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

On Friday 30 January 2004 10:49 pm, jo@neolabs.be wrote:

> I guess the remote ssh-server is sending keepalive packets, and somehow
> the ipfilter understands that those packets must be passed to the
> intranet, eventhough they are OOB to the outgoing TCP connection.
> Netfilter does not seem to understand this.
>
> Is this assumption correct? If so, does netfilter have a tuning so it
> keep ssh connections alive or do I advise to switch back to ipfilter?

Add a LOG rule to your ruleset just before the default DROP policy kicks in 
(if you want, you can be selective and only LOG packets coming from one of 
the ssh servers people are connecting to) and see whether you are getting 
packets of some sort back from the servers, which are out of band and 
therefore not getting to the clients.

In my opinion this is unlilkely - any keepalive packets for an ssh connection 
would be sent across the ssh link itself, not out of band in some other 
channel, however this is an easy way in whcih you can identify whether this 
is what's happening.

Put the LOG rule in both your INPUT and FORWARD chains so you catch stuff 
trying to get to the clients' addresses as well as anything coming in to the 
firewall itself.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


