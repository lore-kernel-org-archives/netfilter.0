From: Saad Faruque <faruque@gmail.com>
Subject: Re: Redirect to same LAN and preserve source IP
Date: Mon, 19 Jul 2004 12:09:34 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1d7da3f404071823097f8d3503@mail.gmail.com>
References: <200407121419.40110.gdh@acentral.co.uk> <200407121631.56183.Antony@Soft-Solutions.co.uk> <200407130950.44683.gdh@acentral.co.uk> <200407131000.46777.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407131000.46777.Antony@Soft-Solutions.co.uk>
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

http://en.tldp.org/HOWTO/TransparentProxy-6.html
did u go through it ? if not should help i think.

On Tue, 13 Jul 2004 10:00:46 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> 
> On Tuesday 13 July 2004 9:50 am, Gavin Hamill wrote:
> 
> > On Monday 12 July 2004 16:31, Antony Stone wrote:
> > > How about *configuring* the clients so they use the proxy "properly"
> > > instead of doing transparent redirection?   Then you can keep the Squid
> > > box on the same subnet as the clients, and still block people trying to
> > > do TCP port 80 straight through the firewall (only one source IP is
> > > allowed - the Squid box).
> >
> > The reason has been the desire to not have to ferry around dozens of
> > machines configuring proxy settings, really. I'll certainly give the
> > seperate-subnet idea some thought :)
> 
> Have you investigated proxy auto-configuration?   Take a look at the Squid
> documentation and you will learn how most browsers can be pointed at a .pac
> file (possibly by being redirected by your firewall to a trivial webserver
> running somewhere if they try to go direct - doesn't have to be the proxy
> itself), and this will configure the proxy settings without a techie having
> to go near the keyboard....
> 
> Regards,
> 
> Antony.
> 
> --
> The idea that Bill Gates appeared like a knight in shining armour to lead all
> customers out of a mire of technological chaos neatly ignores the fact that
> it was he who, by peddling second-rate technology, led them into it in the
> first place.
> 
>  - Douglas Adams in The Guardian, 25th August 1995
> 
> 
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

