From: Adam Sayler <asayler@qorvus.net>
Subject: Need help routing SSH and HTTP traffic from wired to wireless network interface
Date: Thu, 24 Jun 2004 00:19:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DCE7842C-C5AE-11D8-BDAE-0003938146D0@qorvus.net>
Mime-Version: 1.0 (Apple Message framework v618)
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

I'm trying to bridge a gateway computer that will allow http traffic on 
port 81 and SSH traffic on 22 from the eth0 interface to be passed 
through to the wireless mesh nodes behind the firewall on interface 
WLAN0.  The gateway system is running NoCatAuth which has its own user 
defined table that appears to stop all non-authenticated traffic.  I 
went to the NoCat wiki but did not get much help from the information 
there.

Is there a way I can NAT and forward this specific traffic to inside 
the mesh using a port forwarding or other type of setup?

Thanks,
Adam


