From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 14:09:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210041309.g94D9ML10904@vulcan.rissington.net>
References: <200210041218.26636@.> <200210040947.g949lgL10535@vulcan.rissington.net> <200210041648.00792@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210041648.00792@.>
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

On Friday 04 October 2002 12:25 pm, PayalR wrote:

> Hi all,
> Thanks a lot for the mails.
>
> > 161 - snmp - are you managing this system from elsewhere, or is this
> > machine the snmp monitor ?   UDP 161 only needs to be inbound if this
> > machine is being monitored from elsewhere
>
> Well, I don't know anyting about SNMP thing. But the guys at the server
> farm suggested I make some changes as told by them in my snmpd.conf, so
> that they say I there will be able to monitor my machine. I guess so I am
> just a client SNMP. So, which ports to keep open?

UDP 161 inbound - to listen for SNMP commands
UDP 162 outbound - to generate SNMP traps

> > > Also, nmap shows that 2002/udp globe is open. Shall I close it?
> >
> > machine already has the Slapper worm on it, since that opens UDP port
> > 2002
>
> well, my machine had a slapper worm. I removed the .bugtraq file from /tmp.
> Now still the port is open. This is very important to me. How do I close
> the port???? nmap report says,
> 2002/udp   open        globe
> How do I know where and what is globe? How do I shut it?

Sorry - don't know - never had Slapper :-)   Anyone else here got any 
experience or pointers ?

> > I would recommend setting your OUTPUT chain to ESTABLISHED,RELATED
>
> do you mean similar to INPUT rule i.e using -m and all?

Yes.

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

