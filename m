From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: ACK lost after SYN,SYN/ACK when DNATting to do transparent Squid proxy
Date: Wed, 19 Jun 2002 09:31:45 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020619133145.GG26150@cannon.eng.us.uu.net>
References: <20020619115823.F26409@cscoms.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020619115823.F26409@cscoms.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alain Fauconnet <alain@cscoms.net>
Cc: netfilter@lists.samba.org

On Wed, Jun 19, 2002 at 11:58:24AM +0700, Alain Fauconnet wrote:

> Hello -
> 
> I have a strange problem that has been bugging me for a long time.
> I do transparent redirection to a separate Squid  box  from  a  2.4.18
> kernel box using Netfilter, over a private LAN (10.254.254.0/24).
> Something like:
> 
> iptables -t nat -A PREROUTING -i ppp+ -p  tcp -s 172.16.1.0/24 \
>  --dport 80 -j DNAT --to 10.254.254.2:3128
> 
> Sometimes several times per hour, I observe that  ALL  connections  to
> 10.254.254.2:3128 just hang for 30s to 3min,  even  when  I  originate
> them  from  the  Netfilter  box  itself  using telnet. Everything then
> resumes normally. This is a major annoyance to the people behind these
> boxes. Protocol analysis revealed the following:
> 
> Netfilter box      Squid box
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ----------- SYN --------->
> <-------- SYN/ACK -------
> . . . . . . ACK . . . . .> MISSING!

What is the complete ruleset?

Ramin

> 
> So  the problem is on the Netfilter box side, it never sends the final
> ACK to the 3-way handshake.

