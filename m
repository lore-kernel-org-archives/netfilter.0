From: Art Reisman <astormchaser2002@yahoo.com>
Subject: tcpdump behavior not getting all packets in promisc mode
Date: Sun, 2 Jun 2002 16:52:56 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020602235256.95544.qmail@web10408.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

It is my understanding with my network interface in
promisc mode, that I should be able to see all network
packets on my LAN with tcpdump (no parameters).

For some reason I am not seeing IP traffic unless it
is destined for me or a broadcast. I replaced my HUB
with very old model to insure that it was not
switched.

Do I need to restart my interface after setting
promisc mode?

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

