From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 20:30:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there>
References: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com>
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

On Thursday 27 June 2002 8:10 pm, Joe Patterson wrote:

> catching the third packet is easy.  The hard part is to both catch the
> third packet and *not* catch all of the rest of the ack packets.
>
> There are some distinguishing characteristics... it is the first packet
> sent by the client that is in state ESTABLISHED.  it should have ACK set
> and no other flags.  the tcp data length should be zero.

Isn't that in itself a bit of a giveaway ?   I can't think of a reason why a 
zero-length packet should ever occur in the remainder of the data stream... ?

There's a -m length --length <min>:<max> match somewhere, but I'm not sure if 
it's in the standard build or p-o-m

 

Antony.

