From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: NTP
Date: Fri, 2 Jul 2004 12:06:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407021206.41670.gdh@acentral.co.uk>
References: <40E53FAE.1070007@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E53FAE.1070007@4Dllc.com>
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

On Friday 02 July 2004 11:57, Steve Comfort wrote:
> Hi all,
>
> Could someone tell me what rules I need in order to enable NTP?

Simply allow incoming UDP on port 123. The 'normal' way is for both the source 
and destination ports to be 123, but it is common (esp. with debugging) for 
the source port to be >1024.

Cheers,
Gavin.

