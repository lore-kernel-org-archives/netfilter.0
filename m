From: =?iso-8859-1?q?Stephen=20Bylo?= <stephenbylo@yahoo.com.sg>
Subject: Re: DNAT/SNAT & existing connections
Date: Wed, 16 Jul 2003 10:12:58 +0800 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716021258.95036.qmail@web13103.mail.yahoo.com>
References: <20030715140425.GB24604@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030715140425.GB24604@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Dear Ramin & List,

Thanx for your mail.  The world is getting more
mobile, so here is some detail to my problem:

A mobile host M has two interfaces 1 & 2.
M is reading an open udp stream from host S (server)
on interface 1.  Interface 1 is always on-line. 
Interface 2 is only sometimes online and the route to
2 provides much more bandwidth than the route to 1.  I
want to route the stream through the higher bandwidth
without S having to know about it.  S should always
think its communicating with the IP on interface 1.

                      ____some network___(1) slow
   S -------- NAT ---R___________________ M
                          some network   (2) fast

R = our router to two different external networks

Tcp connections should also be "kept alive" and
diverted to interface 2 on M.

After reading
"netfilter-hacking-HOWTO.linuxdoc-4.html" and
"iptables-tutorial.html" I find that existing
connections will not be "diverted" in this way, only
new connections are looked up in the NAT table.
Would it be possible to change the dst values in the
"conntrack" table as well as changing the NAT entry
when interface (2) comes on-line ?

Any other ideas ?

Thanx for any help,
Steve

 --- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> On Tue, Jul 15, 2003 at 06:01:15PM +0800, Stephen
> Bylo wrote:
> 
> > Dear list,
> > 
> > I am looking into the use of a NAT "router" to
> change
> > the destination (or source) IP addresses of
> packets in
> > existing connections.  Maybe it sounds weird why I
> > might want to do this, but I need to divert
> streams to
> > other destinations!
> > 
> > I understand from the iptables docs that only the
> > first packet of a connection is examined for NAT
> > entries, subsequent packets do not need to be
> > processed again.
> 
> They do get processed. There is a short circuit to
> identify these
> packets and avoid traversing the whole nat table.
> 
> It's not clear to me what you precisely want to do.
> 
> Ramin
> 
> > I would like all packets to be
> > examined OR I would like to be able to "reset" the
> > particular entry in the table so that the existing
> > connection will be "re-considered" again using the
> > NAT.
> > 
> > Is this possible in some way with iptables?  If
> not,
> > can you point me in the right direction to a
> solution,
> > please?
> > 
> > Thanx,
> > Steve
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Send free SMS from your PC!
> > http://sg.sms.yahoo.com 

__________________________________________________
Do You Yahoo!?
Send free SMS from your PC!
http://sg.sms.yahoo.com

