From: Khanh Tran <khanh@slc.edu>
Subject: module performance
Date: Sat, 15 Feb 2003 08:16:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E1@EXCHANGE>
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

Does anyone feel like giving a somewhat detailed explanation of the
differences in loading the ip_tables modules versus building it into the
kernel?  I've got several RedHat Linux firewalls and when it comes to
upgrading the kernels, loading ip_tables as  modules is easy.  Otherwise, I
have to upgrade my kernel and then go back and re-compile ip_tables into the
kernel.  This has proven to be much more time consuming, especially with the
growth of ip_tables use on our network.

Thoughts?  Thanks in advance?

Khanh Tran
Network Operations
Sarah Lawrence College


