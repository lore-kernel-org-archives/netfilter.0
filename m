From: Nico <nico@minet.net>
Subject: Netfilter, IP Fragmentation, and local_out hook
Date: 16 May 2003 23:44:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053143079.9044.46.camel@portable>
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

Hi,

I'm currently developing a routing protocol and I used netfilter (ipv4)
for that. I placed a function on local_out hook and my routing protocol
has to add some data to some incoming skbuff.

Sometimes, i received skbuff with a size of the net device mtu, and so i
must do some ip fragmentation after adding data for my protocol.

My pb is that skbuffs seem to arrive at local_out hook already
fragmented, with an IP_DF flags set to 1 and IP_MF flags set to 0. I
tried to dump any skbuff passing through local_out hook without altering
them to see this fact. I tried sending packet with a ping -s 2000 for
example.

Is there a way to have non-fragmented skbuff with netfilter ? Because i
want to handle fragmentation with my protocol...

Thx in advance

N. Plessis

PS: sorry for my bad english...


