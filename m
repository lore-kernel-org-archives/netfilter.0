From: rgriffin12 <rgriffin12@nc.rr.com>
Subject: accidentally deleted iptables-restore
Date: Tue, 3 Dec 2002 12:33:29 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1098337.1038947609890.JavaMail.Administrator@atp>
Reply-To: rgriffin12@nc.rr.com
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
To: netfilter@lists.netfilter.org

Hello,

I accidentally deleted my iptables-restore command. I looked around to see
if there was a way to recover and found debugfs to search for inodes, but
this is not revealing any result.

I am new to Linux, so I am not sure what to do. Does anyone know of a way to
recompile/install the binary w/o having to re-install the package. 

btw, i got my firewall back up and running by adding to file /etc/rc.local,
but I would rather have the script run before my network interfaces are
enabled. 

If anyone has another solution it would be greatly appreciated.

Thanks,

Reg

