From: xavier renaut <list.netfilter@natch.dyndns.org>
Subject: Re: split iptables log from messages
Date: Wed, 21 May 2003 17:04:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521210411.GL12302@natch.8d.com>
References: <IHEHKFMEMKMGFDMIAHCIKENEDMAA.borda@netwall.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <IHEHKFMEMKMGFDMIAHCIKENEDMAA.borda@netwall.com.br>
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
To: Leonardo Borda <borda@netwall.com.br>
Cc: netfilter@lists.netfilter.org

On Wed, May 21, 2003 at 12:18:43PM -0300, Leonardo Borda wrote:
|Hello
|
|Does anynone know how to split iptables logs from /var/log/messages ?
|


you could check ulogd
http://gnumonks.org/projects/project_details?p_id=1

here is what i do :

LOG --log-level debug  

*.*;auth,authpriv.none;kern.!=debug     -/var/log/syslog
*.=info;*.=notice;*.=warn;\
        auth,authpriv.none;\
        cron,daemon.none;\
        mail,news.none          -/var/log/messages
*.*                             -/var/log/all.log
kern.=debug                             -/var/log/iptables.log


bye


-- 
xavier renaut

