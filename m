From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Memory leaks in ip_conntrack?
Date: Mon, 10 Nov 2003 20:28:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311102028.hAAKSPj17096@agate.rockstone.co.uk>
References: <EFBADA8C200C2B418DA39734FD15475B0B204E@skat.sky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EFBADA8C200C2B418DA39734FD15475B0B204E@skat.sky.com>
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

On Monday 10 November 2003 8:10 pm, Kishore Dharmavaram wrote:

> Alistair & All,
>
> I believe /proc/slabinfo gives # of conntracks being used, in my tests I
> usually find slabinfo number is same as number of entries in
> /proc/net/ip_conntrack. But, after 18hrs or so the number in /proc/slabinfo
> reaches maximum and box starts refusing connections, /proc/net/ip_conntrack
> show 20 to 30 entries, I hear /proc/net/ip_conntrack is unreliable and
> broken. Anyway, I guess I have to dig into the code.

I have found /proc/net/ip_conntrack to be a reliable indicator of the number 
of connections through a system (at least, I've not had a problem of running 
out of connections unless ip_conntrack = ip_conntrack_max, and I see the 
number of connections go up and down very plausibly with the time of day), 
and I have systems running for months without a reboot.

Please let us know if you find something in the code to explain what you are 
seeing.

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery
                                                     Please reply to the list;
                                                           please don't CC me.

