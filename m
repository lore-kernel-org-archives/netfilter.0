From: Dai MIKURUBE <dmikurube@acm.org>
Subject: Generating pseudo-packets with netfilter
Date: Tue, 19 Dec 2006 22:50:23 +0900
Message-ID: <4587EE1F.8050203@acm.org>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm a student at Tokyo Institute of Technology.

I'd like to do following operations, and I thought do them
with netfilter. But I don't know hot to do this actually.

Could you tell me...
- Can I do the following operations with netfilter?
- If I can, how to do them?



My purpose is to make the Linux Kernel believe that a packet
has come. (In fact, any packet has not arrived.)


I could do this without netfilter but with tunneling device as follows.

[Any UserProcess] - [Kernel] - <Tunnel> - [Intermediate Process] - <Physical eth0>

"Intermediate Process" usually passes any packet through,
and send a packet into "Kernel" via "Tunnel" if necessary.



Finally, I'd like to do this without tunneling device as follows.

[Any UserProcess] - [Kernel] - ((???)) - [Physical eth0]

At first, I thought that netfilter can act as ((???)) with
my Kernel Module. But netfilter seems to be not able to
generate packets out of nothing...


Can I do this with netfilter?
# If not, I'd like to know another way to do this... :-(

Thanks,

-- 
Dai MIKURUBE
    dmikurube@acm.org

