From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: Stateful firewalling via IPTABLES fails to track FTP passive connections?
Date: Mon, 7 Oct 2002 10:00:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210071000.51185.mklingens@ism.nl>
References: <000a01c26d18$2e24c6c0$0500000a@widgets>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c26d18$2e24c6c0$0500000a@widgets>
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

On Sunday 06 October 2002 11:10, Hubris_1 wrote:
> So, my question boils down to this - does IPTables inspect the PASV request
> and reply to open the correct FTP data port if using stateful inspection?
> Or do you essentially need to open all high-level ports to get passive FTP
> working?

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

should do it.
-- 
Martijn


