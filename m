From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: OS Fingerprint
Date: Tue, 30 Nov 2004 08:21:21 -0600
Message-ID: <41AC81E1.1050506@pbl.ca>
References: <20041129215739.81923.qmail@web53403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041129215739.81923.qmail@web53403.mail.yahoo.com>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Vlado Had wrote:
> hi, could somebody help me, how can i change
> osfingerprint in packets?

Take a look at:

http://voodoo.somoslopeor.com/papers/nmap.html

Also, properly configuring firewall (by doing TCP flags checks) might
also prevent nmap from easilly detecting OS you are running.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


