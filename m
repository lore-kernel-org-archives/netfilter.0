From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Flag SYN not necessarily state NEW?
Date: Sun, 16 Jun 2002 19:30:43 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206161830.g5GIUlA30385@Networker.rockstone.co.uk>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan> <1024250696.6468.3.camel@geggo>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1024250696.6468.3.camel@geggo>
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
To: NetFilter Mailinglist <netfilter@lists.samba.org>

On Sunday 16 June 2002 7:04 pm, Geog Hofstetter wrote:

> hmm is it possible that (if u use target LOG) your syslog just shows up
> 'blah: SYN packet received'
> 'last message repeatet 2 times'

I would hope not - both the Source Port and the TCP ID number should be 
different for the two connections, and since these are both included in the 
LOG output from netfilter, the messages would not be identical...

Antony.

>     >>On Wed, 8 May 2002, Ing. Christian Ogris wrote:
>     >> I connect from Box A via SSH to Box B, where the firewall runs, and
>     >> i get the state "NEW" on the first packet.
>     >> Then - the first connection is still established - i connect AGAIN
>     >> from Box A to Box B and do NOT get the state "NEW" anymore. (So
>     >> obviously it's already accepted by the ESTABLISHED,RELATED -j ACCEPT
>     >> rule). Is this behavior correct?

