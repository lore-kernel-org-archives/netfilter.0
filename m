From: Nick Taylor <nickt@lightlink.com>
Subject: Re: OT: Pings phenomen :)
Date: Sat, 28 Aug 2004 16:27:27 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0408281620510.21465@adore.lightlink.com>
References: <213736141.20040828221628@op.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <213736141.20040828221628@op.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcin Sura <slacklist@op.pl>
Cc: netfilter@lists.netfilter.org

Whenever you saturate your link, the DSL modem has the opportunity to
queue packets.  You (or the remote server sending data to you, depending
on direction) are sending data faster than the line can handle it, so the
buffer starts filling up until it can't take any more.  Aparently this is
roughly two seconds worth of download or 5 second worth of upload.  2
seconds * 512kbit/sec = 1Mbit = 128Kbytes.  A fairly reasonable buffer
size.  4 sec * 128 Kbit/sec = 512Kbit = 64Kbyte.  So, you can see that it
doesn't take much data to put your modem several seconds behind the real
world.  Of course, the queue that would be active in a heavy DOWNLOAD
would be in the DSL modem at your ISP, whereas the queue that would govern
in an UPLOAD would be in your modem (assuming the ISP can retransmit your
data to the internet at 128Kbit -- they'd better).

If these ping times are frusterating to you, you might consider traffic
shaping and policing.  Check out lartc.org for info on traffic control.



On Sat, 28 Aug 2004, Marcin Sura wrote:

> Date: Sat, 28 Aug 2004 22:16:28 +0200
> From: Marcin Sura <slacklist@op.pl>
> To: netfilter@lists.netfilter.org
> Subject: OT: Pings phenomen :)
>
> Hi
>
>   I have 512/128 adsl. I wonder why, when I download files at full
>   speed, pings to site X are about 2000ms. But when I upload files at
>   full speed, pings to X are about 3000 to 5000ms. Can someone explain
>   this to me from tcp/ip point of view? ;)
>
> --
> Pozdrawiam
>  Marcin                         mailto:slacklist@op.pl
>
>

