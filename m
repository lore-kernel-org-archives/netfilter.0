From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 21:39:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404012139.16863.Antony@Soft-Solutions.co.uk>
References: <E1B98i2-000R7B-7m@alf1.lmb.internal>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1B98i2-000R7B-7m@alf1.lmb.internal>
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

On Thursday 01 April 2004 9:22 pm, T. Horsnell (tsh) wrote:

> Hmmm. I thought it went like this:
>
> The client application requests a random high port
> on the client machine (a socket). Then, using this
> socket it makes a request to the required well-known
> port (e.g. 22 for ssh) on the server machine.
> Since no other application on the client box will ever

"Ever" is not quite right - "simultaneously" or "concurrently" would be 
better.   Another application might be given the same port number sometime 
later, once this connection is over and done with.

> be given the same high-numbered port as any other
> application on that box, the client-ipaddr/highPort +
> server-ipaddr/wellKnownPort combination defines a unique
> 'circuit' over which further communication takes place.

Yes, and it is this four-part combination which makes up a connection tracking 
table entry in netfilter.

> The client doesnt have to do special things to tell the
> server what its connecting port-number is.

The source port is included in the TCP packet header (as is the destination 
port).   That's how the server knows which port to send the response back to 
on the client.

> Until along comes ftp, which has a command channel and
> a data channel. So having made a connection in the
> above way for the command channel, the client and server
> have to make further negotiations for a data channel.

Yes.   Whoever thought that was a good way to do things wasn't thinking about 
security.

> And firewalls have to be aware of this.

Indeed :(

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


