From: Philip Craig <philipc@snapgear.com>
Subject: Re: netfilter files in a case-insensitive filesystem
Date: Thu, 01 Jun 2006 15:40:25 +1000
Message-ID: <447E7DC9.9010809@snapgear.com>
References: <20060523202744.GO31607@lios>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060523202744.GO31607@lios>
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

On 05/24/2006 06:27 AM, Carlos O'Donell wrote:
> Such files conflict in a case-insensitive filesystem. This is a problem
> for users building on Windows, or installing the headers on a Windows
> case-insensitive filesystems.
> 
> The structures in the conflicting files seem to have unique names. Is it
> possible to merge both files together?

Depends what exactly you are trying to do.  If you are just trying to
build an application that uses them, then you could probably merge them;
have you tried?  Building the kernel would require more work.


