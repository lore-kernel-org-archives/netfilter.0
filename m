From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat OUTPUT chain
Date: Sun, 2 Jun 2002 15:05:39 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206021405.g52E5jA14125@Networker.rockstone.co.uk>
References: <20747.1023025372@www58.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20747.1023025372@www58.gmx.net>
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Sunday 02 June 2002 2:42 pm, gvt_lnx@gmx.net wrote:

> Hi friends, I'am reading some howto and I found that OUTPUT chain in NAT
> table is broken...? that's true?

I'm not sure about this one - I know it used to be broken; I don't know if it 
still is...

Why not just try it for yourself ?   A simple test will tell you if your 
version of netfilter can do it or not.

> Could I write a rule like this:
>
> iptables -t nat -A OUTPUT -d x.x.x.x -j DNAT --to-destination y.y.y.y

Looks okay according to the syntax in the iptables man page - try it and see. 
Put a rule like this on your machine, then telnet (or whatever) to x.x.x.x 
and see if you end up connecting to x.x.x.x or y.y.y.y


Antony.

