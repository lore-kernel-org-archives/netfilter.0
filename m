From: Blesson Paul <blessonpaul@softhome.net>
Subject: Filtering in POSTROUTING
Date: Wed, 29 May 2002 15:22:03 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.0.2.1.2.20020529151609.00a54b28@mail.SoftHome.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi all
			I am trying to use iptables as  firewall. Now I want to filter the 
packets which are Masqueraded. In one of the tutorial, there is written 
that filtering is not done in POSTROUTING chain since certain packets will 
bypass the chain. Then where to filter the network traffic from internal 
network to outside
regards
Blesson Paul


