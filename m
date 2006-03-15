From: Stefano & Alberto <polna.antlab@gmail.com>
Subject: problem between the prerouting and forward chain...
Date: Wed, 15 Mar 2006 18:01:38 +0100
Message-ID: <44184872.7010804@gmail.com>
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

Hello!
I've got a problem i can't find an explanation on: i am logging packets
on a Linux PC equipped with two wireless cards; the PC should receive
frames on an interface and forward them on the other one, behaving as a
router (it processes the packets at IP level). the log i see is at the
end of the message. I can see that the first 10 frames are reach the NAT
PREROUTING chain, but don't reach the FORWARD chain, while after a while
the same packets reach the FOWRARD chain and are regularly forwarded.
The packets are all the same, (it's a ping), but i see a delay of about
5 seconds in pinging, and i can't understand why; is that a netfilter
problem? how can i log what happens between the nat prerouting chain and
the forward chain? aren't they one after the other?

Thanks in advance
Stefano

Mar 15 17:29:56 localhost kernel: MAC CHANGED
Mar 15 17:29:56 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:10:40:00:40:01:b6:7c:c0:a8
Mar 15 17:29:57 localhost kernel: MAC CHANGED
Mar 15 17:29:57 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:11:40:00:40:01:b6:7b:c0:a8
Mar 15 17:29:57 localhost kernel: MAC CHANGED
Mar 15 17:29:57 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:12:40:00:40:01:b6:7a:c0:a8
Mar 15 17:29:58 localhost kernel: MAC CHANGED
Mar 15 17:29:58 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:13:40:00:40:01:b6:79:c0:a8
Mar 15 17:29:58 localhost kernel: MAC CHANGED
Mar 15 17:29:58 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:14:40:00:40:01:b6:78:c0:a8
Mar 15 17:29:59 localhost kernel: MAC CHANGED
Mar 15 17:29:59 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:15:40:00:40:01:b6:77:c0:a8
Mar 15 17:29:59 localhost kernel: MAC CHANGED
Mar 15 17:29:59 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:16:40:00:40:01:b6:76:c0:a8
Mar 15 17:30:00 localhost kernel: MAC CHANGED
Mar 15 17:30:00 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:17:40:00:40:01:b6:75:c0:a8
Mar 15 17:30:00 localhost kernel: MAC CHANGED
Mar 15 17:30:00 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:18:40:00:40:01:b6:74:c0:a8
Mar 15 17:30:01 localhost kernel: MAC CHANGED
Mar 15 17:30:01 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:19:40:00:40:01:b6:73:c0:a8
Mar 15 17:30:01 localhost kernel: MAC CHANGED
Mar 15 17:30:01 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1a:40:00:40:01:b6:72:c0:a8
Mar 15 17:30:01 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1a:40:00:40:01:b6:72:c0:a8:0
Mar 15 17:30:02 localhost kernel: MAC CHANGED
Mar 15 17:30:02 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1b:40:00:40:01:b6:71:c0:a8
Mar 15 17:30:02 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1b:40:00:40:01:b6:71:c0:a8:0
Mar 15 17:30:02 localhost kernel: MAC CHANGED
Mar 15 17:30:02 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1c:40:00:40:01:b6:70:c0:a8
Mar 15 17:30:02 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1c:40:00:40:01:b6:70:c0:a8:0
Mar 15 17:30:03 localhost kernel: MAC CHANGED
Mar 15 17:30:03 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1d:40:00:40:01:b6:6f:c0:a8
Mar 15 17:30:03 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1d:40:00:40:01:b6:6f:c0:a8:0
Mar 15 17:30:03 localhost kernel: MAC CHANGED
Mar 15 17:30:03 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1e:40:00:40:01:b6:6e:c0:a8
Mar 15 17:30:03 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1e:40:00:40:01:b6:6e:c0:a8:0
Mar 15 17:30:04 localhost kernel: MAC CHANGED
Mar 15 17:30:04 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1f:40:00:40:01:b6:6d:c0:a8
Mar 15 17:30:04 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:1f:40:00:40:01:b6:6d:c0:a8:0
Mar 15 17:30:04 localhost kernel: MAC CHANGED
Mar 15 17:30:04 localhost kernel: NAT_PREROUTING: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:20:40:00:40:01:b6:6c:c0:a8
Mar 15 17:30:04 localhost kernel: FILTER_INPUT: IN=ath1 OUT=
MAC=00:11:95:94:21:a2:00:0f:3d:af:99:60:08:00:45:00:00:54:00:20:40:00:40:01:b6:6c:c0:a8:0



