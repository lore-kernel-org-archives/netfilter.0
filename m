From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 17:41:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406101741.48713.Antony@Soft-Solutions.co.uk>
References: <7EACCDBB65D37443912D80713CC1245D47282C@fsnsab20.losangeles.af.mil> <200406101700.57718.Antony@Soft-Solutions.co.uk> <0c3201c44f06$c01c6160$49caa8c0@caris.priv>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0c3201c44f06$c01c6160$49caa8c0@caris.priv>
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

On Thursday 10 June 2004 5:19 pm, Peter Marshall wrote:

> > ----- Original Message -----
> > From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> > To: "netfilter" <netfilter@lists.netfilter.org>
> > Sent: Thursday, June 10, 2004 1:00 PM
> > Subject: Re: wireless security
> >
> > The problem Peter has, however, is that there is no single firewall
> > between the wireless people he's trying to keep out, and the wired network
> > he's trying to protect.   The vulnerability lies in client machines which
> > may (inadvertently, deliberately, or unknowingly) be connected to both
> > wired and wireless networks simultaneously.
>
> That was exactly my problem Antony.  Thank you for re-iterating it for me.
> I was not sure if I was very clear after some of the responses.

The reason why I recommended a NIDS (Network Intrusion Detection System) is 
that you can place this as a passive sniffer on the wired network, and see if 
you get any strange traffic coming from client machines.

I accept John Sullivan's point about HIDS (Host Intrusion Detection Systems), 
and that's a good idea (in general) for servers, however I would suggest that 
your other client machines are just as a much in need of protection, and I 
doubt very much that you could find a suitable HIDS to install on those, let 
alone be able to manage them and get useful data about what's going on.

One slightly wacky idea I've had for some time which you might want to think 
about is writing a script to run on a machine on your wired network which 
goes round each of the IP addresses (assigned by DHCP?) of your client 
machines, which might also have a simultaneous wireless link, and attempt a 
traceroute through them as a default gateway.   If you get more than one hop, 
you've got trouble.

Regards,

Antony.

-- 
"I don't mind that he got rich, but I do mind that he peddles himself as the 
ultimate hacker and God's own gift to technology when his track record 
suggests that he wouldn't know a decent design idea or a well-written hunk of 
code if it bit him in the face. He's made his billions selling elaborately 
sugar-coated crap that runs like a pig on [sedatives], crashes at the drop of 
an electron, and has set the computing world back by at least a decade."

 - Eric S Raymond, about Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


