From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewalling non-IPsec connections
Date: Tue, 16 Dec 2003 15:12:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312161512.24688.Antony@Soft-Solutions.co.uk>
References: <GFEPJIHHFOJDOFDMNAJDCEPFEJAA.mark@npsl.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GFEPJIHHFOJDOFDMNAJDCEPFEJAA.mark@npsl.co.uk>
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

On Tuesday 16 December 2003 2:45 pm, Mark Weaver wrote:

> > > The in-kernel ipsec does not have an ipsec0 virtual interface, that is
> > > where the problem come from - I don't see a way yet to destinguish
> > > decapsulated ipsec traffic from eth0 to eth1 from raw traffic
> > > between the two interfaces.
> >
> > Ah.   I have yet to play with the features of 2.6 kernels,
> > therefore I didn't
> > realise that this version of IPsec has such a drawback compared
> > to FreeS/WAN.
>
> I solved this using firewall marks.  Essentially, packets that come in via
> IPSEC and then get untunelled retain the fwmark, so you can do something
> like:
>
> iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 1
> iptables -A INPUT -m mark --mark 1 -j ACCEPT

I'm intrigued by this.   If the packets are encrypted with ESP as they go 
through PREROUTING, but you need to MARK them in order to recognise which 
ones they are by the time they hit the INPUT chain, at what point does the 
decryption occur?   Does it mysteriously happen somewhere between the 
PREROUTING and INPUT chains?   (If it does, I can see an awful lot more 
puzzled newbies asking questions here once 2.6 takes off....)

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


