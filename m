From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Mon, 30 Sep 2002 13:24:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209301224.g8UCOLL03868@vulcan.rissington.net>
References: <20020929214905.GEVE27185.mta03-svc.ntlworld.com@there> <200209301152.g8UBq1L03780@vulcan.rissington.net> <20020930150513.A2517@mail.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020930150513.A2517@mail.icafe.co.tz>
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

On Monday 30 September 2002 1:05 pm, Mitesh P Choksi wrote:

> On Mon, Sep 30, 2002 at 12:51:51PM +0100, Antony Stone wrote:
> > On Monday 30 September 2002 12:06 pm, Mitesh P Choksi wrote:
> > > Let me explain more to add clarifications here.
> > >
> > > 1. I have 16 public IP addresses
> > > 2. I have LAN with almost 200 private IP addresses
> > > 3. I need to give one-to-one relation to a private IP with a public IP
> > > at any given time, automatically. something like -SNAT --to
> > > 23.23.23.0/255.255.255.240
> > > 4. I need to make sure that all connections from on private IP map to
> > > one public IP, connection to public IP should be forwarded to the
> > > private IP NATted FOR THAT PARTICULAR TIME.
> > > 5. Once the set of connections are over then the public IP should be
> > > releived for some other private IP asking for the connections.
> > > 6. I could do one-to-one SNAT for all 254 IPs, but I don't have any
> > > more than 16.
> >
> > Okay, I think I understand now.
> >
> > What determines (a) when you need to create the public to private
> > association, (b) when you can release it ?

> answers
> a. when a private IP asks for a connection to the outside world
> b. All connections from that private IP closes all the connections.
>
> Maybe SNAT does the job but i have not understood from documentation. I did
> not test since I don;t know the outcome and dont want to run it on live
> users

The standard SNAT mechanism will share multiple internal users on a single 
public IP address, it will allow unrestricted access from the client to the 
Internet, but it will not allow any traffic initiated on the Internet to 
reach the client.   Therefore it does not sound as though this will do what 
you want.

My only thought is that you may be able to log all new outbound connections, 
and all FIN/RST packets, and have some process watching the log file, and 
creating and destroying SNAT / DNAT rules on the fly as needed - however this 
would only work for TCP connections, not UDP.

Alternatively you could have a process which continually reads the connection 
tracking table, and adds the SNAT / DNAT rules when a connection appears (you 
could look for the SYN SENT state for TCP - again UDP would be more tricky), 
keeps it for the duration of any ESTABLISHED connections, and then removes it 
again when the ESTABLISHED state disappears from the table ?

You should be aware that any automatic system could get blocked by someone 
setting up a TCP connection and then simply leaving it to time out - because 
that will take 5 days, and I don't think you want to have one of your IP 
addresses tied up but unused for that length of time ?

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

