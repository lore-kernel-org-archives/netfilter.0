From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Thu, 12 Aug 2004 08:46:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16667.26279.947301.153918@saint.heaven.net>
References: <20040811200045.GA6472@uglabng.math.gatech.edu>
	<SERVER74ZDgC81TbdkS00000016@server7.bandwidthco.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <SERVER74ZDgC81TbdkS00000016@server7.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

Mark E. Donaldson writes:

> My views are this: If you are going to reset a TCP connection, it is best to
> do so at the earliest possible moment of a TCP session, preferably after the
> initial syn of the three-way handshake. When I use "-j REJECT --reject-with
> tcp-reset" it is always in response to a NEW (thus syn) packet.

There are times when the earliest possible moment is long after the
initial syn.  For example: you ssh from A to B and then someone
reboots B while you're idle.  When B is back up, if it simply DROPs
packets that aren't established and aren't syns, your ssh session will
appear hung.  A reset makes it clear the session is terminated.

--
Dick St.Peters, stpeters@NetHeaven.com 
Gatekeeper, NetHeaven, Saratoga Springs, NY

