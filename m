From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Can netfilter do this?
Date: Thu, 25 Mar 2004 12:14:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403251214.06537.gdh@acentral.co.uk>
References: <4062C994.5000506@rochester.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4062C994.5000506@rochester.rr.com>
Content-Disposition: inline
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

On Thursday 25 March 2004 11:59, Joe Mott wrote:

> Is netfilter capable of knowing when someone is crafting SMTP (or FTP or
> HTTP or ...) packets that violate RFC rules to exploit a vulnerability
> in some server?

No, application-level filtering / analysis is outside the scope of netfilter. 

Try http://www.snort.org/ 

Cheers,
Gavin.

