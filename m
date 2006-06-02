From: Philip Craig <philipc@snapgear.com>
Subject: Re: netfilter files in a case-insensitive filesystem
Date: Fri, 02 Jun 2006 10:14:51 +1000
Message-ID: <447F82FB.7000500@snapgear.com>
References: <20060523202744.GO31607@lios> <447E7DC9.9010809@snapgear.com>
	<20060601154514.GA4977@lios>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060601154514.GA4977@lios>
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
To: Carlos O'Donell <carlos@codesourcery.com>
Cc: netfilter@lists.netfilter.org

On 06/02/2006 01:45 AM, Carlos O'Donell wrote:
> The current goal is to be able to ship the headers for use in an
> environment which resides on a case-insenstive filesystem.
> 
> If we did the work, would the community accept such patches?

I'm not a core developer, but I'm pretty sure the answer is no.

It's not just the header files.  The source files and modules
also do this, and changing any of these breaks userspace
compatibility.


