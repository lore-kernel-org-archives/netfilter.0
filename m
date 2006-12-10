From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how do I target a specific machine - not ip address?
Date: Sun, 10 Dec 2006 20:37:40 +0100
Message-ID: <002101c71c92$a7a91ef0$0101000a@tanjian>
References: <457C5301.3030702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457C5301.3030702@gmail.com>
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
To: netfilter@lists.netfilter.org

>> First you can change ssh port to listen different than
>> 22, no mater which, I am hoping you know do this.

You don't really need to do that, however I would do that if I'd be
using SSH password authentication. So, when you set up SSH public-key
authenticatation you'll be quite safe: not many people will be able to
guess what your keys look like..

After that, you can setup an SSH-tunnel so that you can use NFS over the
tunnel. There are docs about SSH-tunneling all over the internet.

Or, you can setup a VPN solution.


Grts,
Rob


