From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: DOS/Crikey attacks, and ip_conntrack (retry)
Date: Mon, 20 Jan 2003 18:17:01 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301201806250.18382@dns.toxicfilms.tv>
References: <61535048953.20030119135255@dslr.net> <311608578750.20030120101825@dslr.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <311608578750.20030120101825@dslr.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: justin <cmbb@dslr.net>
Cc: netfilter@lists.netfilter.org

> 2. When the ip_conntrack table is full, are old UNREPLIED
> connections dropped to make room for new entries? (this,
> the DOS attack will not succeed), or, are random UNREPLIED
> entries removed, or, are packets just dropped?
AFAIK FAQ 3.16 says that UNREPLIED entries are stored just to keep
information, they are replaced if necesary with new conntrack entries,
then if we run out of entries, the packets are indeed dropped. This is
accompanied by a kernel syslog message: conntrack full, dropping packet.


> 4. Using the patch for NOTRACK, that provides a path that
> does not add an entry to the session table, does this mean
> the only thing that will break is any ESTABLISHED tests
> elsewhere in the rules? or does it break NAT completely
> and thus can only be used for packets coming in for services
> on the local box, not any hidden NAT'd services?
I have not seen or read about this patch, but without conntrack, NAT can
not work. The NAT box would not know to whom should the returning packets
be sent.

Regards,
Maciej


