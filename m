From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Request for knowledge update regarding mark and connmark
Date: Wed, 6 Apr 2005 19:25:21 +0200
Message-ID: <20050406172521.GB12284@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,

I haven't been following netfilter development for a while. My
production boxes are Debian woody and thus do not have very current
netfilter, but sometimes I snoop into later versions trying to see
what's cooking.

I am currently a little bit confused by the appearance of connmark.
The mechanism looks suspiciously similiar to the normal packet mark
mechanism, but is applied to entire connections. How do I use this? Is
it like allowing and denying connections? Do I put a mark on the
connection at the initial packet and the appropriate match will match
on all packets bearing this connection mark? What will packets do that
belong to a RELATED connection? Do they also have the connection mark
of the main connection?

Are there any docs, examples, best-current-practice descriptions about
when to use packet marking and when connection marking?

Additionally, I have always been very reluctant with marking since the
numeric mark seems so prone to collide when packet marking is used
for different purposes. I would like to hear how other people handle
this, maybe even look at some rulesets using marking.

Thanks for enlightening.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835


