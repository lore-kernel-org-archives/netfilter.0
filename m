From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Iptables Block Netbios Broadcasts UDP 137-138
Date: Tue, 23 Nov 2004 14:58:19 -0600
Message-ID: <41A3A46B.3050803@pbl.ca>
References: <20041123205139.64577.qmail@web54502.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041123205139.64577.qmail@web54502.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Real Cucumber wrote:
> I cannot block LAN netbios broadcasts on a fedora core
> 2 Iptables box being used as an IDS.

If your IDS is reading directly from network interface (like network 
sniffers such as tcpdump or ethereal do), than it bypasses the firewall. 
  You'd need to configure your IDS software to ignore whatever you 
consider "normal" traffic on your network.  But be warn, the more you 
ignore, the less you see.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

