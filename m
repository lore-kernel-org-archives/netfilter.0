From: Abraham van der Merwe <abz@frogfoot.net>
Subject: Re: clearing dont-fragment bit
Date: Thu, 9 Oct 2003 18:50:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009165049.GA4043@oasis.frogfoot.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <1065716586.5873.23.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065716586.5873.23.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

Hi Ralf                                          >@2003.10.09_18:23:06_+0200

> > Are there any iptables extensions out there that allow you to clear the DF
> > (Dont Fragment) bit in ip headers?
> If you clear the DF-Bit and use Linux on either side of the tunnel where
> the packets are fragmented you are in deep trouble, because Linux 2.4
> (when using PMTU) not only sets the DF-Bit but also clears the IP-ID
> which is needed to defragment the packets again. So, when clearing the
> DF-Bit you have to ensure unique numbers in the IP-ID field, too.

Surely if I clear the DF-bit in the mangle table then the ipstack should
only defragment the packet later on when it made a routing decision and
decided over which interface to send the packet(s) and set the IP-ID fields
and MF-bit accordingly?

Are there any other side-effects when clearing the DF-bit?

-- 

Regards
 Abraham

Who loves me will also love my dog.
		-- John Donne

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 9 Kinnaird Court, 33 Main Street, Newlands, 7700
 Phone: +27 21 686 1665 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net


