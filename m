From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Scary Hole in the Firewall?
Date: Mon, 19 Jul 2004 20:50:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407192050.56542.Antony@Soft-Solutions.co.uk>
References: <1090265344.11052.7.camel@dchws.tqmcube.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090265344.11052.7.camel@dchws.tqmcube.com>
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
To: NetFilter List <netfilter@lists.netfilter.org>

On Monday 19 July 2004 8:29 pm, David Cary Hart wrote:

> Platform = Fedora 2
> IPTables firewall. Snort running inside the firewall.
>
> Here's the log entry. This is the default log entry prior to DROP. In
> other words, what gets logged, gets dropped.
>
> Jul 19 14:32:39 mail kernel: DEFAULT - Firewall: IN=eth0 OUT=
> MAC=00:4f:4e:12:f9:93:00:09:5b:c9:37:54:08:00 SRC=203.202.150.156
> DST=192.168.0.31 LEN=404 TOS=0x00 PREC=0x00 TTL=111 ID=4719 PROTO=UDP
> SPT=1042 DPT=1434 LEN=384
>
> Here's the Snort log:
>
> [**] MS-SQL Worm propagation attempt [**]
> 07/19-14:32:39.314347 203.202.150.156:1042 -> 192.168.0.31:1434
> UDP TTL:111 TOS:0x0 ID:4719 IpLen:20 DgmLen:404
> Len: 376
> =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
>
> [**] MS-SQL version overflow attempt [**]
> 07/19-14:32:39.314347 203.202.150.156:1042 -> 192.168.0.31:1434
> UDP TTL:111 TOS:0x0 ID:4719 IpLen:20 DgmLen:404
> Len: 376
>
> Now what?

Well, without seeing your firewall ruleset, we can't offer much advice about 
why this packet got caught by snort.

Also, where is eth0 on your firewall?   Inside or outside?   I notice that the 
log entry says it came in on eth0 but didn't go out, therefore it's not being 
routed....

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


