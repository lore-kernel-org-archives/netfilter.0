From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 18:36:45 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <B98BE374FDFB3A71F6ED1D44@[10.169.6.246]>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Content-Disposition: inline
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

--On Thursday, September 16, 2004 2:36 PM +0300 Alexandros Papadopoulos 
<apapadop@alumni.carnegiemellon.edu> wrote:

> This is exactly what I'm planning to do; I've got my mind set on having
> the two VPN endpoints inside two NATed networks, both managed by
> respective dedicated linux boxes running only netfilter.

If you're not wedded to IPSec, you might try OpenVPN, which runs over SSL. 
I found it a lot easier to get working.

<http://openvpn.sourceforge.net/>



