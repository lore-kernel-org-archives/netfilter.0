From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 20:44:03 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627194405.GLHF295.mta03-svc.ntlworld.com@there>
References: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com> <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there> <20020627214407.F2890@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627214407.F2890@oknodo.bof.de>
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

On Thursday 27 June 2002 8:44 pm, Patrick Schaaf wrote:

> > > There are some distinguishing characteristics... it is the first packet
> > > sent by the client that is in state ESTABLISHED.  it should have ACK
> > > set and no other flags.  the tcp data length should be zero.
> >
> > Isn't that in itself a bit of a giveaway ?   I can't think of a reason
> > why a zero-length packet should ever occur in the remainder of the data
> > stream... ?
>
> How to TCP keepalive packets look like?

Hmmm.   Don't know.   Hadn't thought about those...

> Also, isn't it possible that the third packet already carries data, in the
> general (read TCP protocol as it is written) case?

Well, I'd always thought that this was allowed, yes, but I've also been told 
by several different people (who play with real-world networks all the time) 
that it never happens in practice - you get:

SYN (no data)
SYN/ACK (no data)
ACK (no data)
ACK (data)
ACK (data)
etc.....

> You probably won't get that with the normal socket
> interface from userlevel, but does TCP forbid it? I don't think so.

Fair point, but if Ramin's working on a real network, maybe a solution which 
works is okay, even if there's a theoretical situation when it wouldn't.

Ramin, by the way, what are you trying to do this for ?

 

Antony.

