From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 11:27:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241127.25946.Antony@Soft-Solutions.co.uk>
References: <01be01c4710c$440a79e0$5100a8c0@egp> <200407240856.03201.Antony@Soft-Solutions.co.uk> <1090664200.2012.21.camel@grendel>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090664200.2012.21.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

On Saturday 24 July 2004 11:16 am, Chris Brenton wrote:

> On Sat, 2004-07-24 at 03:56, Antony Stone wrote:
> > I understand it to mean "check what would happen to a packet of this type
> > if it went through the ruleset"
>
> Yup, that's what it did under ipchains. :)
>
> > > What is "packet payload"? How does it make the "--check" option
> > > impossible to be implemented?
> >
> > It makes it impossible to implement --check because there's no way to
> > provide the payload on the command line.
>
> Not quite true as you would just use a sting match, same as you would in
> a filtering rule.

I'll assume you meant the "string" match :)   Although the idea of a sting 
match in a firewall rule is an interesting one....

I agree that for textual content you could say "a packet from this IP address 
to TCP port 23 containing the string 'root'", however lots of protocols use 
binary data (eg: ssh which encrypts the datastream, and http which commonly 
gzips it), and this would be hard to represent in a command-line request.

However, as discussed by other people, there is more than one reason why 
"check" is hard to implement, payload is just one of them (and I agree that 
state is a more significant problem, and much harder to deal with).

I don't believe it'll be implemented either.

Regards,

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


