From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: ICMP Rule Problem
Date: Tue, 3 Feb 2004 16:20:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3ea69$3a426000$0e25fe96@pysiak>
References: <20040203132411.96455.qmail@web14004.mail.yahoo.com> <200402031349.22961.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> Hm.   I was only quoting from RFC792: "The ICMP messages typically report
> errors in the processing of datagrams.  To avoid the infinite regress of
> messages about messages etc., no ICMP messages are sent about ICMP
messages."
>
> Perhaps this isn't quite as clear or specific as it should be?
It sure is.
echo replies for echo requests
echo dest unreachs for eg. echo requests or timestamp requests, etc.
all are fine and seen normally in networks and on the Internet.

We are not supposed to send error messages for error messages:
eg. dest unreach for ttl-expired.
We are allowed to use error messages for information messages:
eg. ttl-expired for timestamp requests,
      net-prohib for echo replies (eg. nonstateful replies that could
      suggest inverse mapping of our network)

To conclude the issue:
- use "-p icmp --icmp-type 8/0" for matching echo requests (type 8, code 0)
- using -j REJECT --reject-with net-prohib does not require a fresh kernel
   and iptables. Only admin-prohib does.
- Yes, you are allowed in terms of RFCs to send back net-prohib for echo
   requests.

Regards,
Maciej


