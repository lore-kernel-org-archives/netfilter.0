From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables --owner-uid
Date: Sun, 15 Sep 2002 12:00:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020915110012.OKLT14766.mta05-svc.ntlworld.com@there>
References: <39778BFB9C25BA429794B15B50AEC781045424@server-dcms> <20020914141419.GC24368@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020914141419.GC24368@Ajftl1.ajfthome.on.ca>
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

On Saturday 14 September 2002 3:14 pm, Alistair Tonner wrote:

> What I'm reading is that the process generating the packets
> 	(for owner match to work) has to be a process running on the
> 	box on which iptables firewall is running.  If the packets are
> 	coming through the forward chain (i.e. from downstream pc's)
> 	there is no way of matching UID (owner) as there is no owning
> 	process generating the packet.

That is correct.

>  	You might be better off matching
> 	MAC addresses in this case ...

I don't see why that is any better than matching IP address ?   Surely 
there's going to be a one-to-one correspondence between MAC address and IP 
address for the Windows clients, so you cannotdo anymore in netfilter with 
one than with the other....

The interesting part is to workout whether Samba (which is running on the 
netfilter machine) can tie up user ID with IP address, and then add/remove 
netfilter rules by running a script when the user logs in/out.

Antony.

> On 2002.09.14 07:53 Didier Hung Wan Luk wrote:
> > I may be wrong but I am in confusion here..
> > If I am using Samba as a PDC and all my win clients are members of the
> > samba domain... are they not using the uid given by Samba? Which is
> > itself mapped to a unix user (id) then if this is the case it should
> > work is it not..??

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

