From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forward rule can't specify destination address?
Date: Thu, 6 Jun 2002 21:18:10 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206062018.g56KIBA03225@Networker.rockstone.co.uk>
References: <Pine.LNX.4.33.0206061501450.2909-100000@mcewen.wcnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206061501450.2909-100000@mcewen.wcnet.org>
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

On Thursday 06 June 2002 8:10 pm, skmail@mcewen.wcnet.org wrote:

> Hi all-
>
> I have a linux box with 1 network card connected the internet with 7
> internet IP's, and 1 network card and internal ip.  I'm trying to forward
> a port from one of the internet ip's aliased to it across the firewall to
> internal.  Here's the forward rule that I use:
>
> $IPTB -A FORWARD -d 1.2.3.4 -p tcp --dport 3389 -j ACCEPT
>
> When I connect to the specified IP address it doesn't work.  If I take the
> destination IP out it works fine.  Any ideas as to why it won't work with
> the destination IP?

Presumably you are doing DNAT at the same time.   Is 1.2.3.4 the original 
destination address before translation, or the real destination address of 
the translated packet ?

PREROUTING happens before FORWARDing.


Antony.

