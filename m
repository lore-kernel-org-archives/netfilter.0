From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I have no idea why this doesn't work...(further details)
Date: Fri, 23 Apr 2004 15:57:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404231557.09200.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040422115305.02ae04e0@mail.garisonpiatt.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040422115305.02ae04e0@mail.garisonpiatt.com>
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

On Thursday 22 April 2004 10:53 pm, Garison Piatt wrote:

> At 09:57 PM 4/22/04 +0100, Antony Stone wrote:
> >
> >1. I assume the server is not the same machine running netfilter?   (ie:
> > you are trying to set up a routing firewall, not create rules on a
> > machine to protect itself?)
>
> No, just the opposite: one machine, trying to protect itself.  Multiple web
> sites on the machine.  Sorry I wasn't clear.

Okay, in that case you need your rules in the INPUT chain, not the FORWARD 
chain, but otherwise things will be pretty similar.

> >2. "One web site client"?   I don't understand.   Surely the server is
> >accessible to the entire Internet (although maybe not...)?
>
> Perhaps I should have said, "one client web site".

Okay, thanks, yes, now I understand.

> The server was set up because the ISP won't drop certain email
> restrictions, even though my client brings them *a lot* of business.  (Most
> of her customers want to send voluminous newsletters, but the ISP has a
> limit of 99 emails per hour.)

So?   Just set yourself up a mail server somewhere else...

> The eventual intent is to host all of her
> customers (12-15) on one web server.

Sounds highly feasible, depending on bandwidth requirements, of course.

> Currently (by the end of this month),
> we have one customer to move over to this new server.  Within the next two
> months, that should go up to 8.  That's the target arrangement: up to 15
> (and maybe more) web sites hosted on one server, with a single firewall
> protecting all of them.

You mean, "with netfilter running on the same machine"?   If you say "a 
firewall protecting them", I think of a machine which is a firewall providing 
protection for other machine/s which are web servers.

Hence my previous confusion about whether we were talking about one machine or 
two here.

> > Support from whom (where)?   All we're asking is basic network
> > configuration stuff - not technical assistance in getting something
> > working.
>
>  From the ISP; they've given out a limited amount of information --
> basically, just the IP number.  They expect that all user maintenance will
> be done from the command console they provide -- which, they say, does a
> great job of creating and maintaining web sites -- but it doesn't do diddly
> about security.  We're supposed to handle that on our own, by hand.

I still say find another ISP.

> >Okay, where are you (in network terms, compared to the firewall and server
> >we're talking about), where is she, and where does the web traffic come
> > from?
>
> Not sure what you're asking here.  Everything is outside of the server --
> me, her, all web visitors, hackers, etc.

Okay, that's the answer I needed.   I wasn't sure whether you had different 
access to the server from the general Internet, or what.

> I'm on a cable customer (non-dedicated) line, which I believe means that my
> IP changes every time I log in.

In that case there's no way you can set up Telnet securely for you and only 
you to be able to use it.   Go for SSH, and use public-key exchange instead 
of passwords, as soon as you've figured out how to do that (it's not hard).

> >Telnet is not a recommended protocol - everything is sent in clear text -
> > is there any good reason why you are not using ssh?
>
> Didn't know about it.  I just downloaded PuTTY.

Does that, um, gulp, imply that you're using Windows !?

> With all the things I don't know, this one I definitely do: we *do* want
> remote access to the firewall.

Okay, here's a revised version of the rules I previously posted, to take 
account of the fact that there's only one machine:

# Set default drop polcy on all tables
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow replies out for anything which comes in
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow the machine to do its own DNS lookups
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
# Allow replies in for anything which goes out (eg DNS)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow the world to access by HTTP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
# Allow the world to access by FTP (you *did* want that, yes?)
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
# Allow the world to access by SSH (would be nicer to restrict by IP addres, 
but we can't, so....)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

PS: If you haven't already, I recommend you read Oskar Andreasson's netfilter 
tutorial at http://iptables-tutorial.frozentux.net

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


