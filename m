From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: VPN rules
Date: Sat, 7 Jan 2006 22:46:40 -0600
Message-ID: <200601072246.40928.rob0@gmx.co.uk>
References: <bb8a5cd0601041418t1645bf5cke057e6e371280c45@mail.gmail.com>
	<9255886c0601050404r2c09053bo42096794b31fee13@mail.gmail.com>
	<bb8a5cd0601050431q45d60c55i284c81ca8c38f5a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bb8a5cd0601050431q45d60c55i284c81ca8c38f5a5@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 2006-January-05 06:31, Eduardo Ukstin wrote:
> iptables -A INPUT -p 47 ... (or gre)
> iptables -A INPUT -p 50 ...
> iptables -A INPUT -p 51 ...
>
> and none of these received any package. I'm afraid this is a
> proprietary vpn, at least the client is.

You will have to ask the vendor for information, or do some low-level 
investigation (i.e., packet sniffing) on your own.

Or, of course, switch to something open and documented on both ends. 
OpenVPN is my top choice for VPN.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

