From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: block kazaa
Date: Tue, 25 Mar 2003 16:57:00 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303251655060.11657@dns.toxicfilms.tv>
References: <20030325144636.21700.qmail@web80403.mail.yahoo.com>
 <20030326012710.2c9f4e37.scott@radsy.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030326012710.2c9f4e37.scott@radsy.com>
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
To: Scott Radvan <scott@radsy.com>
Cc: netfilter@lists.netfilter.org

> I am unaware of any specific netfilter technique to simply block the
> newer versions of kazaa. Wish I could help you further. Good Luck.
I have heard of people using the string match to reject packets with
"X-Kazaa-User" or some other string.

Also, you could try to block access to the network pool of dns.kazaa.com.
I think this way if the clients have not been ever using kazaa, will not
get addresses of other kazaa nodes. But it is a wild guess.

Regards,
Maciej Soltysiak

