From: "Volkov, Mike" <mike@kem.ru>
Subject: blocking mechanism
Date: Fri, 14 Jun 2002 15:31:40 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D099BDC.5000709@kem.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

    I have written portmapper patch for execute external script, when 
one of RPC-service set or unset. And write Perl-script for it, which 
insert or delete rule for accepting specified RPC-service port from 
specified source-IP. External script starts in fork() (child), and when 
some RPC-services must be opened (on portmapper restart), some scripts, 
which execute `iptables' or `ipchains', try to add rules in one time. So 
have added only part of them.
    I must do external blocking mechanism for it? or exists any blocking 
mechanism in netfilter?


