From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: REJECT sends more than just RST?
Date: Thu, 6 Nov 2003 13:05:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311061305.hA6D5bj13952@agate.rockstone.co.uk>
References: <3FAA4480.2D98@sat.dundee.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FAA4480.2D98@sat.dundee.ac.uk>
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

On Thursday 06 November 2003 12:54 pm, Andrew Brooks wrote:

> Hi,
>
> I'm trying to reject SMTP connections by sending a RST but it
> seems to be sending SYN ACK before sending RST which isn't what
> I want.  I'm using shorewall 1.2.8 and kernel 2.4.18.  Is this
> a known problem, and, if so, which release fixes it?

What rule/s are you attempting to use to do this?

I would have thought something like:

iptables -A INPUT (or FORWARD, depending on your setup) -p tcp --dport 25 -j 
REJECT --reject-with=tcp-reset

should do the trick?

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery
                                                     Please reply to the list;
                                                           please don't CC me.

