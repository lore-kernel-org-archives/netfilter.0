From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Sat, 15 Jun 2002 23:33:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206152233.g5FMXPA27757@Networker.rockstone.co.uk>
References: <3D0BBC45.5000807@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D0BBC45.5000807@palaver.net>
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

On Saturday 15 June 2002 11:14 pm, Brian Capouch wrote:

> I wonder if the sages on this list might share advice as to whether or
> not it might be practical to maintain a working ISP where ALL client
> machines use private IP addresses, which are then NAT-ted to public IP
> space as necessary by iptables.
>
> The biggest drawback that has been voiced so far is that many
> peer-to-peer apps would break, but I'm not so sure right now that is bad
> thing.

Some current ISPs already do this, and I guess the popularity with their 
customers varies according to what the customers want to do :-)

I know of 'residential' accounts where the ISP gives you a private address 
and you're dynamically NATted out to the Internet (so there's no possibility 
at all of hosting incoming services), and 'business' accounts where you have 
two-way static SNAT/DNAT, where as you say above some protocols will work and 
some won't.

Technically there's certainly no reason at all why you can't do this; in 
practice it'll come down to the contract you have with your customers, and 
what they can reasonably expect to be able to do with the connection you 
provide.

Just out of interest, how are you proposing to handle bandwidth allocation - 
making sure each customer gets a reasonable bandwidth without hogging the 
whole link ?

 

Antony.

