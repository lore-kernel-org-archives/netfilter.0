From: Phil C <flah@hell.com>
Subject: Re: help accepting unbound addresses
Date: Sat, 15 May 2004 14:51:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040515185108.GA82869@adsl195.cofs.net>
References: <20040515002908.GU78829@adsl195.cofs.net> <20040515033249.GW78829@adsl195.cofs.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040515033249.GW78829@adsl195.cofs.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

A temporary resolution to my question, which is far from ideal (not very
scalable):

Put subnets on the loopback, to accept packets as they come in on 443.
Add a DNAT rule, for the but bound port 80 traffic, which routes traffic
out to the correct destination.

I was really hoping for something far more dynamic than this, but it'll have
to do in a pinch. The ideal solution would be to simply accept any packet
on a single interface and deliver it as local (without modifying the destination
address). That would allow me to simply route new subnets to my stunnel box
and have 0 configuration updates on the stunnel box, but alas it doesn't seem
feasible. :(

If anyone has any suggestions, please let me know.

-- 
<flah@hell.com>
01101000011000010110110001100110

