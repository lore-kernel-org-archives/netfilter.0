From: Stephen J Smoogen <smoogen@lanl.gov>
Subject: Re: ip_conntrack: table full, dropping packet
Date: Fri, 24 Sep 2004 09:19:02 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41543AE6.2060800@lanl.gov>
References: <e73cec8004092401074a667c3a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e73cec8004092401074a667c3a@mail.gmail.com>
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
To: "www.piratehosting.net" <webmazter@gmail.com>
Cc: netfilter@lists.netfilter.org

www.piratehosting.net wrote:
> 512mb ram
> about 150,000 connections
> its a ircd server with 15 clients at 1024 users each.
> i have to keep moving it up as the conntrack doesnt empty
> 


Depending on the linux kernel you are using.. this is a 'known' bug. Red 
Hat Linux for the 7,8,9 series has a patch from netfilter experimental 
that does not let go connections. There is also another kernel version 
that seems to have this issue (2.4.18?) but I cant remember which one it 
was. Putting on the latest 2.4.x kernel with a clean netfilter patch 
fixed the problem on our boxes.

-- 
Stephen John Smoogen	        | CCN-5 Security Team
LANL SIRT Team Leader           | SMTP:  smoogen@lanl.gov
Los Alamos National Laboratory  | Voice: 505.664.0645
Ta-03 SM-1498 MS: B255 DP 10S   | FAX:   505.665.7793
Los Alamos, NM 87545            |

