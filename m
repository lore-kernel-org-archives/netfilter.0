From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 09:36:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4149A4D5.2010209@pbl.ca>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Alexandros Papadopoulos wrote:
> I stumbled across 
> http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which 
> states that "NAT breaks VPNs".
> 
> Is this just an over-simplifying statement that really means "if you're 
> reading this, then don't even try setting up a NAT-traversing VPN"?

Yes and no.  Depends on what you mean by VPN.  VPN can be implemented in 
many different ways.  With IPSec implementation you may run into 
problems (some solvable, some not).  With user space daemon 
implementations such as OpenVPN or VTun, you shouldn't have any 
problems.  Basically it is good idea not to have VPN endpoints behind 
NAT (if possible, of course).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

