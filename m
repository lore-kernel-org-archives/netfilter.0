From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp again
Date: Tue, 15 Jun 2004 15:57:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406151557.43940.Antony@Soft-Solutions.co.uk>
References: <BAY15-F34STM4fkm908000a429c@hotmail.com> <169101c452e5$fb31a660$49caa8c0@caris.priv>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <169101c452e5$fb31a660$49caa8c0@caris.priv>
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

On Tuesday 15 June 2004 3:35 pm, Peter Marshall wrote:

> when I try to run the ip_conntrack_ftp module using the command
> "modeprobe ip_conntrack_ftp" or
> "/sbin/modeprobe ip_conntrack_ftp" it says module not found.
>
> I searched for the module on my system and it does exist in
> "/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/"

What does "uname -r" tell you for the kernel version you are running?

If this doesn't match 2.4.20-8 then modprobe (note spelling?) will not be able 
to find the above file.

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


