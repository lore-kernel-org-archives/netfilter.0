From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 5 May 2005 08:59:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
	<42794F67.7060803@danbbs.dk> <4279570A.1090509@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4279570A.1090509@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

On Wed, 4 May 2005, Taylor, Grant wrote:

> > How about using a fifo (man mkfifo and man syslog) and let syslog pipe
> > to that fifo. Some program can then read from the fifo, parse data, and
> > maybe use a database for storing the parsed, now more limited, data.
> > Might be a good ide to have the database on another system :-
>
> Using a FIFO to a program that parses and transmits the data to another
> system to network might be a possibility.  Keep in mind that any
> processing that you do on the packets has to be able to be done at least
> as fast if not faster than the rate the packets come in.  If you ever
> end up getting behind on the processing things will snowball on you VERY
> quickly and more than likely end up in a very nasty mess.  This is why I
> think it would be better to use something like TCPDump or Snort to sniff
> the network and then post process the dumps.

Why where a FIFO and a program which parses and transmit the data to
another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
the wheel?)

If you sniff the network for logging, where do you actually want to sniff?
Before the firewall? You'll have to cope with the same traffic as the
firewall itself and won't see the dropped traffic on the other side.
Behind the firewall? You won't see again the dropped traffic coming from
outside. (Please note, I do not advise against an IDS inside which sniffs
the traffic.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

