From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Mon, 24 Jun 2002 15:42:05 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624190414.A63126813B@engenho.terra.com.br>
References: <3D0BBC45.5000807@palaver.net>
	<20020618202115.32CD7C94DF@srv11-sao.terra.com.br>
	<20020618225058.GC27054@cannon.eng.us.uu.net>
	<200206200948.g5K9m7U31874@vulcan.rissington.net>
	<20020620193615.40DDAC87AF@srv9-sao.terra.com.br>
	<20020621001943.GA2453@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020621001943.GA2453@cannon.eng.us.uu.net>
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
To: netfilter@lists.samba.org

|On Thu, 20 Jun 2002 20:19:43 -0400
|Ramin Alidousti <ramin@cannon.eng.us.uu.net> wrote
| about Re: Completely NAT an ISP: A practical possibility?:

> Do you guys do DNAT too? I mean do you let the costomers run services?

Nope. Only SNAT is used to route the client pool (with the same media provider)
to the appropriate ISP.

> Who assigns IP's to them?

They used DHCP with ADSL ( I said there were some dial-ups but I was mistaken, all use ADSL now)

> The content providers? How do you sync up with them for the DNAT?

They sync up for SNAT. They have to authenticate via Web (before the firewall/router to ISP),
after that a some rules are added automagically to the firewall by a third interface.
Since all use ADSL accounting can be done by crossing (ADSL modem ID,Dynamic IP, time, logs).

              /------- Web Auth-v
client pool -                   | 
              \ ----- Firewall/Router----------(ISP pool)
                                   \------------  "
                                   \------------- "

> The whole NAT solution between the medium provider
> and the content provider is still a bit vague to me, especially when you
> sell static IP's to the customers...

In fact there are no more static addresses, I mixed up some scenarios in my
previous e-mails ;o) 

 
> > What we did was to use a priority queue and hashtables to implement full
> > NAT to FTP and H.323 only (our immediate needs by then).
> 
> Feel free to elaborate on this priority queue/hashtables implementation
> to solve FTP/H.323 problem. Sounds like an extendable thing for other
> unfriendly protocols.

We dropped that solution because it was focused in kernel 2.2 and iproute2.
Basically we had a priority queue acting as a self-made conntrack module.
We have chosen in favour of a priority queue "statistically"
betting in better performance, supposing client traffic would be in bursts
during short periods of time. That proved to be  more efficient than using a hashtable 
as the top level indexing structure.

I do not know in what data structures the current conntrack/filtering is based, 
did not have the time (and the need!) to check it out. For the time being I trust
is is fast/smart enough. If it becomes a bottleneck, then we'll see !

best regards
Senra     

-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

