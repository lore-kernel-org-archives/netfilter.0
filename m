From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP delay, solved
Date: Fri, 14 Jun 2002 10:16:11 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206140919.KAA11256@slate.rockstone.co.uk>
References: <002101c2137b$e44d6de0$638317d2@pacific.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002101c2137b$e44d6de0$638317d2@pacific.net.au>
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

On Friday 14 June 2002 9:17 am, David Luyer wrote:

> Ah.  I missed the start of the discussion.  You're blocking ident
> lookups on your customers, and it's causing them to have problems
> accessing some sites and services?
>
> Easy solution:
>
>   deny (connection reset) rather than drop the connections

Yes, that's the "hole in my firewall" I referred to.   By sending back RST to 
packets coming in on TCP port 113, I'm telling people there's a firewall 
there.   All other ports send back nothing, and I don't want this one to 
stand out as being different....

> Hard solution:
>
>   transproxy ident

Explain please ?

>   and return a cryptographic hash representing
>   the actual client online on the IP which the ident request is
>   for

Sounds more than most situations would need.   Why bother to send back 
something actually related to the user (yes, I know this is what Ident's 
expecting, but it's not necessary) ?   So long as Ident responds with 
*something* (such as 'no-user') then the remote server will be happy and talk 
to you without a timeout.

The problem is making sure this only happens in response to an outgoing 
packet (ie the Ident request gets treated as RELATED to the initial 
connection), rather than providing an Ident daemon which answers any request 
which comes in (eg port scan).

 

Antony.

