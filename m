From: "J and T" <j_and_t@hotmail.com>
Subject: Stopping greedy http clients!
Date: Mon, 23 Sep 2002 17:52:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F76qUlyunxtkVO4alvo00004b24@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Is there a way to set a "speed limit" on tcp port 80 requests? Here's my=20
problem:

I have a very popular site with hundreds of pages updated dynamically every=
=20
4 hours. Since high-speed internet access has become more popular, I have=20
found more and more visitors using robots to download all pages in one quic=
k=20
multi-threaded connection. When you have a 1,000 people downloading 100=20
pages all at once you end up with a problem. I can't just block them by=20
their IP because their IPs are dynamic.

I've tried mod_throttle (by Apache), but because my site is very popular I =

have to keep a huge IP list in memory so this is super memory consuming. No=
t=20
only that, but because the list is so huge response time on the server is=20
slowed considerably.

My wish is to have a speed limit. So if a user is detected of downloading x=
=20
number of documents in x amount of time, they are DROPed. Then after a "wai=
t=20
period" they are given permission again. Experimenting a little with this=20
has caused problems. The problem is that a Web page could easily have 30=20
small images so one http requeset for page a could result in 31 requests.

I don't want to set a bandwidth limit because that will only reject users=20
who have a legit reason to be on the site. I'm only interested in=20
temporarily blocking greedy clients consuming all my resources. Right now=20
I'm on a multiple T-1 so it's not bandwidth that is the problem. The proble=
m=20
is greedy clients hitting me so hard that requests are slowed down for all =

visitors.

I know yahoo, ebay, cnn and usatoday have all experienced this problem, but=
=20
I don't know how they solved it.

Anyone have a suggestion on how to go about doing this?

Thanks


_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


