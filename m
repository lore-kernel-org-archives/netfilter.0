From: Ivan Kanis <ivank@juliva.com>
Subject: prevent script kiddies to abuse my ppp connection
Date: Thu, 10 Oct 2002 22:29:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <15781.58154.125224.618756@juliva.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

I have a ppp connection to the internet. My connection is limited to
30 hours per month so I am watching it pretty closely. I have set up
pppd to timeout after 3 minutes of inactivity. This works most of the
time.

Some time it doesn't. Once I left my computer for an hour and I was
surprised to see that the connection was still on! I thought that one
of my proces was using the connection so i did a quick dump of ppp0. I
was surprise to see that some script kiddy was looking at my netbios
port!

Now I have been thinking of ways to prevent these silliness from
shutting down my conneciton within 3mn. If I firewall these incoming
packets I believe that it won't help me. The blocked packet will still
traverse the ppp link. So it will still be seen as "activity" to the
ppp daemon. Correct me if I am mistaken.

Is there a way to setup the the firewall to shutdown ppp if it doesnt
see any valid packets within a given time limit?

Love to hear some suggestions.

Please CC me, I am not subscribed to the mailing list.

Ivan
-- 
/-----------------------------------------------------------------------------*
|     "...Deep Hack Mode--that mysterious and       |        Ivan Kanis       |
|     frightening state of consciousness where      |     ivank@juliva.com    |
|     Mortal Users fear to tread." (Matt Welsh)     |      www.juliva.com     |
*-----------------------------------------------------------------------------/


