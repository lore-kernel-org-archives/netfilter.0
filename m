From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 20:37:02 +0000 (UTC)
Message-ID: <Pine.NEB.4.62.0506222034050.9177@ukato.freeshell.org>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
	<42B9C979.9080701@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42B9C979.9080701@riverviewtech.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

On Wed, 22 Jun 2005, Taylor, Grant wrote:

> # Drop any Null scan packets.
> iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ALL NONE -j DROP
>
> # We could put any matches for any other type of scan that we wanted to here too.
>
>
> # Allow any stateful traffic back in.
> iptables -t filter -A FORWARD -i $INet -o $LAN -m state --state ESTABLISHED,RELATED -j ACCEPT

TCP packets without flags are possible during a normal TCP connection, you 
don't want to drop them. --state ESTABLISHED,RELATED would never let in 
NULL scans anyway, because a NULL scan won't establish a valid TCP 
connection before it sends flagless packets.

 			Alexey

