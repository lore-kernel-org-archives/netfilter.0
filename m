From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 5 May 2005 10:15:50 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505051010140.21324@blackhole.kfki.hu>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
	<42794F67.7060803@danbbs.dk> <4279570A.1090509@riverviewtech.net>
	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
	<4279CA3E.3000104@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4279CA3E.3000104@riverviewtech.net>
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

On Thu, 5 May 2005, Taylor, Grant wrote:

> > Why where a FIFO and a program which parses and transmit the data to
> > another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
> > the wheel?)
>
> It is my belief that Syslog and the mechanism that it uses to log is not
> meant for extreme volume of login.  As I understand it Syslog will log
> each and every individual packet that passes through the IPTables LOG
> target individually, thus causing a write through the kernel in to
> SysLog space and possibly to disk for a VERY small amount of data.

That depends on how syslog is configured - you can easily disable syncing
at every log event.

> Where as TCPDump or Snort will dump to memory for a specific amount of
> time or amount of traffic captured and then write a large group of
> packets as one write.

I have looked trough the man page of tcpdump and could not find any
indication of this feature. How should one run tcpdump in order to enable
in-memory buffering?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

