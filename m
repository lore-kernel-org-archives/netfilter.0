From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: what services/protocols can't be handled by RELATED,ESTABLISHED?
Date: Tue, 28 Oct 2003 16:53:24 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310281643520.25084-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  i'm giving a tutorial on iptables next week -- very basic, just 
protecting a single host so all i'll be covering is filtering on
INPUT and OUTPUT.

  to keep things *really* simple, my example will look something
like this:

  IPT -P INPUT DROP
  IPT -P FORWARD DROP
  IPT -P OUTPUT ACCEPT

  IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
  IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

there will be more, of course -- tossing in some logging, and opening
up the host to a couple of services, perhaps ssh -- and that's about it.

  now i know some people wince at seeing the "OUTPUT ACCEPT", but if i
really lock down the INPUT filtering, then in most cases, allowing 
arbitrary output is not going to hurt me that much (although i will
be careful to point out the alternative, which is to rigorously filter
on the OUTPUT chain as well).

  however, my actual question is, if i want to allow pretty much all 
outgoing service requests, which services/protocols will need more
support than just allowing "RELATED,ESTABLISHED" packets back in?

  for example, FTP is a little more complicated than the average
service, but that's handled specifically by the ftp_conntrack module,
right?  same with IRC.  then there's DNS, in which my system will
want to contact a nameserver out there somewhere.  and perhaps samba,
when i try to mount a share.

  in short, what are the services that will require special treatment
to support because they don't follow the basic client-server model?

rday


