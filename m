From: "Antonio Paulo Salgado Forster" <aforster@br.ibm.com>
Subject: QoS on dynamic port allocation protocols
Date: Wed, 12 Mar 2003 22:09:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFA83BF598.09B2B5B9-ON83256CE8.000228A8@LocalDomain>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

      I'm trying to apply QoS rules on protocols that use dynamic port
allocation on secondary connections such as ftp or H323 that have a
specific iptables helper to handle them, and the problem begins when the
secondary connections startup.  Would the connmark module mark also the
seconday connections if you tells it to mark the main flow?  Or, is there
any way to to match a packet using, at the same time, the -m state --state
RELATED match and check if the related connection belongs to a ftp session?

Any ideas are appreciated. Thanks in advance.

Forster


