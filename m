From: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Subject: pom for timeout fix failing
Date: Tue, 25 Mar 2003 10:50:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E80A4D8.8010000@ucdavis.edu>
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
To: netfilter <netfilter@lists.netfilter.org>

I am trying to apply the extra/ip_conntrack_tcp_timeouts fix to my 
RedHat 7.3 machine. I have installed the latest kernel-source RPM 
(kernel-source-2.4.18-27.7.x), and I ran "./runme extra, told it the 
source was in /usr/src/linux-2.4, and selected "T" to test the patch. It 
says:

Testing patch extra/ip_conntrack-timeouts.patch...
Failed to patch copy of /usr/src/linux-2.4

Am I doing something wrong here?

-- 
Stephen Lawrence Jr. - Programmer II
California Animal Health & Food Safety Laboratory System, UC Davis 
(530)-752-4614



