From: Tom Eastep <teastep@shorewall.net>
Subject: Re: IPT Still Driving Me Nuts
Date: Sun, 02 Nov 2003 10:16:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067796995.26406.10.camel@wookie.shorewall.net>
References: <1067796031.18240.5.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067796031.18240.5.camel@main.tqmcube.com>
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
To: "David C. Hart" <DCH@TQMcube.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Sun, 2003-11-02 at 10:00, David C. Hart wrote:
> "Nov  2 12:36:45 mail2 kernel:  -FW-  IN=eth1 OUT=
> MAC=00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 SRC=61.172.3.25
> DST=192.168.0.31 LEN=530 TOS=0x00 PREC=0x00 TTL=239 ID=21777 
> PROTO=UDP SPT=32937 DPT=1026 LEN=510"
> 
> I have eliminated the virtual internal IP. The message above is still a
> mismatch. That IP is on IF eth0 while it shows on eth1.

Are eth0 and eth1 connected to the same Hub/Switch?

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



