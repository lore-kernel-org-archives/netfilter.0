From: Askar <askarali@gmail.com>
Subject: going default DROP
Date: Sat, 25 Sep 2004 11:31:20 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e5040924223152fe70b6@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi,

okay now im seriously wanted to convert the default ACCEPTED fw
machine by my predecessor to default DROP. coz it is very hard to
maintain ACCEPTED fw and im getting tired of monitoring tcpdump and
then adding new rules to firewall script.
As I told before it is a small ISP (limitations: no more then 150
users at a time) and our clients connected to us via dialup.
Before going to deploy my desired fw script I want to monitor the
users traffic for a while may be I would go outside and interview few
cyber cafes, to decide *what* to DROP and which packets to allow.
Remember our clients are not that power users, very normal in nature,
when online majority of them acccessing port 80, IM, chatting,
emailing, irc etc. we have setup a cache "squid" for port 80 related
things and its doing very well.
Therefore I thinks it would not be difficult to deploy default DROP
script, yes may be in starting days we could loose few clients ;)
As im kinda new to security and iptables stuff, however I want to
prove that this sort of  policy is possible in ISP (small) enviroment
.

=now can someone guide me what is the good way to monitor traffic i-e
what ports clients accessing and then in teh light of this i would
finialize my script.
= any sample scripts for such enviroment and links ?
Any other suggestions would be greatly appreciated.

regards
Askar

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
yer life a little easier)

