From: Carlo Pires <carlo@uga.com.br>
Subject: path-o-matic-20030929.tar.bz2 doesn't apply ok with k2.4.22
Date: Tue, 30 Sep 2003 15:31:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F79CC00.3040003@uga.com.br>
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
To: netfilter@lists.samba.org

I am compiling kernel 2.4.22 with patch-o-matic-20030929.tar.bz2 and I 
notice that
 /usr/src/linux/include/linux/netfilter_ipv4/ipt_osf.h
after the patch applied don't have a #endif for #define _IPT_OSF_H
then I added a line with: #endif /* _IPT_OSF_H */ at the end of the file 
and everything compiled well.

[]s
Carlo



