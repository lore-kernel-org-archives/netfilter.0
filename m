From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: tcp/udp ports (was: Re: HTTP Port forwarding issues)
Date: Tue, 9 Jul 2002 09:15:22 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709141522.GA798@valjean.si.ocslink.com>
References: <40fb01c226c7$5014e810$2901a8c0@amos> <02070911523900.05759@Lms>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070911523900.05759@Lms>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Tue, Jul 09, 2002 at 11:52:39AM +0200, Jan Humme wrote:
| Of course, HTTP runs over TCP, but who can explain why in /etc/services:
| http		80/tcp		www www-http	# WorldWideWeb HTTP
| http		80/udp		www www-http	# HyperText Transfer Protocol

The IANA frequently allocates the same port for both protocols.  Take a
look at RFC 1700.  You'll see that most services have both TCP and UDP
ports reserved, even though most probably use only one of them.

| Ports and port numbers are different for TCP and UDP, right?

Correct.  Look at ports 512, 513, and 514 in /etc/services.

-James


