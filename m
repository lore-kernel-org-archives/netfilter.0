From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple Packet Forwarding
Date: Tue, 25 Jun 2002 16:14:22 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206251514.QAA20663@slate.rockstone.co.uk>
References: <20020625110630.G2549@www2.mrbrklyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020625110630.G2549@www2.mrbrklyn.com>
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

On Tuesday 25 June 2002 4:06 pm, Ruben I Safir wrote:

> I have a simple network with a gateway to DSL running on the ipaddess
>
> Internet <-->216.254.112.136(eth1 gatway machine eth0)<-->216.254.112.135
> <-->INTERNAL NETWORK

This is not my idea of a "simple network" :-)

You have assigned two addresses from the same network range to different 
ethernet cards on one machine.

It will be horribly upset and confused by this.

Change one of them so that you have two different network ranges on the two 
sides of your firewall and life will become an awful lot simpler and easier 
to handle.

 

Antony.

