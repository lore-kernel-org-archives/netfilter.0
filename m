From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: (no subject)
Date: Mon, 9 Dec 2002 23:25:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c29fd1$ec474470$0401000a@robbysan.org>
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
Content-Type: text/plain; charset="us-ascii"
To: 'Alexandros Papadopoulos' <apapadop@cmu.edu>
Cc: netfilter@lists.netfilter.org

> But, when I set the server to listen to port 2121...:
> 
> [] ftpd listens on 2121

I think this might help you :

loadmodule ip_conntrack_ftp ports=2112
loadmodule ip_nat_ftp ports=2121


Rob


