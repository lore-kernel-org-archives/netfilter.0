From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How do I Translate Seq & Opt?
Date: Tue, 20 Jan 2004 15:41:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401201541.24004.Antony@Soft-Solutions.co.uk>
References: <1074612414.1800.21.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074612414.1800.21.camel@dchws.TQMcube.com>
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
To: Iptables Mailing List <netfilter@lists.netfilter.org>

On Tuesday 20 January 2004 3:26 pm, David C. Hart wrote:

> What is this telling me? Example:
>
> Jan 20 09:50:18 mail2 kernel: Firewall: IN=eth1 OUT=
> MAC=00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 SRC=141.156.35.166
> DST=192.168.0.31 LEN=48 TOS=0x00 PREC=0x00 TTL=121 ID=56322 DF PROTO=TCP
> SPT=3134 DPT=445 SEQ=1244763263 ACK=0 WINDOW=64170 RES=0x00 SYN URGP=0
> OPT (0204059201010402)
>
> What do I need to read to learn how to understand this?

A TCP/IP book would probably be best - I can recommend Craig Hunt's O'Reilly 
book.

As soon as you look at what fields exist inside TCP, UDP, ICMP, IP etc headers 
I don't think you'll have any problem understanding what the abbreviations 
used in netfilter's log format refer to.

Have you checked the tutorials and other documentation on the netfilter home 
page at http://www.netfilter.org to see whether anyone discusses the log 
entries in detail?   I can't say I can point you at one which I know does, 
however I wouldn't be surprised if someone who's done a good job on netfilter 
itself (Oskar Andreassen comes to mind) has also discussed the logging...

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


