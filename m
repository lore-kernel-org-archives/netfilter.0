From: "Markus Zeilinger" <mz@sea.uni-linz.ac.at>
Subject: RE: iptables Please Help
Date: Mon, 31 May 2004 13:08:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BUke3-0007ZY-SF@vishnu.netfilter.org>
References: <33934.10.0.0.199.1086001394.squirrel@10.0.0.254>
Reply-To: <mz@sea.uni-linz.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33934.10.0.0.199.1086001394.squirrel@10.0.0.254>
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

Hi Vinay,

I am not a routing expert, but I think these things are not in your hand.
You of course can configure rules that outgoing packets of your LAN are
always routet via eth1 but in the other direction?? I think your ISP has to
do that for you. Correct me guys if I am wrong!

Cheers,
Markus 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Vinay Poojary
Sent: Monday, May 31, 2004 1:03 PM
To: netfilter@lists.netfilter.org
Subject: iptables Please Help

Dear Sir,

  I have installed redhat 9.0 for my server, i have two Internet links. I
have 3 Interface cards attached to my server where the two Internet links
terminate and One Internet card for my local network.

suppose

eth0 - 10.0.0.200 (Local Lan IP address)
eth1 - 11.0.0.254  (The first Isp Link terminate let it be of tata ) eth2
- 12.0.0.254  (The second isp Link terminate Let it be of sify)

 My default gateway is Isp 1 (eth1) But the problem with these is that
they charge a lot .

 So what i want is to upload from eth1 (first Internet Link) and download
from eth2 (second Internet link).

 Please send me any iptable rule which could do this.

Thanks In advance,

Waiting for your reply,

Regards,
vinay


