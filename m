From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 15:39:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627193932.GY31466@cannon.eng.us.uu.net>
References: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com> <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there> <20020627214407.F2890@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Patrick Schaaf <bof@bof.de>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Thu, Jun 27, 2002 at 09:44:07PM +0200, Patrick Schaaf wrote:

> > > There are some distinguishing characteristics... it is the first packet
> > > sent by the client that is in state ESTABLISHED.  it should have ACK set
> > > and no other flags.  the tcp data length should be zero.
> > 
> > Isn't that in itself a bit of a giveaway ?   I can't think of a reason why a 
> > zero-length packet should ever occur in the remainder of the data stream... ?
> 
> How to TCP keepalive packets look like? Also, isn't it possible that the
> third packet already carries data, in the general (read TCP protocol as
> it is written) case? You probably won't get that with the normal socket
> interface from userlevel, but does TCP forbid it? I don't think so.

Correct. And besides when you receive data and have nothing to send
you'll ack with a zero-length packet.

Ramin

> 
> best regards
>   Patrick

