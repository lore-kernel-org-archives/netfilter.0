From: Steve Snodgrass <ssnodgra@pheran.com>
Subject: Metawall 0.12 Released
Date: Wed, 30 Oct 2002 23:26:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030232606.A7157@cruncher.pheran.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm pleased to announce the release of metawall 0.12.  Metawall is a perl
script that allows you to write firewall rules in a simple metalanguage.  These
rules can then be used to generate packet filtering commands for a variety of
backend targets.  For more information, see the metawall home page:

http://www.pheran.com/metawall/

The script is also available on CPAN:

http://www.cpan.org/authors/id/S/SS/SSNODGRA/metawall-0.12.pl

Questions, comments, and bug reports are welcomed.

Changes since version 0.10:

* Replaced -i install option with more flexible -c chain name option
* Added support for TCP flags
* Added support for IP protocol numbers
* Changed what types of ICMP rules generate stateless reply rules
* Symbols may now contain '-' characters
* Fixed some buglets in symbol and token parsing
* Added a few more protocols

-- 
Steve Snodgrass * ssnodgra@pheran.com * Network and Unix Guru(?) at Large
Geek Code: GCS d? s: a C++ US++++$ P+++ L+ w PS+ 5++ b++ DI+ D++ e++ r+++ y+*
"If you want to be somebody else, change your mind."  -Sister Hazel

