From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: accessing a internal port fowarded email server from the internal network
Date: Mon, 8 Dec 2003 01:57:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312080157.57000.Antony@Soft-Solutions.co.uk>
References: <3FD3D65E.7000405@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD3D65E.7000405@yahoo.com.au>
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

On Monday 08 December 2003 1:39 am, TN wrote:

> Hi all,
>
> I have a problem which I thought I'd seen the solution so somewhere, but
> I just can't find the posting anymore.
>
> I have an iptables firewall, and I port forward to an internal email
> server on a 192.168.10.0/24 LAN network.
> This all works fine, external email comes & goes OK. My problem is that
> I want to allow internal network users to address the email server using
> the external IP address of the firewall.
>
> Currently, laptop users internal to the network need to then become
> external when they work external to the LAN, and they have to either
> setup 2 different email accounts (one using the internal email server IP
> address, and one using the external IP address), or they have to
> remember to change their server settings each time they move from
> internal to external and vice-versa. Both of these are a pain for them.

Configure the machines to connect by hostname instead of IP address, and use 
split DNS to give the internal address to internal enquiries, and the 
external address to external enquiries.

Alternatively put the mail server on a perimeter network instead of the 
internal LAN, then both internal and external clients can connect using the 
external IP address.

The reason your existing setup doesn't work is that internal clients connect 
to the extenal address, which gets translated to the internal address, which 
then replies direct to the client (ie not back through the reverse nat on the 
firewall), therefore the client connects to address A and gets a reply from 
address B, confusing it and making it unhappy.

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


