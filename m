From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip address routing setup
Date: Wed, 5 Jun 2002 00:37:44 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042337.g54NbjA14262@Networker.rockstone.co.uk>
References: <002101c20c20$0cfbcab0$1e00a8c0@neox>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002101c20c20$0cfbcab0$1e00a8c0@neox>
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

On Wednesday 05 June 2002 12:32 am, Jack Baker wrote:

> Hi there, I currently have a set of global ip addresses from my isp (/29
> block) lets say 192.168.0.5/29 for example.
>
> My gateway set currently on my set of ip addresses is 192.168.0.5
>
> I recently got another block (/29) ip addresses say on 192.168.1.64/29.
>
> One of my original ip addresses the isp has set for routing the new
> block. Lets say 192.168.0.7. Network ip would be 192.168.1.64, and
> broadcast ip at 192.168.1.71.

I don't quite understand what you mean by this - can you explain in more 
detail please ?

> Now since they have different subnets, anyone know how I get one to
> route to another. Do I need a get a hardware router or is there a way to
> do it on redhat 7.2/7.3?

If you have a Linux box with two network cards, then you already have a 
hardware router :-)


Antony.

