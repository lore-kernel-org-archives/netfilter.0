From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: FTP
Date: Tue, 11 Mar 2003 13:02:46 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303111300370.12840@dns.toxicfilms.tv>
References: <ABEKJILKOKKGGDJKHKDFGECCCAAA.patrick@vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFGECCCAAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

> I figured out what the problem was with my FTP server... it needed a port
> range of 2095-2300 open for some reason.
Well, are you using the ip_conntrack_ftp module?
It should let you use the -m state --state RELATED, ESTABLISHED with ftp.

Unless you are doing NAT.

Regards,
Maciej

