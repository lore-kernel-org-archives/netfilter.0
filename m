From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DROP vs. REJECT vs. MIRROR
Date: Thu, 13 Jun 2002 18:03:45 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131704.SAA08562@slate.rockstone.co.uk>
References: <200205180511.g4I5B0R02342@gauss.counterexample.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205180511.g4I5B0R02342@gauss.counterexample.org>
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

On Saturday 18 May 2002 6:11 am, John T. Guthrie wrote:

> Hello all,
>
> Please pardon me if this is answered elsewhere.  I have tried looking
> through all of the documentation, but I am still left wondering what are
> the advantages/disadvantages of the DROP, REJECT, and MIRROR targets?  I
> know what they do, but I'm not quite certain as to what are some of the
> situations when I would want to use each.  (I know that this may fall more
> under the heading of "site policy".  I'm more interested in examples of why
> people chose what they did.)  I am especially interested in examples of the
> MIRROR target.

Basically:

You DROP packets when you don't want the sender to get anything back (ie as 
far as they're concerned, there wasn't a machine waiting to receive them on 
that IP address).   It's by far best if you can make sure you DROP *all* 
packets which are not being routed by your firewall (and of course you don't 
run any services *on* the firewall, do you :-) so that the machine is 
invisible on the net - if you DROP some, and ACCEPT or REJECT some, then a 
program such as nmap will know there's something there which is actively 
DROPping things.

You REJECT packets when you want to sender to get a connection reset, which 
will make their client respond much more quickly with "connection lost" or 
some such.   ie you don't want them to be waiting around for a long time 
whilst the TCP connection times out.

My recommendation for choosing between these two is to DROP packets from the 
outside (people you don't know and don't have any incentive to be nice to), 
and REJECT packets coming from the inside (people on your local network who 
you presumably want to get a quick and efficient response that the connection 
cannot be made).

I've never used MIRROR, and although it can sound quite cool, you should be 
careful about using it, as it is pretty aggressive.   Basically anything 
which comes in will be sent back to the source IP address, so someone port 
scanning you will actually end up port scanning themselves.   The main 
problem is when they port scan you with spoofed source addresses mixed in, 
and you end up scanning someone else's system, who may (a) not like it, or 
(b) block access from your network address/es.

Like you, I'd be interested to hear of anyone using MIRROR for good reasons.

 

Antony.

