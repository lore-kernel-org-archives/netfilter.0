From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bridge + nat
Date: Mon, 19 Jul 2004 15:48:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191548.30354.Antony@Soft-Solutions.co.uk>
References: <3063e5040718224645349687@mail.gmail.com> <200407191025.44076.Antony@Soft-Solutions.co.uk> <3063e504071907313a194279@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3063e504071907313a194279@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 19 July 2004 3:31 pm, George Alexandru Dragoi wrote:

> That is what i wanted to do, with 2 NICs to make a bridge between
> internet and the LAN, assign the public ip to one of the LAN machine,
> and prite ips to the rest of machines, and to hope it will work, seems
> not, i hoped i could do this.

No.   With 2 NICs you can either bridge, or route, but not both.

With 3 NICs you could bridge 2 of them together, and route between the bridged 
pair and the 3rd NIC, however in this situation I think you would need to 
have an IP address on the bridged pair, and you say you have only 1 public IP 
address available?

> If the voip hardware/software wont work
> in nat with port forward, i wont change there with linux.
> Maybe there is a suggestion for that voip, or if i can do this with 3
> NICs, and 1 single public IP.

With only 1 public IP address I think you are stuck as soon as you assign that 
address to any machine except the VoIP server.

Why do people keep on coming up with protocols which don't work across NAT?

NAT works at OSI layer 3.   Any higher level protocols should not care about 
it.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


