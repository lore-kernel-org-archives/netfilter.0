From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: CONNMARK save-mark and restore-mark not working ?
Date: Sun, 20 Feb 2005 17:35:05 -0500
Message-ID: <20050220223505.GA21766@elm.home.idallen.ca>
References: <20050218084044.GA31190@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050218084044.GA31190@elm.home.idallen.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ian! D. Allen wrote:
>     iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>     iptables -t mangle -A OUTPUT -j CONNMARK --save-mark
> I get no marks at all in ip_conntrack.

Kernel bug.  Neither --save-mark nor --restore-mark work in my Mandrake
kernel.  My bug report is here:

    http://qa.mandrakesoft.com/show_bug.cgi?id=13845

The work-around is in the bug report.

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

