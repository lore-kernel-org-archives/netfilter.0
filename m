From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange log info from iptables ?
Date: Sun, 29 Feb 2004 10:31:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291031.04792.Antony@Soft-Solutions.co.uk>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com> <20040227190555.214cbc6e.Information-Cascade@ntlworld.com> <000d01c3fea4$ea271f70$de0aa8c0@comp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c3fea4$ea271f70$de0aa8c0@comp>
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

On Sunday 29 February 2004 9:17 am, Bo Jacobsen wrote:

> What is the following log info. It looks like some kind of combined ICMP
> and DNS ?

Log entries for ICMP packets include the data in the body of the ICMP packet, 
which is the header of the packet the ICMP is about.

Remember that ICMP provides the error messages on the Internet, about other 
(usually UDP) packets, so they contain information about the packet which 
caused the error.

> Feb 29 10:02:03 WFx-SH kernel:
> DROP-OUT:IN= OUT=eth0 SRC=192.168.1.2 DST=212.54.64.171
> LEN=198 TOS=0x00 PREC=0xC0 TTL=64 ID=30626
> PROTO=ICMP TYPE=3 CODE=3 [SRC=212.54.64.171 DST=192.168.1.2 LEN=170
> TOS=0x00 PREC=0x40 TTL=59 ID=53582
> PROTO=UDP SPT=53 DPT=59554
> LEN=150 ]

Everything up to the [ is info about the ICMP packet.

Everything between [ and ] is info about the UDP packet which the ICMP is in 
response to.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


