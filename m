From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 5 May 2005 12:07:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505051149490.21461@blackhole.kfki.hu>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
	<42794F67.7060803@danbbs.dk> <4279570A.1090509@riverviewtech.net>
	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
	<4279E96C.7010304@danbbs.dk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4279E96C.7010304@danbbs.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mogens Valentin <monz@danbbs.dk>
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

Hi,

On Thu, 5 May 2005, Mogens Valentin wrote:

> >>>How about using a fifo (man mkfifo and man syslog) and let syslog pipe
> >>>to that fifo. Some program can then read from the fifo, parse data, and
> >>>maybe use a database for storing the parsed, now more limited, data.
> >>>Might be a good ide to have the database on another system :-
> >>
> > Why where a FIFO and a program which parses and transmit the data to
> > another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
> > the wheel?)
>
> It might not.. AFAIK, the FIFO is implemented not as disk I/O, but is a
> memory thingy.
> It *appears* as file I/O, but the filesystem is used only to create that
> named pipe.
> Hence, my thought was that since logging with iptables has to go throu
> syslog, this might offload faster through a FIFO.
> The app reading the FIFO would preprocess the datastream and turn it
> into chunks, exactly as Taylor put it.
> Depending on what one really wants to look at / dig out of logging, the
> FIFO-reading app could also reduce data.

At standard syslog, you can rely on its internal (not-tunable) buffering.
At syslog-ng, you can speficy explicitly the buffer size (output queue
size) per destination. At the ULOG target, you can specify how many
packets should be queued in-kernel, before transmitting a multipart
message to userspace.

And as it was mentioned by others as well, one should offload real
logging to another machine over a dedicated wire.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

