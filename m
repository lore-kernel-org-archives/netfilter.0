From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Limitations on connections
Date: Sun, 10 Jun 2007 16:13:34 -0500
Message-ID: <466C697E.40003@riverviewtech.net>
References: <dac71d7b0706100212u52e0f7bep9ad3644f19332875@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dac71d7b0706100212u52e0f7bep9ad3644f19332875@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/10/2007 4:12 AM, Christos Panagiotakis wrote:
> I was wondering if I can limit the established connections on a specific 
> port using iptables rules.

Try taking a look at the connlimit match extension:

http://www.netfilter.org/projects/patch-o-matic/pom-external.html#pom-external-connlimit



Grant. . . .

