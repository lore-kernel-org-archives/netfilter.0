From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: simple nat dilemma
Date: Thu, 13 Jun 2002 17:09:44 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131610.RAA08217@slate.rockstone.co.uk>
References: <B9002B34.C58%patrick@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <B9002B34.C58%patrick@wechsler.com>
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

On Thursday 09 May 2002 6:33 pm, patrick conlin wrote:

> Hello everyone,
>
> Let me preface this by saying that I am seriously disappointed by my
> failure to figure out what I'm doing wrong here, and any admonitions I
> receive from ramin for being an idiot will be appreciated.

Will you appreciate it as much if I call you an idiot first :-) ?

> I'm trying to get the nat machine (bulgakov) to make zamyatin look and feel
> like 207.224.76.204 for all external activity, inbound and outbound.

Have you applied the network address 207.224.76.204 to the external interface 
of the firewall, so that it receives packets for that address ?

You either want to do:

ifconfig eth0:1 217.224.76.204 netmask w.x.y.z

or use the ip command from the iproute2 package if you have this on your 
system (can't quote you the syntax as I don't use it myself).

By the way, if this solves your problem, I don't think you were an idiot.

If you've already done this, and the problem turns out to be something else, 
then I'll wait before deciding :-)

 

Antony.

