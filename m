From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: vpn problem
Date: Sat, 9 Apr 2005 17:23:02 +0200
Message-ID: <48366.2903112874$1113060068@news.gmane.org>
References: <42580075.7050007@elte.hu>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42580075.7050007@elte.hu>
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

Hi,

you are going the right path, but... 

I would set up a VPN gateway ( poptop for example ), and when they connect
they could get a static IP. Based on this static IP it would be easy to
control their access to db, file or some other server or service on your
network. This would be easy to set up if you have not more then 20 users (
IMHO ). This is only an idea and it is probably not the perfect solution ;)

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Nagy Zoltan
Sent: Samstag, 09. April 2005 18:20
To: netfilter@lists.netfilter.org
Subject: vpn problem


hi

i'm think about how can i set up a vpn on our lan,
and make possible that not all systems are reachable by the connected vpn
users
something like that user A have access to our data servers only, but user B
can access the database,firewall servers
i'm thinking about that if the clients can login to the vpn gw server i
could use gid match to put the clients ip in a recent list,
and i can use the recent lists to mark the packets and filter by that ;)
i'm thinking about that i've missed something...and there is a simpler
solution ;)


kirk




