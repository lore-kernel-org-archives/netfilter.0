From: Bhasker Allam <allambhasker@yahoo.com>
Subject: input filter
Date: Tue, 4 Jan 2005 14:35:20 -0800 (PST)
Message-ID: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
I am a newbie and I was reading the howto for packet
filter. The howto has the following picture:

Incoming                 /     \         Outgoing
       -->[Routing ]--->|FORWARD|------->
          [Decision]     \_____/        ^
               |                        |
               v                       ____
              ___                     /    \
             /   \                   |OUTPUT|
            |INPUT|                   \____/
             \___/                      ^
               |                        |
                ----> Local Process ----

The input filtering is done only for local bound
packets and after the routing decision. Is the above
true ? Is there a facility to perform input filtering
before the routing decision ? Thanks.

Bhasker.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

