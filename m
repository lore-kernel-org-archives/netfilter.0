From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Modem to Ethernet Bridge
Date: Thu, 5 Sep 2002 18:32:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051732.g85HWJv01116@vulcan.rissington.net>
References: <F37GuSKqGABtvNLepTy000017d8@hotmail.com> <200209051541.g85Ff5v00844@vulcan.rissington.net> <20020905172409.GI7289@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020905172409.GI7289@cannon.eng.us.uu.net>
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

On Thursday 05 September 2002 6:24 pm, Ramin Alidousti wrote:

> On Thu, Sep 05, 2002 at 04:40:59PM +0100, Antony Stone wrote:
> > On Thursday 05 September 2002 4:30 pm, Ramin Alidousti wrote:
> > > I don't see why a natted solution is required here.
> >
> > I agree that a NATted solution is not *required*, however I think it
> > should work and is therefore an effective solution to the problem.  
> > Depending on the routing issues on other machines, it might well be the
> > simplest solution, involving changes on only one machine.
>
> So you mean, when he _can_ ping and _cannot_, eg, ftp; then an effective
> solution to the problem is to nat????  Explain why.

Re-reading the original posting from Scott I now realise that he only wants 
the dial-up client to have access to his LAN machines - I had originally 
mistakenly read it that he wanted the remote client to have the same access 
(to anything) as his existing LAN machines.

I agree that so long as all his LAN systems know to route 192.168.1.2 via 
192.168.0.25 then he does not need NAT.

Obviously if he can ping and he can't ftp (between the same two machines) 
then NAT will not solve it, however his routing must be set up correctly as 
well, and therefore the protocol difficulty is almost certainly down to 
something in his firewall rules.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

