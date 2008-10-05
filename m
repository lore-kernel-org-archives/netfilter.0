From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re:
Date: Sun, 05 Oct 2008 00:14:30 -0500
Message-ID: <48E84D36.20206@riverviewtech.net>
References: <S1752389AbYJDKwq/20081004105246Z+121@vger.kernel.org> <20081004112000.258830@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081004112000.258830@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/4/2008 6:20 AM, Sebastian Seemann wrote:
> What happens if an IP is not found in the geoip-database, so it has 
> no country-code at all? Is it accepted or not?

I don't know for sure what the GeoIP match extension will do if the IP 
is not in the database.  I would expect the match to fail.  However with 
inverse logic included I'd guess that the failure would turn in to a 
success.  But with out testing, this is only a guess.

> I would suppose it is accepted and, since I wanna be sure, would be 
> thankful for a workaround simpler than adding every country in the 
> world but the forbidden one.

I would be tempted to re-write your rule like this

    iptables -A INPUT ! -m geoip --src-cc [country] -j ACCEPT

The difference being that you are moving the negative logic out of an 
unpredictable failure situation (GeoIP not knowing where the IP is from) 
to a controlled situation (IPTables inverting the result of a match 
extension).

Further, the GeoIP match extension should only return a successful match 
/if/ the source IP is in said source country.  Rather GeoIP will not 
match if the IP is included in the database but not associated with said 
country.  Likewise GeoIP should not success on an unknown IP because it 
could not make a match.

With GeoIP behaving more predictably you can have IPTables test for 
GeoIP *NOT* matching.



Grant. . . .
