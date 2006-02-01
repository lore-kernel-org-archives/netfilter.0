From: Robb Bossley <robb.bossley@gmail.com>
Subject: Re: Filtered Port
Date: Wed, 1 Feb 2006 09:58:01 -0500
Message-ID: <5c6851530602010658l6d639245k585bee323b09e886@mail.gmail.com>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
	<61929.193.173.147.3.1138716397.squirrel@webmail.sterenborg.info>
	<43DF7196.6070606@mail.bloomfield.k12.mo.us>
	<58058.193.173.147.3.1138718408.squirrel@webmail.sterenborg.info>
	<43DF7CF1.4060607@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF7CF1.4060607@mail.bloomfield.k12.mo.us>
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
To: sgmayo@mail.bloomfield.k12.mo.us
Cc: netfilter@lists.netfilter.org

Scott,

Instead of toying with your firewall rules and opening up ports, if
you are the only one using this, try an ssh tunnel.  "ssh -L
3389:<destinationaddress>:3389 <yourrouteraddress>"

Then just remote desktop to localhost:3389.  It is encrypted and
solves the issue of opening up a hole in the firewall.

Robb

On 1/31/06, Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us> wrote:
> Rob Sterenborg wrote:
> > On Tue, January 31, 2006 15:17, Scott Mayo wrote:
> >
> >>Rob Sterenborg wrote:
> >>
> >>>On Tue, January 31, 2006 14:55, Scott Mayo wrote:
> >>>
> >>>
> >>>>I am not sure if this is my iptables or not, but I am not sure where
> >>>>else to look or ask.  I am trying to use Remote Desktop on a
> >>>>computer.  From inside my network, it works fine, but once I get
> >>>>outside, I cannot use it.  I have set my IPTABLES to forward
> >>>>anything
> >>>>going to port 3389 to the computer that is using Remote Desktop.
> >>>>
> >>>>The problems seems to be that port 3389 is filtered.  I can find
> >>>>nothing in my iptables where I have this port filtered.  Are there
> >>>>some generic ports, that IPTABLES filters on it own or something?
> >>>>If
> >>>>the IPTABLES are not filtering it, what else could be?
> >>>
> >>>
> >>>You allow forwarding to this host but you also need to DNAT these
> >>>packets from the internet IP to the IP of your computer.
> >>>
> >>>$ipt -t nat -A PREROUTING -i <if_inet> -d <ip_inet> \
> >>>  -p tcp --dport 3389 -j DNAT --to <ip_controlled_host>
> >>>
> >>Maybe I used the wrong word when I said 'forward'.  This is the rule
> >>that I have in place and it does not seem to be working.  I assumed
> >>that it was because the port is filtered, or that is what NMAP tells
> >>me when I run it.
> >>
> >>I still have no idea why port 3389 is shown as being filtered.  I
> >>have no rules in my iptables that explicitly filter it.
> >
> >
> > In that case you may want to allow forwarding ;-)..
> >
> > $ipt -A FORWARD -i <if_inet> -o <if_lan> -d <ip_controlled_host> \
> >   -p tcp --dport 3389 -j ACCEPT
> >
>
> This did not let it go through either.  It must not be the iptables
> causing it.  I took everything out of my rules except for the PREROUTING
> rule above and my POSTROUTING rule for SNAT and I am getting the same thi=
ng.
>
> I am not sure what else would be blocking this, unless it is the
> upstream ISP.  I don't think it is, but I have sent them an email to
> make sure.  Only thing this machine is used for is to be a filter using
> IPTABLES, Squid and Dansguardian.
>
> Hopefully it has something to do with my ISP, but I really doubt it.
>
> Thanks for the help.
>
> --
> Scott Mayo
> Technology Coordinator
> Bloomfield Schools
> PH: 573-568-5669
> FA: 573-568-4565
> Pager: 800-264-2535 X2549
>
> Duct tape is like the force, it has a light side and a dark side and it
> holds the universe together.
>
>

