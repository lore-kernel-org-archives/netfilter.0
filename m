From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ssh
Date: Mon, 24 Jun 2002 14:31:28 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241331.OAA15709@slate.rockstone.co.uk>
References: <001101c21b79$fcb15cb0$0803020a@daniel>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001101c21b79$fcb15cb0$0803020a@daniel>
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

On Monday 24 June 2002 1:23 pm, Daniel Sercaianu wrote:

> Hello,
>
> How can I drop ssh packets for destination hosts to which destination port
> is unknown and different from 22/tc?.

I can think of two answers to this:

1. You can't.   Netfilter / IPtables works by port number, not by content, so 
you can only filter by port number.

2. You allow through the traffic on the port numbers you want, and you block 
everything else.   Doesn't stop someone running an SSH server on port 80, 
though, if you're trying to allow web access.

 

Antony.

