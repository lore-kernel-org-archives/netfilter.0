From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Mon, 30 Sep 2002 12:51:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209301152.g8UBq1L03780@vulcan.rissington.net>
References: <20020929214905.GEVE27185.mta03-svc.ntlworld.com@there> <49031.64.86.49.17.1033383985.squirrel@www.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <49031.64.86.49.17.1033383985.squirrel@www.icafe.co.tz>
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

On Monday 30 September 2002 12:06 pm, Mitesh P Choksi wrote:

> Let me explain more to add clarifications here.
>
> 1. I have 16 public IP addresses
> 2. I have LAN with almost 200 private IP addresses
> 3. I need to give one-to-one relation to a private IP with a public IP at
> any given time, automatically. something like -SNAT --to
> 23.23.23.0/255.255.255.240
> 4. I need to make sure that all connections from on private IP map to one
> public IP, connection to public IP should be forwarded to the private IP
> NATted FOR THAT PARTICULAR TIME.
> 5. Once the set of connections are over then the public IP should be
> releived for some other private IP asking for the connections.
> 6. I could do one-to-one SNAT for all 254 IPs, but I don't have any more
> than 16.

Okay, I think I understand now.

What determines (a) when you need to create the public to private 
association, (b) when you can release it ?

Antony.

-- 

This is not a rehearsal.
This is Real Life.

