From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: logging problem
Date: 04 Aug 2003 15:48:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060004888.26856.28.camel@kermit>
References: <Law15-F96nBxUv9odwg00005771@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F96nBxUv9odwg00005771@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Afshin Lamei <linux_st@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-08-04 um 15.27 schrieb Afshin Lamei:
> hi all,
> how can I use the netfilter LOG target to log the packets in a file? am I=
=20
> required to see the logs in the system log files, or I can have a customi=
zed=20
> one?
You can use ULOG or a different syslog, like syslog-ng or msyslogd.
Both can filter based on regular expressions

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

