From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: Re: Bandwidth Limiting (rate-limit) through IPTABLE
Date: Sun, 20 Feb 2005 08:04:47 -0500
Message-ID: <20050220130447.GC14253@mtholyoke.edu>
References: <1108874009.42181319912c0@mail.gnvfc.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1108874009.42181319912c0@mail.gnvfc.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: spdesai@gnvfc.net
Cc: netfilter@lists.netfilter.org

On Sun, Feb 20, 2005 at 10:03:29AM +0530, spdesai@gnvfc.net wrote:
> Hello all
> 
> I am using IPTABLE for below purpose onlyy..
> 
> To restrict ping from/to LAN
> To restrict ftp from/to LAN
> To restrict telnet from/to LAN
> To restrict site from/to LAN
> To restrict messanger from/to LAN
> To restrict particular port like IMAP/pop3 from/to LAN
> 
> Pl. let me know the whether IPTABLE can use in any other way ..i.e any other 
> purpose in which IPTABLE can be use.
> 
> can IPTABLE use for bandwidth limiting..????

Not directly.  There are some other features which may be used for
limiting connections.  A good article about this here:

http://linuxgazette.net/108/odonovan.html

See iproute2 and tc for QOS stuff like bandwidth limiting.

-- 
Ron Peterson
Network & Systems Manager
Mount Holyoke College
http://www.mtholyoke.edu/~rpeterso

