From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forward rule can't specify destination address?
Date: Thu, 6 Jun 2002 21:42:39 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206062042.g56KgfA04579@Networker.rockstone.co.uk>
References: <Pine.LNX.4.33.0206061629110.24520-100000@mcewen.wcnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206061629110.24520-100000@mcewen.wcnet.org>
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

On Thursday 06 June 2002 9:36 pm, skmail@mcewen.wcnet.org wrote:

> I'm NAT'ing it also.  Should have put these in my first email I guess.
>
> $IPTB -A FORWARD -d 1.2.3.4 -p tcp --dport 3389 -j ACCEPT
>
> $IPTB -t nat -A PREROUTING -d 1.2.3.4  -p tcp --dport 3389 -j DNAT
> --to 192.168.0.1

Okay, so 1.2.3.4 is your original address, and 192.168.0.1 is what you have 
after it's been translated...

> $IPTB -t nat -A POSTROUTING -s 192.168.0.1 -d ! 192.168.0.0/24 -j SNAT
> --to 1.2.3.4

Just out of interest, why do you specify this as well ?   Does the internal 
server sometimes initiate connections as well ?

You don't need to have this rule if the internal machine only ever *receives* 
connections from the outside (eg a web server).   The reverse translation 
gets done automatically for you by netfilter.

> Prerouting before forwarding?  So I need to specify 192.168.0.1 as the
> destination in the forward rule?

Yes :-)


Antony.

