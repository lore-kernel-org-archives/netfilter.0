From: "Julius Wijaya" <wijayaj@gmx.net>
Subject: Re: Allow incoming https traffic on INPUT filter
Date: Sun, 04 May 2003 08:15:08 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305040815080121.00F15483@smtp.nikonbw.com>
References: <20030504003128.42126.qmail@web40210.mail.yahoo.com>
Reply-To: wijayaj@gmx.net
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030504003128.42126.qmail@web40210.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: James Marcinek <james_marcinek@yahoo.com>, netfilter@lists.netfilter.org

First of all,
If you want to check for port 443, use nmap instead.

$ nmap localhost

or you can use netstat

$ netstat -a

those tools will give some some information about open port
then you check on your iptables for ssl, you need eth0 and eth1 (if you
have two NIC) to accept ssl either from LAN or WAN.

regards.
JW

*********** REPLY SEPARATOR  ***********

On 03/05/2003 at 17:31 PM James Marcinek wrote:

>I just turned on my ssl with my apache. My intranet
>can get to the site however not from the extranet? I
>tried opening port 443 however I can't see the port
>open when I issue an iptables -L command. Can anyone
>help?
>
>Thanks,
>
>James
>
>__________________________________
>Do you Yahoo!?
>The New Yahoo! Search - Faster. Easier. Bingo.
>http://search.yahoo.com




