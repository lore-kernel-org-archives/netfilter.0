From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 15:26:33 -0500
Message-ID: <42B9C979.9080701@riverviewtech.net>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

> Does it really? What if there happens to be a null-flags/xmas-flags tcp packet 
> in an otherwise well-behaved tcp connection? I'd guess it would match 
> ESTABLISHED, even if it has got null flags.

As I understand it it is not possible to have the same packet be part of a null AND xmas scan as they are the exact opposite of each other acting on the SAME flags.

As far as not having the ESTABLISHED or RELATED state allowing the scan packets through you would want to have something like this first, before our stateful rule:

# Drop any XMas scan packets.
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ALL ALL -j DROP

# Drop any Null scan packets.
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ALL NONE -j DROP

# We could put any matches for any other type of scan that we wanted to here too.


# Allow any stateful traffic back in.
iptables -t filter -A FORWARD -i $INet -o $LAN -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow any normal LAN traffic out.
# Note:  We should probably do some validity checking here but we will not for simplicity.
iptables -t filter -A FORWARD -i $LAN -o $INet -j ACCEPT

You would probably want to do a corresponding drop in the INPUT chain too.

