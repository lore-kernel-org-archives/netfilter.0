From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: TCP flags
Date: Wed, 6 Nov 2002 13:12:35 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211061308420.24889-100000@dns.toxicfilms.tv>
References: <005401c2856b$099aa5c0$0bc8c80a@dolphin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005401c2856b$099aa5c0$0bc8c80a@dolphin>
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
To: Jet <yenjet.chan@eglobal.com.my>
Cc: "netfilter@lists" <netfilter@lists.netfilter.org>

Hello,

> Can anyone just explain what is this means?
>
> iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
>
> I don't quite understand why there is a white space between SYN,FIN and
> SYN,FIN.
iptables -p tcp --help
explains that it is:
 --tcp-flags [!] mask comp   match when TCP flags & mask == comp
                             (Flags: SYN ACK FIN RST URG PSH ALL NONE)

So if we want tcp packets having only SYN and FIN set, and no other flags,
we need the packets flags & SYN|FIN == SYN|FIN.

Where & means a logical AND.
Example.
IF a packet comes with SYN|ACK|FIN flags set, we logically AND it with
SYN|FIN (mask), we get SYN|FIN, and thus we get a match with SYN|FIN (comp)


Regards,
Maciej Soltysiak



