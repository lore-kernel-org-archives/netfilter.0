From: "David Luyer" <david@luyer.net>
Subject: RE: TCP delay, solved
Date: Fri, 14 Jun 2002 17:15:02 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <01b801c21373$340fe960$638317d2@pacific.net.au>
References: <200206131205.NAA07068@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206131205.NAA07068@slate.rockstone.co.uk>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

[ ident lookups causing tcpd to be slow ]

> There's no satisfactory answer to this problem at present, I think.

umm, reading the manual?

man 5 hosts_access [on Debian Linux at least]

CLIENT USERNAME LOOKUP
       When  the client host supports the RFC 931 protocol or one
       of its descendants (TAP, IDENT, RFC 1413) the wrapper pro--
       grams  can retrieve additional information about the owner
       of a connection. Client username information, when  avail--
       able,  is  logged  together with the client host name, and
       can be used to match patterns like:

          daemon_list : ... user_pattern@host_pattern ...

       The daemon wrappers can be configured at compile  time  to
       perform  rule-driven  username  lookups  (default)  or  to
       always interrogate the client host.  In the case of  rule-
       driven  username lookups, the above rule would cause user--
       name  lookup  only  when  both  the  daemon_list  and  the
       host_pattern match.

So it's a compile option on tcpd.  Recompile with it disabled.

David.


