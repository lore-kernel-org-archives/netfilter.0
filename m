From: Kristian Hald <kristian@hald.net>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 11:17:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40503CC8.3070504@hald.net>
References: <001201c40744$1f34a190$2a245cc2@cea05> <200403110859.53154.Antony@Soft-Solutions.co.uk> <003301c40749$b68e4280$2a245cc2@cea05> <200403110926.26421.Antony@Soft-Solutions.co.uk> <20040311093932.GV1072@samad.com.au>
Reply-To: kristian@hald.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040311093932.GV1072@samad.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I use FTwall(P2Pwall) to block Kazaa. Works quite well. 
http://www.lowth.com/p2pwall/ftwall/
Furthermore in our dormitories firewall I added blocking of the standard 
ports for P2P programs. Edonkey = 4662 and so on.
The traffic went from top to zero nearly instant.

It was then added to the dormitory rules that use of programs like 
Kazaa, Edonkey and other filesharing programs were against normal use.
Snort has been installed to check weither a person is using a P2P 
program or not and they are then warned before disconnected from the 
Internet for life.

Still people who download, however they do not generate very much 
traffic, since most people on the Internet use the standard ports, which 
are blocked.

regards
Kristian Hald


