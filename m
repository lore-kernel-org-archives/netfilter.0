From: Bart Duchesne <bd@able.be>
Subject: PPTP conntrack problems
Date: Thu, 13 Nov 2003 21:36:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB3EB3D.70107@able.be>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm running  kernel 2.4.21 with patch-o-matic 20030922; iptables and 
friends work fine.
But we have 'strange', 'random' PPTP problems, we are running poptop on 
the fw and have the conntrack pptp helpers loaded also.

Connections to the  PPTP server on the gateway don't always succeed.
The most reoccurring error we get is a decaps_hdlc operation not 
permitted error; if I unload the conntrack modules everything works fine.

I have searched the archives and noticed the same behaviour I while ago, 
has anyone seen this problem also with the 20030922 p-o-m  fixes from 
Harald regarding PPTP.

We also see much Message too long errors in the GRE packets; is ithis an 
MTU problem on the carrying device or IN the tunnel ?

Hope someone can turn my light on because it's getting dark in here and 
I don't know anymore.

Bart



