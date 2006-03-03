From: Aleksander <aleksander@krediidiinfo.ee>
Subject: Re: Connection not recognized as RELATED
Date: Fri, 03 Mar 2006 11:51:02 +0200
Message-ID: <44081186.3050401@krediidiinfo.ee>
References: <5995792B428BD840906480B184A386CBB50B7F@marvin.killerobot.com>
	<d27cd2010603021804p30d14675g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010603021804p30d14675g@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

ludi wrote:
> The module only can track the
> 21port by default.If you want to set other port,you must edit the
> source.

Are you sure? I remember seeing an option like port=XXX for the modules, 
their names are:
ip_conntrack_ftp
ip_nat_ftp

Just google this for example:
http://www.google.com/search?complete=1&hl=en&lr=&q=%22modprobe+ip_conntrack_ftp+port%22&btnG=Search

Alex

