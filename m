From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Spoofing
Date: Wed, 5 Nov 2003 20:10:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311052010.hA5KAAr13337@agate.rockstone.co.uk>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br> <200311051951.hA5Jpdr13332@agate.rockstone.co.uk> <1068062902.1494.25.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068062902.1494.25.camel@main.tqmcube.com>
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
To: IPTables Mailing List <netfilter@lists.netfilter.org>

On Wednesday 05 November 2003 8:08 pm, David C. Hart wrote:

> On Wed, 2003-11-05 at 14:51, Antony Stone wrote:
> > On Wednesday 05 November 2003 7:31 pm, Leandro Takashi Hirano wrote:
> > > Now I would like to know about the IP Spoofing rule, how does it works?
> > >
> > > -	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP
> >
> > Any packet with a source address in the Class C range 192.168.1.x which
> > does not come from eth0 will be DROPped.
>
> Funny I was similarly confused. What happens to packets from the LAN
> given that they don't originate from eth0?

> > These rules assume that eth0 is your internal network, and your internal
> > network range is 192.168.1.0/24.

Antony.

-- 

If you think you see a Heffalump in a trap,
make sure it isn't really a Bear with an empty honey jar stuck on his head.

