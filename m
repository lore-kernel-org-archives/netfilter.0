From: "Julius Wijaya" <wijayaj@gmx.net>
Subject: Re: need help
Date: Tue, 29 Apr 2003 14:35:08 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304291435080189.013CC15F@smtp.nikonbw.com>
References: <3EAE5239.3080605@naturesoft.net>
Reply-To: wijayaj@gmx.net
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EAE5239.3080605@naturesoft.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: karthikeyan-rc@naturesoft.net, netfilter@lists.netfilter.org

You can use MAC match option

example:

IPTABLES -A INPUT -m mac --mac-source 00:00:00:00:01:11

regards.
JW

*********** REPLY SEPARATOR  ***********

On 29/04/2003 at 10:21 AM Karthik RC wrote:

>Hello ,
>   can we do IP/MAC filering through iptables..
>regards
>from karthik




