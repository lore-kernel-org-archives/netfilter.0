From: Rowan Reid <rreid@studio3arc.com>
Subject: Best way to put a quota on masquaraded connections.
Date: Thu, 21 Nov 2002 15:49:57 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c291b8$b3276a70$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org




I have a linux Firewall, with about 20 Masq clients. I'm noticing that
between streaming audio/video and ftp downloads users are maxing out the
connection 500K T1. I would like to put a 128K limit per connection (
I'm assuming only 4 concorrent connections) with a total of 10
connections at a time. To add to that list I'm also hosting a website
for which I would like to reserve 128K. So in short I would like to 1.)
prioritize my connections a.webserver b. e-mail trnasmitions
c.web/ftp/streaming
How do I even start .

 
Rowan Reid
Job Captain, 
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717


