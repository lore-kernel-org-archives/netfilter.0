From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 22:20:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <086201c226c5$4567f990$3200a8c0@jungle.funkybadger.org>
References: <40c701c226bd$a51c87a0$2901a8c0@amos> <20020708205030.ECXA4119.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Antony Stone wrote:

> On Monday 08 July 2002 9:25 pm, Nathan Cassano wrote:
>
> > Remember HTTP runs over UDP protocol also.
>
> WHAT ?????
>
> RFC # ?

I'd disagree with that statement as well, but as a side note HTTP is
not limited to TCP. RFC2616 (HTTP/1.1) says:

<quote>
1.4 Overall Operation
[...]
HTTP communication usually takes place over TCP/IP connections. The
default port is TCP 80 [19], but other ports can be used. This does
not preclude HTTP from being implemented on top of any other protocol
on the Internet, or on other networks. HTTP only presumes a reliable
transport; any protocol that provides such guarantees can be used;
[...]
19.6.3 Changes from RFC 2068
[...]
4. Modified some TCP-specific language, to make it clearer that
non-TCP transports are possible for HTTP.
</quote>

UDP, however, doesn't fit the definition of "reliable transport", IMO.

Adam


