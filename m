From: "Afshin Lamei" <linux_st@hotmail.com>
Subject: problem making iptables run at startup
Date: Mon, 02 Dec 2002 11:56:54 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F166FU4xTuplxGIcSHN0000f6cd@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,
I've installed the iptables-1.2.7.a (without any patches). when I try to use 
" chkconfig " to have iptables run at startup, I recieve this error :
unrecognized service.
after this, I copied the 3 binary files (iptables, iptables-restore ...) in 
the /etc/init.d and /etc/rc.d/init.d,
now I recieve this error:
service iptables does not support chkconfig.
can anyone help me?
regards,
--afshin lamei

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


