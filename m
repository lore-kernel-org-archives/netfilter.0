From: Magnus Boden <sarek@ozaba.cx>
Subject: Re: NAT of TFTP sessions
Date: Sun, 26 Jan 2003 21:31:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3445B4.4090706@ozaba.cx>
References: <1043539676.5018.19.camel@underworld> <20030126024127.5ab3f927.arnt@c2i.net> <001901c2c52d$c2457fd0$0a90a8c0@boris>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001901c2c52d$c2457fd0$0a90a8c0@boris>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael J. Tubby B.Sc. (Hons) G8TIC" <mike@thorcom.com>
Cc: netfilter@lists.netfilter.org

Hello,

It is in the patch-o-matic which has been split from 
iptables-x.x.x.tar.bz2 file. Download 
http://www.netfilter.org/files/patch-o-matic-20020825.tar.bz2
and it is in there.

Regards
Magnus

Michael J. Tubby B.Sc. (Hons) G8TIC wrote:
> Magnus et al,
> 
> I have several Linux firewall/gateway machines dotted around the
> UK and Europe which are basically RedHat 7.3 + Kernet 2.4.20
> + iptables 1.2.7a.
> 
> We have things on the inside like Cisco VoIP phones, print servers,
> etc. that need to be able to TFTP code or configs in from a
> server on the outside (public internet).
> 
> TFTP appears not to work and when I search google I find
> information which refers to patches to "oldnat" but not to "newnat".
> 
> Is there something that I am missing? Is there a configuiration
> module, helper, patch or something for iptables 1.2.7a which will
> fix this?
> 
> Mike
> 
> 
> 
> 
> 


