From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: blocking IPs by file
Date: Thu, 1 Sep 2005 18:35:15 -0500
Message-ID: <200509011835.15679.rob0@gmx.co.uk>
References: <D2EA20593E6AAD4DA6D07DE0EC12D1616306@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D2EA20593E6AAD4DA6D07DE0EC12D1616306@ebs-2200.ebasedsecurity.com>
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

On Thursday 2005-September-01 17:45, Thomas Raef wrote:
> What's the best way to block a list of IP addresses from a text file?

There was a very similar thread two days ago: "macro & iptables". But 
no, iptables won't read your text file on its own. You will have to run 
your script when you make changes.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

