From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Broken fwmark
Date: Sun, 2 Jun 2002 23:39:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206022239.g52MdJA10657@Networker.rockstone.co.uk>
References: <Pine.LNX.4.33.0206022311320.10014-100000@shaun.sheddy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206022311320.10014-100000@shaun.sheddy.net>
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

On Sunday 02 June 2002 11:23 pm, Steve wrote:

> I've written a small script which shows that the packets are getting
> watermarked but the replies are losing the mark. In the example below I
> am pinging (from another machine) an IP bound to eth2 on the machine
> itself.
>
> Jun  2 22:52:32 kernel: PRE SET    IN=eth2 OUT= MAC=xx SRC=1.2.3.4
> DST=4.3.2.1 LEN=84 TOS=0x00 PREC=0x00 TTL=55  ID=28633 PROTO=ICMP TYPE=8
> CODE=0 ID=65293 SEQ=0
> Jun  2 22:52:32 kernel: IP SET     IN=eth2 OUT= MAC=xx SRC=1.2.3.4
> DST=4.3.2.1 LEN=84 TOS=0x00 PREC=0x00 TTL=55  ID=28633 PROTO=ICMP TYPE=8
> CODE=0 ID=65293 SEQ=0
> Jun  2 22:52:32 kernel: OP UNSET   IN=     OUT=eth2    SRC=4.3.2.1
> DST=1.2.3.4 LEN=84 TOS=0x00 PREC=0x00 TTL=255 ID=53296 PROTO=ICMP TYPE=0
> CODE=0 ID=65293 SEQ=0
> Jun  2 22:52:32 kernel: POST UNSET IN=     OUT=eth2    SRC=4.3.2.1
> DST=1.2.3.4 LEN=84 TOS=0x00 PREC=0x00 TTL=255 ID=53296 PROTO=ICMP TYPE=0
> CODE=0 ID=65293 SEQ=0

I'm no expert on packet marking, but why should a reply packet automatically 
pick up the mark of whatever it's a reply to ?   I mean, where would the mark 
get applied ?

These 'marks' are only internal codings within netfilter - they do not exist 
within the packet in any way, so I don't really understand how one packet's 
mark could get transferred to a different packet.

The only place your ruleset was setting a mark was in the PREROUTING chain, 
and packets generated locally don't go through that, which is why the 
echo-reply packets being generated on the machine are not getting marked.


Antony.

